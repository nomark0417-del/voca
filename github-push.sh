#!/usr/bin/env bash
set -e

echo "============================================================================"
echo "  🚀 [GitHub - Vercel] 깃허브 업로드 자동화 도우미"
echo "============================================================================"
echo ""

if ! command -v git &> /dev/null; then
  echo "⚠️ 현재 환경에 git 명령어가 설치되어 있지 않습니다."
  echo "GitHub 웹사이트(https://github.com)에서 마우스 드래그 앤 드롭으로 올리시거나"
  echo "git을 설치하신 후 다시 실행해 주세요."
  exit 1
fi

read -p "GitHub 저장소 주소 입력 (예: https://github.com/아이디/vocab-arcade.git): " REPO_URL

if [ -z "$REPO_URL" ]; then
  echo "⚠️ 주소가 입력되지 않았습니다. README.md를 확인해 주세요."
  exit 1
fi

echo ""
echo "[1/4] Git 저장소 초기화..."
git init
git branch -M main

echo "[2/4] 전체 파일 커밋..."
git add .
git commit -m "feat: 2022 Ministry of Education 3000 Vocab Arcade complete"

echo "[3/4] 원격 저장소 연결..."
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"

echo "[4/4] GitHub로 코드 푸시..."
if ! git push -u origin main; then
  echo "기존 파일 충돌 방지를 위해 강제 푸시를 시도합니다..."
  git push -u origin main --force
fi

echo ""
echo "============================================================================"
echo "  ✅ 깃허브 업로드 완료! https://vercel.com 에서 Import 하여 1초 배포하세요!"
echo "============================================================================"
