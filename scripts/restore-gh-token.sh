#!/bin/bash
# Script to restore GitHub CLI and Claude tokens at container startup

# Create the GitHub CLI config directory
mkdir -p ~/.config/gh

# Restore GitHub CLI token
if [ -f "/workspace/gh-auth/hosts.yml" ]; then
    cp /workspace/gh-auth/hosts.yml ~/.config/gh/hosts.yml
    chmod 600 ~/.config/gh/hosts.yml
    echo "GitHub CLI token restored from /workspace/gh-auth/hosts.yml"
    
    # Verify GitHub CLI works
    gh auth status 2>/dev/null && echo "GitHub CLI authenticated successfully"
else
    echo "No saved GitHub token found at /workspace/gh-auth/hosts.yml"
    echo "Run 'gh auth login' to authenticate"
fi

# Create Claude config directory and restore credentials
mkdir -p ~/.claude

if [ -f "/workspace/gh-auth/claude-credentials.json" ]; then
    cp /workspace/gh-auth/claude-credentials.json ~/.claude/.credentials.json
    chmod 600 ~/.claude/.credentials.json
    echo "Claude credentials restored from /workspace/gh-auth/claude-credentials.json"
    
    # Verify Claude CLI works
    claude --version >/dev/null 2>&1 && echo "Claude CLI authenticated successfully"
else
    echo "No saved Claude credentials found at /workspace/gh-auth/claude-credentials.json"
    echo "Run 'claude auth' to authenticate"
fi