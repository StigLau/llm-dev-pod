#!/bin/bash
# Script to save GitHub CLI and Claude tokens outside the container

# Create host directory if it doesn't exist (this should be a mounted volume)
mkdir -p /workspace/gh-auth

# Save GitHub CLI token
if [ -f ~/.config/gh/hosts.yml ]; then
    cp ~/.config/gh/hosts.yml /workspace/gh-auth/hosts.yml
    chmod 600 /workspace/gh-auth/hosts.yml
    echo "GitHub CLI token saved to /workspace/gh-auth/hosts.yml"
else
    echo "No GitHub CLI token found. Run 'gh auth login' first."
fi

# Save Claude credentials
if [ -f ~/.claude/.credentials.json ]; then
    cp ~/.claude/.credentials.json /workspace/gh-auth/claude-credentials.json
    chmod 600 /workspace/gh-auth/claude-credentials.json
    echo "Claude credentials saved to /workspace/gh-auth/claude-credentials.json"
else
    echo "No Claude credentials found."
fi

echo "Tokens will persist outside the container when /workspace is mounted"