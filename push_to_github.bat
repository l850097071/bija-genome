@echo off
REM ==========================================
REM Bija-genome GitHub Push Script
REM 在能访问 github.com 的机器上运行此脚本
REM ==========================================

cd /d "%~dp0"

REM 检查是否已有 remote
git remote -v | findstr "origin" >nul
if %errorlevel% equ 0 (
    echo Remote origin already exists. Skipping add.
) else (
    echo Adding remote origin...
    git remote add origin https://github.com/l850097071/bija-genome.git
)

echo.
echo Pushing to GitHub...
git push -u origin master

if %errorlevel% equ 0 (
    echo.
    echo ======================================
    echo SUCCESS! Repository is live at:
    echo https://github.com/l850097071/bija-genome
    echo ======================================
) else (
    echo.
    echo Push failed. Possible issues:
    echo 1. Repository not yet created on GitHub
    echo    - Go to: https://github.com/new
    echo    - Name: bija-genome
    echo    - Public, NO README, NO .gitignore, NO LICENSE
    echo    - Create, then re-run this script
    echo 2. Authentication required
    echo    - Install gh: winget install GitHub.CLI
    echo    - Login: gh auth login
    echo    - Or configure git credential manager
)

pause
