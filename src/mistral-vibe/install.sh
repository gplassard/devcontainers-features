#!/bin/sh
set -e

echo "Activating feature 'uv'"

pipx install uv

echo "uv installed successfully!"
uv --version

echo "Activating feature 'mistral-vibe'"

export UV_TOOL_BIN_DIR=/usr/local/bin

if [ -n "${VERSION:-}" ]; then
    echo "Installing Mistral Vibe version: $VERSION"
    uv tool install "mistral-vibe==$VERSION"
else
    echo "Installing latest Mistral Vibe"
    uv tool install mistral-vibe
fi

echo "Verifying installation..."
vibe --version
