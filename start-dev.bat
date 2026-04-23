@echo off
title BUTTON SMASHER – Dev Start
color 0B

echo.
echo  Starte Button Smasher (Dev-Modus)...
echo.

where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    color 0C
    echo  [FEHLER] Node.js nicht gefunden. Bitte erst install-and-build.bat ausfuehren.
    pause
    exit /b 1
)

if not exist node_modules (
    echo  node_modules fehlt – fuehre zuerst install-and-build.bat aus.
    pause
    exit /b 1
)

call npm start
