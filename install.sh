#!/usr/bin/env bash
set -euo pipefail

PLUGIN_NAME="paper-reading-toolkit"
MARKETPLACE_NAME="paper-reading-toolkit"
SOURCE="${PAPER_READING_TOOLKIT_SOURCE:-Alikemomo-scratch/paper-reading-toolkit}"
REF="${PAPER_READING_TOOLKIT_REF:-main}"
VAULT_PATH="${PAPER_READING_OBSIDIAN_VAULT:-$HOME/Documents/Obsidian/Academic Research}"
SKIP_CODEX="${PAPER_READING_SKIP_CODEX:-0}"
SKIP_OBSIDIAN_APP="${PAPER_READING_SKIP_OBSIDIAN_APP:-0}"
SKIP_VAULT="${PAPER_READING_SKIP_VAULT:-0}"
OPEN_OBSIDIAN="${PAPER_READING_OPEN_OBSIDIAN:-0}"

log() {
  printf '[paper-reading-toolkit] %s\n' "$1"
}

warn() {
  printf '[paper-reading-toolkit] WARN: %s\n' "$1" >&2
}

install_codex_plugin() {
  if [ "$SKIP_CODEX" = "1" ]; then
    log "Skipping Codex plugin installation."
    return
  fi

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
}

install_obsidian_app() {
  if [ "$SKIP_OBSIDIAN_APP" = "1" ]; then
    log "Skipping Obsidian app installation."
    return
  fi

  case "$(uname -s 2>/dev/null || echo unknown)" in
    Darwin)
      if [ -d "/Applications/Obsidian.app" ] || [ -d "$HOME/Applications/Obsidian.app" ]; then
        log "Obsidian app already found."
      elif command -v brew >/dev/null 2>&1; then
        log "Installing Obsidian with Homebrew Cask."
        brew list --cask obsidian >/dev/null 2>&1 || brew install --cask obsidian
      else
        warn "Homebrew is not installed. Install Obsidian manually from https://obsidian.md/download"
      fi
      ;;
    Linux)
      if command -v obsidian >/dev/null 2>&1; then
        log "Obsidian command already found."
      elif command -v flatpak >/dev/null 2>&1; then
        log "Trying to install Obsidian with Flatpak."
        flatpak install -y flathub md.obsidian.Obsidian || warn "Flatpak install failed. Install Obsidian manually from https://obsidian.md/download"
      else
        warn "No supported Obsidian installer found. Install Obsidian manually from https://obsidian.md/download"
      fi
      ;;
    MINGW*|MSYS*|CYGWIN*)
      if command -v winget >/dev/null 2>&1; then
        log "Trying to install Obsidian with winget."
        winget install -e --id Obsidian.Obsidian || warn "winget install failed. Install Obsidian manually from https://obsidian.md/download"
      else
        warn "winget is not available. Install Obsidian manually from https://obsidian.md/download"
      fi
      ;;
    *)
      warn "Unknown OS. Install Obsidian manually from https://obsidian.md/download"
      ;;
  esac
}

configure_obsidian_vault() {
  if [ "$SKIP_VAULT" = "1" ]; then
    log "Skipping Obsidian vault initialization."
    return
  fi

  mkdir -p "$VAULT_PATH/00 - Maps of Content"
  mkdir -p "$VAULT_PATH/10 - Knowledge/_论文"
  mkdir -p "$VAULT_PATH/10 - Knowledge/_概念"

  local moc="$VAULT_PATH/00 - Maps of Content/Academic Research MOC.md"
  if [ ! -f "$moc" ]; then
    cat > "$moc" <<'EOF_MOC'
---
type: moc
created: 2026-07-04
updated: 2026-07-04
tags:
  - moc
---
# Academic Research MOC

## 论文

## 概念

## 研究主题
EOF_MOC
  fi

  log "Obsidian vault initialized at: $VAULT_PATH"
}

maybe_open_obsidian() {
  if [ "$OPEN_OBSIDIAN" != "1" ]; then
    return
  fi

  case "$(uname -s 2>/dev/null || echo unknown)" in
    Darwin)
      open -a Obsidian "$VAULT_PATH" >/dev/null 2>&1 || warn "Could not open Obsidian automatically."
      ;;
    Linux)
      if command -v obsidian >/dev/null 2>&1; then
        obsidian "$VAULT_PATH" >/dev/null 2>&1 || true
      fi
      ;;
  esac
}

install_codex_plugin
install_obsidian_app
configure_obsidian_vault
maybe_open_obsidian

cat <<EOF_DONE

Paper Reading Toolkit setup complete.

Installed/updated:
- Codex plugin: $PLUGIN_NAME@$MARKETPLACE_NAME
- Obsidian vault: $VAULT_PATH

Start a new Codex thread so the plugin skills are loaded.
Use deep-dive as the entrypoint for paper reading. Memory First is built into deep-dive.
EOF_DONE
