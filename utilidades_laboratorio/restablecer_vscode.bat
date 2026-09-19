@echo off
chcp 65001 >nul
title Restablecimiento Total de VS Code (Estado de Fabrica)
color 0e

echo ================================================================
echo      RESTABLECER VISUAL STUDIO CODE A ESTADO DE FÁBRICA
echo ================================================================
echo.
echo 1. Cerrando instancias de VS Code...
taskkill /F /IM Code.exe /T >nul 2>&1

:: Pausa breve para liberar bloqueos
timeout /t 2 /nobreak >nul

echo 2. Eliminando extensiones, perfiles de usuario, caché y configuraciones...
powershell -NoProfile -Command ^
  "Get-Process -Name 'Code' -ErrorAction SilentlyContinue | Stop-Process -Force;" ^
  "Start-Sleep -Seconds 1;" ^
  "if (Test-Path '$HOME\.vscode') { Remove-Item -LiteralPath '$HOME\.vscode' -Recurse -Force -ErrorAction SilentlyContinue };" ^
  "if (Test-Path '$env:APPDATA\Code') { Remove-Item -LiteralPath '$env:APPDATA\Code' -Recurse -Force -ErrorAction SilentlyContinue };" ^
  "if (Test-Path '$env:LOCALAPPDATA\Programs\Microsoft VS Code\data') { Remove-Item -LiteralPath '$env:LOCALAPPDATA\Programs\Microsoft VS Code\data' -Recurse -Force -ErrorAction SilentlyContinue }"

echo 3. Limpiando credenciales de Git y GitHub vinculadas en Windows...
cmdkey /delete:git:https://github.com >nul 2>&1

echo.
echo ================================================================
echo [EXITOSO] VS Code ha quedado completamente como de fábrica:
echo  - Sin extensiones de usuario.
echo  - Sin historial de carpetas ni archivos recientes.
echo  - Sin sesiones iniciadas (GitHub / Microsoft Settings Sync).
echo  - Sin configuraciones modificadas (settings.json en blanco).
echo ================================================================
echo.
pause
