@echo off
title BUTTON SMASHER – Build
color 0A

echo.
echo  ==========================================
echo   BUTTON SMASHER – Install + Build EXE
echo  ==========================================
echo.

:: Check Node.js
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    color 0C
    echo  [FEHLER] Node.js ist nicht installiert!
    echo.
    echo  Bitte zuerst Node.js installieren:
    echo  https://nodejs.org  (LTS-Version reicht)
    echo.
    echo  Danach diese Datei nochmal ausfuehren.
    echo.
    pause
    exit /b 1
)

for /f "tokens=*" %%v in ('node -v') do set NODE_VER=%%v
echo  Node.js gefunden: %NODE_VER%
echo.

:: Install dependencies
echo  [1/2] Installiere Abhaengigkeiten (npm install)...
echo        (Electron ~300 MB – kann einige Minuten dauern)
echo.
call npm install
if %ERRORLEVEL% NEQ 0 (
    color 0C
    echo.
    echo  [FEHLER] npm install fehlgeschlagen.
    pause
    exit /b 1
)

echo.
echo  [2/2] Baue Windows-EXE (npm run build)...
echo.
call npm run build
if %ERRORLEVEL% NEQ 0 (
    color 0C
    echo.
    echo  [FEHLER] Build fehlgeschlagen.
    pause
    exit /b 1
)

echo.
color 0A
echo  ==========================================
echo   FERTIG! Die EXE liegt in:  dist\
echo  ==========================================
echo.
echo  - ButtonSmasher Setup *.exe   (Installer)
echo  - ButtonSmasher *.exe         (Portable, kein Install noetig)
echo.
explorer dist
pause
