#!/bin/sh
set -e

echo "Activating feature 'uv'"

# Ensure curl, ca-certificates, and tar are available
check_packages() {
    if ! command -v curl >/dev/null 2>&1 || ! command -v tar >/dev/null 2>&1; then
        if [ -f /etc/os-release ]; then
            . /etc/os-release
            case "$ID" in
                debian|ubuntu)
                    apt-get update -y
                    apt-get install -y --no-install-recommends curl ca-certificates tar
                    rm -rf /var/lib/apt/lists/*
                    ;;
                alpine)
                    apk update
                    apk add --no-cache curl ca-certificates tar
                    ;;
                fedora|rhel|centos|rocky|almalinux)
                    dnf install -y curl ca-certificates tar || yum install -y curl ca-certificates tar
                    ;;
            esac
        fi
    fi
}

check_packages

export UV_INSTALL_DIR="/usr/local/bin"
export INSTALLER_NO_MODIFY_PATH=1

curl -LsSf https://astral.sh/uv/install.sh | sh

echo "uv installed successfully!"
uv --version
