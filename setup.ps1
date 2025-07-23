# React App Folder Structure - Setup Script
# Run this script to set up the documentation environment

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host " React App Folder Structure - Setup" -ForegroundColor Cyan  
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

# Check if Ruby is installed
Write-Host "Checking if Ruby is installed..." -ForegroundColor Yellow
try {
    $rubyVersion = ruby --version 2>$null
    Write-Host "✅ Ruby is installed: $rubyVersion" -ForegroundColor Green
} catch {
    Write-Host "❌ Ruby is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Ruby first:" -ForegroundColor Yellow
    Write-Host "1. Go to https://rubyinstaller.org/downloads/" -ForegroundColor White
    Write-Host "2. Download Ruby+Devkit 3.2.x (x64)" -ForegroundColor White  
    Write-Host "3. Run the installer with default settings" -ForegroundColor White
    Write-Host "4. Install MSYS2 development toolchain when prompted" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""

# Check if Bundler is installed
Write-Host "Checking if Bundler is installed..." -ForegroundColor Yellow
try {
    $bundlerVersion = bundler --version 2>$null
    Write-Host "✅ Bundler is installed: $bundlerVersion" -ForegroundColor Green
} catch {
    Write-Host "Installing Bundler..." -ForegroundColor Yellow
    try {
        gem install bundler
        $bundlerVersion = bundler --version
        Write-Host "✅ Bundler installed: $bundlerVersion" -ForegroundColor Green
    } catch {
        Write-Host "❌ Failed to install Bundler" -ForegroundColor Red
        Write-Host "Try running PowerShell as Administrator" -ForegroundColor Yellow
        Read-Host "Press Enter to exit"
        exit 1
    }
}

Write-Host ""

# Install project dependencies
Write-Host "Installing project dependencies..." -ForegroundColor Yellow
try {
    bundle install
    Write-Host "✅ Dependencies installed successfully!" -ForegroundColor Green
} catch {
    Write-Host "❌ Failed to install dependencies" -ForegroundColor Red
    Write-Host ""
    Write-Host "Troubleshooting tips:" -ForegroundColor Yellow
    Write-Host "- Try running PowerShell as Administrator" -ForegroundColor White
    Write-Host "- Make sure Ruby+Devkit was installed (not just Ruby)" -ForegroundColor White
    Write-Host "- Check that MSYS2 development toolchain was installed" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host ""
Write-Host "🎉 Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "To start the documentation server, run:" -ForegroundColor Yellow
Write-Host "  bundle exec jekyll serve" -ForegroundColor Cyan
Write-Host ""
Write-Host "Then open: http://localhost:4000" -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to continue"
