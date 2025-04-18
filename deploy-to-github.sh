#!/bin/bash

# Script to help deploy your portfolio to GitHub Pages

echo "===== GitHub Pages Deployment Helper ====="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: git is not installed. Please install git first."
    exit 1
fi

# Prompt for GitHub username
read -p "Enter your GitHub username: " github_username

if [ -z "$github_username" ]; then
    echo "Error: GitHub username cannot be empty"
    exit 1
fi

repo_name="${github_username}.github.io"
repo_url="https://github.com/${github_username}/${repo_name}.git"

echo ""
echo "This script will:"
echo "1. Create a local git repository"
echo "2. Add all files from this directory"
echo "3. Commit the changes"
echo "4. Push to GitHub (you'll need to create the repository first)"
echo ""
echo "Target repository: ${repo_url}"
echo ""

read -p "Have you already created the '${repo_name}' repository on GitHub? (y/n): " repo_created

if [ "$repo_created" != "y" ] && [ "$repo_created" != "Y" ]; then
    echo ""
    echo "Please follow these steps:"
    echo "1. Go to https://github.com/new"
    echo "2. Create a new repository named '${repo_name}'"
    echo "3. Make it public"
    echo "4. Do NOT initialize with README, .gitignore, or license"
    echo "5. Come back and run this script again"
    exit 1
fi

echo ""
echo "Initializing git repository..."
git init

echo "Adding all files..."
git add .

echo "Committing changes..."
git commit -m "Initial portfolio website commit"

echo "Adding remote origin..."
git remote add origin ${repo_url}

echo "Pushing to GitHub..."
git push -u origin master

echo ""
echo "Deployment complete!"
echo "Your website should be available at: https://${github_username}.github.io"
echo ""
echo "Note: It may take a few minutes for the site to be published."
echo "If the site doesn't appear, please check the GitHub Pages settings in your repository."
echo "Go to: https://github.com/${github_username}/${repo_name}/settings/pages"
echo "and make sure the source is set to 'master' branch."