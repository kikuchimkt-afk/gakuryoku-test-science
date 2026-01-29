@echo off
chcp 65001
echo ローカルサーバーを起動しています...
echo 初回起動時は「http-server」のインストールが求められる場合があります。「y」を押して続行してください。
echo.
echo サーバーが起動したら、ブラウザで以下のURLを開いてください:
echo http://localhost:8080/index.html
echo.
call npx -y http-server . -c-1 -o "index.html"
pause
