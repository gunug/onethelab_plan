@echo off
title Chat Socket + ngrok

REM Store script directory before start command
set "SCRIPT_DIR=%~dp0"

echo ================================================
echo Chat Socket + ngrok
echo ================================================
echo.
echo Port: 9124
echo Domain: https://onetheplan.ngrok.dev
echo OAuth: gunug850@gmail.com
echo.
echo [1] Starting server (with restart loop)...
start "Chat Socket Server" /D "%SCRIPT_DIR%" cmd /k "run_server_loop.bat 9124"
echo [Wait] 3 seconds...
timeout /t 3 /nobreak > nul
echo [2] Starting ngrok tunnel...
echo.
ngrok http 9124 --domain=onetheplan.ngrok.dev --oauth=google --oauth-allow-email=gunug850@gmail.com
echo.
echo ================================================
echo ngrok closed.
echo ================================================
pause
