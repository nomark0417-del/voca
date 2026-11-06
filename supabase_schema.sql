-- ============================================================================
-- 🎮 2022 초·중·고 3,000 영단어 아케이드 : Supabase 클라우드 진도 저장소 테이블
-- Supabase 대시보드 -> [SQL Editor] -> [New query]에 붙여넣고 [Run]을 누르세요.
-- ============================================================================

-- 1. 학생별 진도 데이터 저장 테이블
create table if not exists public.user_progress (
  user_id uuid primary key references auth.users(id) on delete cascade,
  email text,
  player_name text not null default '영단어챔피언',
  xp integer not null default 0,
  combo integer not null default 0,
  max_combo integer not null default 0,
  unlocked_stages jsonb not null default '[1]'::jsonb,
  selected_unit text not null default 'all',
  game_mode text not null default 'blitz',
  last_active_word_id integer not null default 1,
  last_saved_point_label text not null default '',
  used_word_ids jsonb not null default '[]'::jsonb,
  mastered_ids jsonb not null default '[]'::jsonb,
  wrong_ids jsonb not null default '[]'::jsonb,
  custom_words jsonb not null default '[]'::jsonb,
  mode_stats jsonb,
  updated_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 2. RLS (Row Level Security, 행 단위 보안 정책) 활성화
alter table public.user_progress enable row level security;

-- 3. 본인 계정의 데이터만 조회 및 저장 가능하도록 정책 설정
drop policy if exists "Users can view own progress" on public.user_progress;
create policy "Users can view own progress"
  on public.user_progress for select
  using (auth.uid() = user_id);

drop policy if exists "Users can insert own progress" on public.user_progress;
create policy "Users can insert own progress"
  on public.user_progress for insert
  with check (auth.uid() = user_id);

drop policy if exists "Users can update own progress" on public.user_progress;
create policy "Users can update own progress"
  on public.user_progress for update
  using (auth.uid() = user_id);

