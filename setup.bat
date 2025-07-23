@echo off
echo ==========================================
echo  React App Folder Structure - Setup
echo ==========================================
echo.

echo Checking if Ruby is installed...
ruby --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Ruby is not installed!
    echo.
    echo Please install Ruby first:
    echo 1. Go to https://rubyinstaller.org/downloads/
    echo 2. Download Ruby+Devkit 3.2.x (x64)
    echo 3. Run the installer with default settings
    echo 4. Install MSYS2 development toolchain when prompted
    echo.
    pause
    exit /b 1
)

echo ✅ Ruby is installed
ruby --version

echo.
echo Checking if Bundler is installed...
bundler --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Installing Bundler...
    gem install bundler
    if %errorlevel% neq 0 (
        echo ❌ Failed to install Bundler
        pause
        exit /b 1
    )
)

echo ✅ Bundler is installed
bundler --version

echo.
echo Installing project dependencies...
bundle install
if %errorlevel% neq 0 (
    echo ❌ Failed to install dependencies
    echo.
    echo Try running as Administrator or check the error messages above
    pause
    exit /b 1
)

echo.
echo ✅ Setup complete!
echo.
echo To start the documentation server, run:
echo   bundle exec jekyll serve
echo.
echo Then open: http://localhost:4000
echo.
pause
