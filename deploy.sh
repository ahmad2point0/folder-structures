#!/bin/bash

# Deploy to GitHub Pages
# This script helps you deploy your documentation changes

echo "🚀 Deploying React App Folder Structure Documentation"
echo "=================================================="

# Check if we're in the right directory
if [ ! -f "_config.yml" ]; then
    echo "❌ Error: _config.yml not found. Please run this script from the repository root."
    exit 1
fi

# Check if there are any uncommitted changes
if [ -n "$(git status --porcelain)" ]; then
    echo "📝 You have uncommitted changes:"
    git status --short
    echo ""
    read -p "Do you want to commit these changes? (y/n): " -n 1 -r
    echo ""
    
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        read -p "Enter commit message: " commit_message
        git add .
        git commit -m "$commit_message"
        echo "✅ Changes committed"
    else
        echo "❌ Please commit your changes before deploying"
        exit 1
    fi
fi

# Push to GitHub
echo "📤 Pushing to GitHub..."
git push origin main

if [ $? -eq 0 ]; then
    echo "✅ Successfully pushed to GitHub!"
    echo ""
    echo "🔄 GitHub Actions will now build and deploy your documentation"
    echo "⏱️  This usually takes 2-3 minutes"
    echo ""
    echo "🌐 Your documentation will be available at:"
    echo "   https://ahmad2point0.github.io/react-app-folder-structure/"
    echo ""
    echo "📊 Monitor the deployment progress at:"
    echo "   https://github.com/ahmad2point0/react-app-folder-structure/actions"
else
    echo "❌ Failed to push to GitHub"
    exit 1
fi
