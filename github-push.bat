@echo off
chcp 65001 >nul
title [깃허브 업로드] GitHub에 코드 올리기 도우미
cls
set PATH=C:\Program Files\Git\cmd;C:\Program Files\Git\bin;%PATH%

echo ============================================================================
echo   🚀 [GitHub - Vercel] 깃허브 업로드 자동화 도우미
echo ============================================================================
echo.

echo  저장소(Repository) 주소: https://github.com/nomark0417-del/voca.git
echo  그대로 올리시려면 그냥 [Enter] 키를 누르세요.
echo.
set /p REPO_URL="저장소 주소 입력 [기본값: Enter]: "

if "%REPO_URL%"=="" (
    set REPO_URL=https://github.com/nomark0417-del/voca.git
)

echo.
echo [1/4] Git 환경을 설정합니다...
git config user.name "nomark0417-del" 2>nul
git config user.email "dev@voca.local" 2>nul
git branch -M main

echo [2/4] 전체 파일을 스테이징하고 커밋합니다...
git add .
git commit -m "update: 학생 로그인 탭 활성화 및 실시간 진도 연동" 2>nul

echo [3/4] 원격 저장소(%REPO_URL%)를 연결합니다...
git remote remove origin 2>nul
git remote add origin %REPO_URL%

echo [4/4] GitHub로 코드를 푸시(Push)합니다...
echo.
echo 💡 [안내] 만약 웹 브라우저나 로그인 창이 뜨면 [Sign in with your browser]를 눌러 승인해 주세요!
echo.
git push -u origin main --force

if %ERRORLEVEL% equ 0 (
    echo.
    echo ============================================================================
    echo  ✅ 깃허브 업로드가 성공적으로 완료되었습니다!
    echo  이제 Vercel에서 30초 안에 새 버전으로 자동 배포됩니다.
    echo ============================================================================
) else (
    echo.
    echo ⚠️ 오류가 발생했습니다. 브라우저 인증을 완료하신 후 다시 시도해 주세요.
)

pause
