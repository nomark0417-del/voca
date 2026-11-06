@echo off
chcp 65001 >nul
title [깃허브 자동 전송]
set PATH=C:\Program Files\Git\cmd;C:\Program Files\Git\bin;%PATH%
cd /d "D:\codingtest\voca"

echo ============================================================================
echo   🚀 깃허브(GitHub) 즉시 자동 전송 중...
echo ============================================================================
echo.

git branch -M main
git add .
git commit -m "update: 학생 로그인 탭 활성화 및 진도 연동" 2>nul
git remote remove origin 2>nul
git remote add origin https://github.com/nomark0417-del/voca.git

echo 💡 깃허브 서버로 업로드(Push) 중입니다...
echo    (처음 한 번만 브라우저 로그인 창이 뜨면 승인해 주시면 됩니다!)
echo.
git push -u origin main --force

echo.
echo ============================================================================
echo  처리가 완료되었습니다! 아무 키나 누르면 창이 닫힙니다.
echo ============================================================================
pause
