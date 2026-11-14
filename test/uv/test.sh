#!/bin/bash

set -e

source dev-container-features-test-lib

check "uv installed" command -v uv
check "uv version" uv --version
check "uvx installed" command -v uvx

reportResults
