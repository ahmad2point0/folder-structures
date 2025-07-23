@echo off
echo ==========================================
echo  Jekyll Build Test
echo ==========================================
echo.

echo 🔍 Testing Jekyll configuration...

echo.
echo 🏗️ Building site...
bundle exec jekyll build

if %errorlevel% neq 0 (
    echo ❌ Build failed! Check the errors above.
    echo.
    echo Common issues:
    echo 1. Liquid syntax errors in markdown files
    echo 2. Broken internal links
    echo 3. Missing dependencies
    echo.
    pause
    exit /b 1
)

echo ✅ Build successful!
echo.
echo 🧪 Testing with production settings...
set JEKYLL_ENV=production
bundle exec jekyll build --baseurl "/react-app-folder-structure"

if %errorlevel% neq 0 (
    echo ❌ Production build failed!
    pause
    exit /b 1
)

echo ✅ Production build successful!
echo.
echo 🚀 Starting development server...
bundle exec jekyll serve

pause
