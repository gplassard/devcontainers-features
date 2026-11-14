#!/bin/sh
set -e

FEATURE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Activating feature 'mistral-vibe'"

# Fail if uv is not available
if ! command -v uv >/dev/null 2>&1; then
    echo "Error: 'uv' is required to install 'mistral-vibe'. Please install the 'uv' feature first." >&2
    exit 1
fi

export UV_TOOL_DIR="/usr/local/share/uv/tools"
export UV_TOOL_BIN_DIR="/usr/local/bin"
export UV_PYTHON_INSTALL_DIR="/usr/local/share/uv/python"

TMP_CONSTRAINTS="/tmp/vibe-constraints.txt"
uv export --directory "$FEATURE_DIR" --frozen --no-emit-project > "$TMP_CONSTRAINTS"
uv tool install --constraints "$TMP_CONSTRAINTS" mistral-vibe
rm -f "$TMP_CONSTRAINTS"

# Ensure world-readable permissions on installed tools and python runtime
chmod -R a+rX /usr/local/share/uv 2>/dev/null || true

echo "Verifying installation..."
vibe --version
