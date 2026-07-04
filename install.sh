#!/usr/bin/env bash
set -euo pipefail

PLUGIN_NAME="paper-reading-toolkit"
MARKETPLACE_NAME="paper-reading-toolkit"
SOURCE="${PAPER_READING_TOOLKIT_SOURCE:-MomoP32/paper-reading-toolkit}"
REF="${PAPER_READING_TOOLKIT_REF:-main}"

if ! command -v codex >/dev/null 2>&1; then
  echo "Codex CLI is required but was not found in PATH." >&2
  exit 1
fi

if codex plugin marketplace list | awk 'NR > 1 {print $1}' | grep -qx "$MARKETPLACE_NAME"; then
  codex plugin marketplace upgrade "$MARKETPLACE_NAME" >/dev/null 2>&1 || true
else
  case "$SOURCE" in
    /*|./*|../*)
      codex plugin marketplace add "$SOURCE"
      ;;
    *)
      codex plugin marketplace add "$SOURCE" --ref "$REF"
      ;;
  esac
fi

codex plugin add "$PLUGIN_NAME@$MARKETPLACE_NAME"

cat <<'EOF'

Paper Reading Toolkit installed.
Start a new Codex thread so the plugin skills are loaded.

Optional Obsidian vault override:
  export PAPER_READING_OBSIDIAN_VAULT="$HOME/Documents/Obsidian/Academic Research"
EOF
