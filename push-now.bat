@echo off
set PATH=C:\Program Files\Git\cmd;C:\Program Files\Git\bin;%PATH%
cd /d "D:\codingtest\voca"

git branch -M main
git remote remove origin 2>nul
git remote add origin https://github.com/nomark0417-del/voca.git
git push -u origin main --force

pause
