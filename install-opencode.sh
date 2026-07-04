#!/usr/bin/env bash
set -euo pipefail

REF="${PAPER_READING_TOOLKIT_REF:-main}"
SCRIPT_URL="${PAPER_READING_INSTALL_SCRIPT_URL:-https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/$REF/install.sh}"

curl -fsSL "$SCRIPT_URL" | bash -s -- opencode "$@"
