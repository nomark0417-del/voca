@echo off
chcp 65001 >nul
title [깃허브 업로드] GitHub에 코드 올리기 도우미
cls
echo ============================================================================
echo   🚀 [GitHub - Vercel] 깃허브 업로드 자동화 도우미
echo ============================================================================
echo.

where git >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [안내] 현재 컴퓨터에 Git 프로그램이 설치되어 있지 않습니다.
    echo.
    echo 💡 가장 쉽고 빠른 방법:
    echo    Git 설치 없이 GitHub 웹사이트(https://github.com)에서
    echo    폴더 안의 파일들을 마우스로 드래그 앤 드롭(Drag & Drop)하여
    echo    10초 만에 바로 올리실 수 있습니다! (README.md 참고)
    echo.
    echo    만약 Git CLI 명령어로 올리고 싶으시다면
    echo    https://git-scm.com/downloads 에서 Git을 설치한 후 다시 실행해 주세요.
    echo ============================================================================
    pause
    exit /b
)

echo  GitHub에 새 저장소(New repository)를 만드셨나요?
echo  생성된 저장소 주소를 복사해 아래에 붙여넣어 주세요.
echo  (예: https://github.com/아이디/vocab-arcade.git)
echo.
set /p REPO_URL="저장소(Repository) 주소 입력: "

if "%REPO_URL%"=="" (
    echo.
    echo ⚠️ 주소가 입력되지 않았습니다.
    echo    README.md의 [방법 A. 웹 드래그 앤 드롭]을 참고해 주세요!
    pause
    exit /b
)

echo.
echo [1/4] Git 저장소를 로컬에 준비합니다...
git init
git branch -M main

echo [2/4] 전체 파일을 스테이징하고 커밋합니다...
git add .
git commit -m "feat: 2022 Ministry of Education 3000 Vocab Arcade complete"

echo [3/4] 원격 GitHub 저장소 연결을 설정합니다...
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo [4/4] GitHub로 코드를 안전하게 푸시(Push)합니다...
git push -u origin main
if %ERRORLEVEL% neq 0 (
    echo.
    echo [참고] 저장소에 이미 초기 파일(README 등)이 존재하여 충돌이 발생했을 수 있습니다.
    echo        강제 덮어쓰기(Force Push)를 시도합니다...
    git push -u origin main --force
)

if %ERRORLEVEL% equ 0 (
    echo.
    echo ============================================================================
    echo  ✅ 깃허브 업로드가 성공적으로 완료되었습니다!
    echo.
    echo  [다음 단계: 버셀 무료 배포 (약 1분 소요)]
    echo  1. https://vercel.com 에 접속 (GitHub 계정으로 로그인)
    echo  2. [Add New...] -> [Project] 클릭
    echo  3. 방금 올린 저장소 옆의 [Import] 클릭 후 맨 아래 [Deploy] 클릭!
    echo ============================================================================
) else (
    echo.
    echo ⚠️ 업로드 중 오류가 발생했습니다.
    echo    GitHub 웹 화면에서 [uploading an existing file]을 눌러
    echo    파일들을 직접 마우스로 끌어다 놓으시면 가장 쉽게 해결됩니다!
)

pause
