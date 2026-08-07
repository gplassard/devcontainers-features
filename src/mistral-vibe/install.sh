#!/bin/sh
set -e

echo "Activating feature 'uv'"

pipx install uv

echo "uv installed successfully!"
uv --version

echo "Activating feature 'mistral-vibe'"

uv tool install "mistral==2.24.0"

echo "Verifying installation..."
vibe --version
