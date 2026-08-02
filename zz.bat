@echo off
chcp 65001 > nul
echo ===== Data 폴더 GitHub 업로드 시작 =====

:: 1. Git 저장소 초기화
if not exist .git (
    echo [1/4] Git 저장소를 초기화합니다...
    git init
    git branch -M main
    git remote add origin https://github.com/pandora062917/1234.git
)

:: 2. 하위 Data 폴더 및 현재 폴더 전체 추가
echo [2/4] 모든 파일 및 Data 폴더 추가 중...
git add .

:: 3. 커밋 생성
set COMMIT_MSG=Update Data: %date% %time%
echo [3/4] 커밋 메시지 작성: %COMMIT_MSG%
git commit -m "%COMMIT_MSG%"

:: 4. GitHub로 푸시 (강제 덮어쓰기)
echo [4/4] GitHub에 업로드(Push) 중입니다...
git push -u origin main --force

echo ===== 업로드가 완료되었습니다! =====
pause