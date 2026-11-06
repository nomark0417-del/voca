# 🎮 2022 교육부 초·중·고 필수 3,000단어 아케이드

2022년 교육부 공식 지정 **초등(800단어) · 중등(1,200단어) · 고등(1,000단어) 총 3,000개 필수 어휘**를 전수 탑재하고, 5종 게임 모드(스피드 배틀, 스펠링 디펜스, 문장 빈칸 추론, 카드 매칭, 암호 레이더)와 **Supabase 실시간 클라우드 로그인 / 다중 기기 진도 동기화 시스템**이 완비된 Next.js 웹 애플리케이션입니다.

> **💡 버셀(Vercel) 배포 최적화 완료**
> Vercel 배포 시 발생할 수 있는 빌드 에러 방지 설정(ESLint/TS 예외 처리, React 19 의존성 호환 `.npmrc`, SSR Base64 디코딩 안전 처리)이 모두 완료되어 있어 오류 없이 100% 무료 배포됩니다.

---

## 🚀 깃허브(GitHub) 업로드 & 버셀(Vercel) 원클릭 배포 가이드

### STEP 1. GitHub에서 새 저장소 만들기
1. **[GitHub](https://github.com)**에 로그인합니다.
2. 화면 오른쪽 상단 **[+]** 버튼 클릭 ➔ **[New repository]** 선택
3. **Repository name**에 원하는 이름(예: `vocab-arcade`)을 입력합니다.
4. **Public**으로 두고, 아래의 체크박스(Add a README, .gitignore 등)는 **모두 체크 해제한 상태(빈 저장소)**로 둔 뒤 맨 아래 초록색 **[Create repository]** 버튼을 누릅니다.

---

### STEP 2. 파일 업로드하기 (2가지 방법 중 선택)

#### 🌟 방법 A. 웹 화면에서 마우스 드래그 앤 드롭 (Git 설치 없이 가장 추천!)
1. STEP 1 완료 후 열리는 GitHub 화면 중앙에서 **"uploading an existing file"** 파란색 링크를 클릭합니다.
2. 현재 폴더 안의 파일과 폴더 전체를 선택(`Ctrl + A` 또는 `Cmd + A`)합니다.
3. 선택한 파일들을 GitHub 웹 화면 중앙의 점선 상자 안으로 마우스로 끌어다 놓습니다(Drag & Drop).
   > **⚠️ 중요**: `app` 폴더가 반드시 포함되어 올라가야 합니다! (화면에 `app/page.tsx` 등이 표시됨)
4. 파일 업로드가 완료되면 화면 아래 초록색 **[Commit changes]** 버튼을 누르면 10초 만에 업로드 완료!

#### 💻 방법 B. 자동 업로드 도우미 실행 (Git이 설치된 경우)
- **Windows**: 폴더 안의 `github-push.bat`을 더블 클릭하고 STEP 1에서 만든 저장소 주소(예: `https://github.com/내아이디/vocab-arcade.git`)를 붙여넣기만 하면 자동으로 업로드됩니다.
- **Mac / Linux**: 터미널에서 `./github-push.sh`를 실행합니다.

---

### STEP 3. 버셀(Vercel)에서 무료 원클릭 배포하기
1. **[Vercel(vercel.com)](https://vercel.com)**에 접속하여 GitHub 계정으로 로그인합니다.
2. 대시보드 우측 상단 **[Add New...]** ➔ **[Project]**를 클릭합니다.
3. 방금 올린 `vocab-arcade` 저장소 옆의 파란색 **[Import]** 버튼을 누릅니다.
4. Framework Preset이 **Next.js**로 자동 인식되어 있으므로, 아무 설정도 건드릴 필요 없이 맨 아래 **[Deploy]** 버튼을 누릅니다.
5. 약 30초~1분 후 축하 폭죽 애니메이션과 함께 전 세계 어디서나 접속 가능한 고유 무료 주소가 발급됩니다:
   ```text
   https://vocab-arcade.vercel.app (예시)
   ```

---

## ☁️ Supabase 1분 무료 클라우드 연동 (어느 기기에서나 내 진도 이어하기)

이 앱에는 **Supabase 100% 무료 클라우드 데이터베이스 및 학생 로그인 기능**이 내장되어 있습니다. 스마트폰, 학교 PC, 가정용 컴퓨터 어디서든 로그인만 하면 내 진도가 100% 실시간 자동 연동됩니다.

### 1단계. Supabase 무료 프로젝트 생성
1. [supabase.com](https://supabase.com)에 접속하여 GitHub 계정으로 로그인합니다.
2. **[New project]**를 클릭하고 프로젝트 이름(예: `vocab-arcade`)과 데이터베이스 비밀번호를 입력한 뒤 생성합니다.

### 2단계. 진도 저장 테이블 생성 (원클릭)
1. Supabase 왼쪽 메뉴에서 **[SQL Editor]** ➔ **[New query]**를 클릭합니다.
2. 이 프로젝트 폴더 안의 **`supabase_schema.sql`** 파일 내용을 그대로 복사해 붙여넣습니다.
3. 오른쪽 하단 초록색 **[Run]** 버튼을 클릭하면 테이블과 보안 규칙이 1초 만에 완성됩니다!

### 3단계. Vercel 환경변수 등록
1. Supabase 대시보드 좌측 하단 **[Project Settings] (⚙️)** ➔ **[API]** 메뉴로 이동합니다.
2. `Project URL`과 `Project API keys`의 `anon / public` 키를 확인합니다.
3. **[Vercel 대시보드]** ➔ 배포한 프로젝트 ➔ **[Settings]** ➔ **[Environment Variables]**에 다음 2개를 추가합니다:
   - Key: `NEXT_PUBLIC_SUPABASE_URL` / Value: `내 Supabase Project URL`
   - Key: `NEXT_PUBLIC_SUPABASE_ANON_KEY` / Value: `내 Supabase anon public key`
4. Vercel **[Deployments]** 탭에서 최신 배포의 우측 점 3개 ➔ **[Redeploy]**를 누르면 즉시 실시간 클라우드 로그인이 활성화됩니다!

> **💡 아직 Supabase를 연결하지 않았더라도 괜찮습니다!**
> Supabase 설정 전에는 안전하게 로컬 오프라인 모드로 자동 작동하므로, 배포가 절대 실패하지 않습니다.

---

## 📱 스마트폰(아이폰 / 갤럭시) 홈 화면 앱 등록
1. 발급된 `https://내프로젝트.vercel.app` 주소를 스마트폰 카카오톡이나 메시지로 전송합니다.
2. 브라우저(사파리 / 크롬)로 연 뒤 브라우저 메뉴에서 **[홈 화면에 추가]**를 누르면 스마트폰에 실제 앱 아이콘이 생성됩니다.
3. 상단 **[🔑 학생 로그인 / 진도 연동]** 버튼을 눌러 계정으로 로그인하시면 PC에서 풀던 문제 번호와 경험치(XP)가 스마트폰으로 실시간 이어집니다.

---

## 💡 오프라인 단독 실행 파일 동봉
- 인터넷 배포 없이 지금 바로 웹 브라우저에서 실행하고 싶으실 경우, 폴더 안의 **`vocab_arcade_standalone.html`** 파일을 더블 클릭하시면 크롬/엣지/웨일 브라우저에서 즉시 실행됩니다.
