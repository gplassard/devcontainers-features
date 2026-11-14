#!/bin/bash

set -e

source dev-container-features-test-lib

check "vibe installed" command -v vibe
check "vibe version" vibe --version

reportResults
