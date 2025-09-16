#!/bin/bash
# Container startup script that restores GitHub CLI token

# Restore GitHub CLI token if available
restore-gh-token.sh

# Execute the original command
exec "$@"