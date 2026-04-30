@echo off
:: Nexus Blindado v3.0
chcp 65001 >nul
title MUSHIN FTT — DEPLOY AUTOMATICO

:: Define a pasta de trabalho usando caminhos curtos e seguros
set "FOLDER=C:\Users\kaua_\Documents\Mushin Sports - FTT"

echo.
echo ==========================================
echo    MUSHIN FTT - ATUALIZANDO SISTEMA
echo ==========================================
echo.

:: 1. Sincroniza o arquivo
echo [1/3] Sincronizando arquivos...
copy /Y "%FOLDER%\Mushin FTT.html" "%FOLDER%\index.html" >nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERRO] Nao consegui copiar o arquivo. Verifique se ele esta na pasta certa.
    pause
    exit /b
)
echo       OK!

:: 2. Entra na pasta e prepara o Git
echo [2/3] Preparando envio...
pushd "%FOLDER%"
git add index.html >nul 2>&1
git commit -m "Update Mushin FTT Elite" >nul 2>&1
echo       OK!

:: 3. Faz o envio
echo [3/3] Subindo para o GitHub...
git push origin main -q
popd

echo.
echo ==========================================
echo    SUCESSO! O App ja esta atualizado.
echo    Link: https://kauanycollas110-cmyk.github.io/mushin-ftt/
echo ==========================================
echo.
pause
