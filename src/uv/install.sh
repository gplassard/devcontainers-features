#!/bin/sh
set -e

echo "Activating feature 'uv'"

pipx install uv

echo "uv installed successfully!"
uv --version
