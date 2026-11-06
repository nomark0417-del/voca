$git = "C:\Program Files\Git\cmd\git.exe"
Write-Host ">>> GitHub 전송 시작: https://github.com/nomark0417-del/voca.git" -ForegroundColor Cyan
& $git branch -M main
& $git push -u origin main --force
Write-Host ">>> 전송 완료!" -ForegroundColor Green

