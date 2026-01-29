@echo off
chcp 65001 > nul
echo ========================================
echo   教科名 一括置換ツール
echo ========================================
echo.

set /p SUBJECT="置換する教科名を入力してください: "

if "%SUBJECT%"=="" (
    echo エラー: 教科名が入力されていません。
    pause
    exit /b 1
)

echo.
echo 教科名を「%SUBJECT%」に置換します...
echo.

powershell -ExecutionPolicy Bypass -File "setup_subject.ps1" -SubjectName "%SUBJECT%"

echo.
echo ========================================
echo   置換が完了しました！
echo ========================================
echo.
echo 次のステップ:
echo 1. start_server.bat を実行
echo 2. ブラウザで http://127.0.0.1:8080 を開く
echo.
pause
