@echo off
chcp 65001 >nul
title Restablecimiento Total de Google Chrome
color 0c

echo ================================================================
echo           RESTABLECIMIENTO TOTAL DE GOOGLE CHROME
echo ================================================================
echo.
echo 1. Cerrando todos los procesos en segundo plano de Chrome...
taskkill /F /IM chrome.exe /T >nul 2>&1
taskkill /F /IM GoogleCrashHandler.exe /T >nul 2>&1
taskkill /F /IM GoogleCrashHandler64.exe /T >nul 2>&1

:: Pausa breve para liberar descriptores de archivo
timeout /t 2 /nobreak >nul

echo 2. Eliminando de raíz TODOS los perfiles, cuentas, historial y caché...
powershell -NoProfile -Command ^
  "Get-Process -Name 'chrome','GoogleCrashHandler','GoogleCrashHandler64' -ErrorAction SilentlyContinue | Stop-Process -Force;" ^
  "Start-Sleep -Seconds 1;" ^
  "if (Test-Path '$env:LOCALAPPDATA\Google\Chrome\User Data') { Remove-Item -LiteralPath '$env:LOCALAPPDATA\Google\Chrome\User Data' -Recurse -Force -ErrorAction SilentlyContinue };" ^
  "if (Test-Path '$env:APPDATA\Google\Chrome') { Remove-Item -LiteralPath '$env:APPDATA\Google\Chrome' -Recurse -Force -ErrorAction SilentlyContinue };" ^
  "if (Test-Path '$env:LOCALAPPDATA\Google\CrashReports') { Remove-Item -LiteralPath '$env:LOCALAPPDATA\Google\CrashReports' -Recurse -Force -ErrorAction SilentlyContinue }"

echo 3. Limpiando configuración del Registro de Windows para Chrome...
reg delete "HKCU\Software\Google\Chrome" /f >nul 2>&1
reg delete "HKCU\Software\Google\PreferenceMACs" /f >nul 2>&1

echo.
echo ================================================================
echo [EXITOSO] Chrome ha quedado restablecido a estado de fábrica.
echo ================================================================
echo.
pause
