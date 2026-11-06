import { createClient } from '@supabase/supabase-js';

// Vercel 및 로컬 환경변수에서 Supabase 설정값 로드
const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL?.trim() || '';
const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY?.trim() || '';

export const isSupabaseConfigured = (): boolean => {
  return Boolean(
    supabaseUrl &&
    supabaseAnonKey &&
    supabaseUrl.startsWith('https://') &&
    !supabaseUrl.includes('your-project')
  );
};

// Supabase가 미설정되어 있어도 빌드나 오프라인 실행이 절대 멈추지 않도록 안전 초기화
export const supabase = isSupabaseConfigured()
  ? createClient(supabaseUrl, supabaseAnonKey, {
      auth: {
        persistSession: true,
        autoRefreshToken: true,
        detectSessionInUrl: true,
      },
    })
  : null;

export interface CloudProgressPayload {
  playerName: string;
  xp: number;
  combo: number;
  maxCombo: number;
  unlockedStages: number[];
  selectedUnit: number | 'all' | 'wrong';
  gameMode: string;
  lastActiveWordId: number;
  lastSavedPointLabel: string;
  usedWordIds: number[];
  masteredIds: number[];
  wrongIds: number[];
  customWords: unknown[];
  modeStats?: Record<string, { played: number; correct: number }>;
  updatedAt?: string;
}

// 1. 회원가입 (이메일, 비밀번호, 학생 이름)
export async function authSignUp(email: string, pass: string, playerName: string) {
  if (!supabase) throw new Error('Supabase 환경설정이 필요합니다.');
  const cleanEmail = email.trim().toLowerCase();
  const { data, error } = await supabase.auth.signUp({
    email: cleanEmail,
    password: pass,
    options: {
      data: {
        player_name: playerName.trim() || '영단어챔피언',
      },
    },
  });
  if (error) throw error;
  return data;
}

// 2. 로그인 (이메일, 비밀번호)
export async function authSignIn(email: string, pass: string) {
  if (!supabase) throw new Error('Supabase 환경설정이 필요합니다.');
  const cleanEmail = email.trim().toLowerCase();
  const { data, error } = await supabase.auth.signInWithPassword({
    email: cleanEmail,
    password: pass,
  });
  if (error) throw error;
  return data;
}

// 3. 로그아웃
export async function authSignOut() {
  if (!supabase) return;
  await supabase.auth.signOut();
}

// 4. 클라우드에서 학생 진도 불러오기
export async function fetchUserProgress(userId: string): Promise<CloudProgressPayload | null> {
  if (!supabase) return null;
  try {
    const { data, error } = await supabase
      .from('user_progress')
      .select('*')
      .eq('user_id', userId)
      .maybeSingle();

    if (error) {
      console.warn('진도 불러오기 경고:', error.message);
      return null;
    }
    if (!data) return null;

    return {
      playerName: data.player_name || '영단어챔피언',
      xp: data.xp || 0,
      combo: data.combo || 0,
      maxCombo: data.max_combo || 0,
      unlockedStages: Array.isArray(data.unlocked_stages) ? data.unlocked_stages : [1],
      selectedUnit: data.selected_unit ?? 'all',
      gameMode: data.game_mode || 'blitz',
      lastActiveWordId: data.last_active_word_id || 1,
      lastSavedPointLabel: data.last_saved_point_label || '',
      usedWordIds: Array.isArray(data.used_word_ids) ? data.used_word_ids : [],
      masteredIds: Array.isArray(data.mastered_ids) ? data.mastered_ids : [],
      wrongIds: Array.isArray(data.wrong_ids) ? data.wrong_ids : [],
      customWords: Array.isArray(data.custom_words) ? data.custom_words : [],
      modeStats: data.mode_stats || undefined,
      updatedAt: data.updated_at || new Date().toISOString(),
    };
  } catch (err) {
    console.error('클라우드 진도 로드 에러:', err);
    return null;
  }
}

// 5. 클라우드에 학생 진도 저장하기 (Upsert: 없으면 생성, 있으면 갱신)
export async function saveUserProgress(
  userId: string,
  email: string,
  payload: CloudProgressPayload
): Promise<boolean> {
  if (!supabase) return false;
  try {
    const row = {
      user_id: userId,
      email: email,
      player_name: payload.playerName,
      xp: payload.xp,
      combo: payload.combo,
      max_combo: payload.maxCombo,
      unlocked_stages: payload.unlockedStages,
      selected_unit: String(payload.selectedUnit),
      game_mode: payload.gameMode,
      last_active_word_id: payload.lastActiveWordId,
      last_saved_point_label: payload.lastSavedPointLabel,
      used_word_ids: payload.usedWordIds,
      mastered_ids: payload.masteredIds,
      wrong_ids: payload.wrongIds,
      custom_words: payload.customWords,
      modeStats: payload.modeStats,
      updated_at: new Date().toISOString(),
    };

    const { error } = await supabase
      .from('user_progress')
      .upsert(row, { onConflict: 'user_id' });

    if (error) {
      console.warn('진도 저장 실패:', error.message);
      return false;
    }
    return true;
  } catch (err) {
    console.error('클라우드 저장 에러:', err);
    return false;
  }
}

