@echo off
REM Deploy to GitHub Pages (Windows)
REM This script helps you deploy your documentation changes

echo ========================================
echo  🚀 Deploying Documentation to GitHub Pages
echo ========================================
echo.

REM Check if we're in the right directory
if not exist "_config.yml" (
    echo ❌ Error: _config.yml not found. Please run this script from the repository root.
    pause
    exit /b 1
)

REM Check for uncommitted changes
git status --porcelain > temp_status.txt
for /f %%i in ("temp_status.txt") do set size=%%~zi
del temp_status.txt

if %size% gtr 0 (
    echo 📝 You have uncommitted changes:
    git status --short
    echo.
    set /p commit_choice="Do you want to commit these changes? (y/n): "
    
    if /i "%commit_choice%"=="y" (
        set /p commit_message="Enter commit message: "
        git add .
        git commit -m "!commit_message!"
        echo ✅ Changes committed
    ) else (
        echo ❌ Please commit your changes before deploying
        pause
        exit /b 1
    )
)

REM Push to GitHub
echo 📤 Pushing to GitHub...
git push origin main

if %errorlevel% equ 0 (
    echo ✅ Successfully pushed to GitHub!
    echo.
    echo 🔄 GitHub Actions will now build and deploy your documentation
    echo ⏱️  This usually takes 2-3 minutes
    echo.
    echo 🌐 Your documentation will be available at:
    echo    https://ahmad2point0.github.io/react-app-folder-structure/
    echo.
    echo 📊 Monitor the deployment progress at:
    echo    https://github.com/ahmad2point0/react-app-folder-structure/actions
    echo.
) else (
    echo ❌ Failed to push to GitHub
)

pause
