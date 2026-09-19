@echo off
chcp 65001 >nul
title Limpieza de Bases de Datos de Practica (SQL Server / MySQL)
color 0b

echo ================================================================
echo     LIMPIEZA DE BASES DE DATOS DE PRÁCTICA (CESDE)
echo ================================================================
echo.
echo Este script elimina de forma segura las bases de datos de práctica
echo creadas durante las clases (ej: PROGANADO, PROGANADO2, TIENDA, HOTEL)
echo sin alterar las bases de datos maestras del sistema.
echo.

:: 1. SQL Server
where sqlcmd >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo [SQL Server detectado] Eliminando bases de datos de práctica...
    powershell -NoProfile -Command ^
      "$dbs = @('PROGANADO', 'PROGANADO2', 'TIENDA', 'PRACTICA', 'PRUEBA', 'HOTEL');" ^
      "foreach ($db in $dbs) {" ^
      "    try {" ^
      "        sqlcmd -S localhost -E -Q \"IF DB_ID('$db') IS NOT NULL BEGIN ALTER DATABASE [$db] SET SINGLE_USER WITH ROLLBACK IMMEDIATE; DROP DATABASE [$db]; PRINT '[OK] Base de datos $db eliminada de SQL Server'; END\" 2>`$null;" ^
      "    } catch {}" ^
      "}"
) else (
    echo [INFO] sqlcmd no está en el PATH o SQL Server no está corriendo.
)

:: 2. MySQL (XAMPP / MySQL Service)
set "MYSQL_BIN="
if exist "C:\xampp\mysql\bin\mysql.exe" set "MYSQL_BIN=C:\xampp\mysql\bin\mysql.exe"
where mysql >nul 2>&1 && if not defined MYSQL_BIN set "MYSQL_BIN=mysql"

if defined MYSQL_BIN (
    echo [MySQL detectado] Eliminando bases de datos de práctica...
    powershell -NoProfile -Command ^
      "$dbs = @('proganado', 'proganado2', 'tienda', 'practica', 'prueba', 'hotel');" ^
      "foreach ($db in $dbs) {" ^
      "    try {" ^
      "        & '%MYSQL_BIN%' -u root -e \"DROP DATABASE IF EXISTS $db;\" 2>`$null;" ^
      "        Write-Host \"[OK] Base de datos $db eliminada de MySQL (si existía)\";" ^
      "    } catch {}" ^
      "}"
) else (
    echo [INFO] MySQL no detectado o XAMPP no instalado en C:\xampp.
)

echo.
echo ================================================================
echo [COMPLETADO] Limpieza de bases de datos finalizada con éxito.
echo ================================================================
echo.
pause
