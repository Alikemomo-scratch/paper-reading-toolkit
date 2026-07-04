#!/usr/bin/env bash
set -euo pipefail

PLUGIN_NAME="paper-reading-toolkit"
MARKETPLACE_NAME="paper-reading-toolkit"
SOURCE="${PAPER_READING_TOOLKIT_SOURCE:-Alikemomo-scratch/paper-reading-toolkit}"
REF="${PAPER_READING_TOOLKIT_REF:-main}"
VAULT_PATH="${PAPER_READING_OBSIDIAN_VAULT:-$HOME/Documents/Obsidian/Academic Research}"
INSTALL_TARGET="${1:-${PAPER_READING_INSTALL_TARGET:-codex}}"
OPENCODE_CONFIG_DIR="${PAPER_READING_OPENCODE_CONFIG_DIR:-${OPENCODE_CONFIG_DIR:-$HOME/.config/opencode}}"
OPENCODE_INSTALL_DIR="${PAPER_READING_OPENCODE_INSTALL_DIR:-$OPENCODE_CONFIG_DIR/paper-reading-toolkit}"
SKIP_CODEX="${PAPER_READING_SKIP_CODEX:-0}"
SKIP_OPENCODE="${PAPER_READING_SKIP_OPENCODE:-0}"
SKIP_OBSIDIAN_APP="${PAPER_READING_SKIP_OBSIDIAN_APP:-0}"
SKIP_VAULT="${PAPER_READING_SKIP_VAULT:-0}"
OPEN_OBSIDIAN="${PAPER_READING_OPEN_OBSIDIAN:-0}"

log() {
  printf '[paper-reading-toolkit] %s\n' "$1"
}

warn() {
  printf '[paper-reading-toolkit] WARN: %s\n' "$1" >&2
}

usage() {
  cat <<'EOF_USAGE'
Usage:
  install.sh [codex|opencode|all]

Targets:
  codex     Install the Codex plugin marketplace entry. This is the default.
  opencode  Install the OpenCode plugin and OpenCode skills.
  all       Install both Codex and OpenCode support.

Useful environment variables:
  PAPER_READING_OBSIDIAN_VAULT
  PAPER_READING_TOOLKIT_SOURCE
  PAPER_READING_TOOLKIT_REF
  PAPER_READING_OPENCODE_CONFIG_DIR
  PAPER_READING_OPENCODE_INSTALL_DIR
  PAPER_READING_SKIP_CODEX=1
  PAPER_READING_SKIP_OPENCODE=1
  PAPER_READING_SKIP_OBSIDIAN_APP=1
  PAPER_READING_SKIP_VAULT=1
EOF_USAGE
}

validate_target() {
  case "$INSTALL_TARGET" in
    codex|opencode|all)
      ;;
    -h|--help|help)
      usage
      exit 0
      ;;
    *)
      usage >&2
      exit 1
      ;;
  esac
}

should_install_codex() {
  [ "$INSTALL_TARGET" = "codex" ] || [ "$INSTALL_TARGET" = "all" ]
}

should_install_opencode() {
  [ "$INSTALL_TARGET" = "opencode" ] || [ "$INSTALL_TARGET" = "all" ]
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

github_url_from_source() {
  case "$SOURCE" in
    https://*|git@*|ssh://*)
      printf '%s\n' "$SOURCE"
      ;;
    */*)
      printf 'https://github.com/%s.git\n' "$SOURCE"
      ;;
    *)
      return 1
      ;;
  esac
}

replace_symlink() {
  local target="$1"
  local link_path="$2"

  if [ -e "$link_path" ] && [ ! -L "$link_path" ]; then
    echo "Refusing to overwrite non-symlink path: $link_path" >&2
    exit 1
  fi

  rm -f "$link_path"
  ln -s "$target" "$link_path"
}

install_opencode_plugin() {
  if [ "$SKIP_OPENCODE" = "1" ]; then
    log "Skipping OpenCode plugin installation."
    return
  fi

  if ! command -v opencode >/dev/null 2>&1; then
    warn "OpenCode was not found in PATH. Installing files anyway under: $OPENCODE_CONFIG_DIR"
  fi

  mkdir -p "$OPENCODE_CONFIG_DIR"

  case "$SOURCE" in
    /*|./*|../*)
      local source_path
      source_path="$(cd "$SOURCE" && pwd)"
      if [ "$source_path" != "$OPENCODE_INSTALL_DIR" ]; then
        mkdir -p "$OPENCODE_INSTALL_DIR"
        cp -R "$source_path/.opencode" "$OPENCODE_INSTALL_DIR/"
        cp -R "$source_path/plugins" "$OPENCODE_INSTALL_DIR/"
        cp "$source_path/README.md" "$OPENCODE_INSTALL_DIR/"
        cp "$source_path/LICENSE" "$OPENCODE_INSTALL_DIR/" 2>/dev/null || true
      fi
      ;;
    *)
      if ! command -v git >/dev/null 2>&1; then
        echo "Git is required to install Paper Reading Toolkit for OpenCode." >&2
        exit 1
      fi

      local git_url
      git_url="$(github_url_from_source)"

      if [ -d "$OPENCODE_INSTALL_DIR/.git" ]; then
        git -C "$OPENCODE_INSTALL_DIR" fetch --quiet origin "$REF"
        git -C "$OPENCODE_INSTALL_DIR" checkout --quiet "$REF"
        git -C "$OPENCODE_INSTALL_DIR" pull --ff-only --quiet origin "$REF" || true
      elif [ -e "$OPENCODE_INSTALL_DIR" ]; then
        echo "OpenCode install path exists but is not a Git checkout: $OPENCODE_INSTALL_DIR" >&2
        echo "Set PAPER_READING_OPENCODE_INSTALL_DIR to another path or move the existing directory." >&2
        exit 1
      else
        git clone --quiet --depth 1 --branch "$REF" "$git_url" "$OPENCODE_INSTALL_DIR"
      fi
      ;;
  esac

  local plugin_file="$OPENCODE_INSTALL_DIR/.opencode/plugins/paper-reading-toolkit.js"
  local skills_dir="$OPENCODE_INSTALL_DIR/plugins/paper-reading-toolkit/skills"

  if [ ! -f "$plugin_file" ]; then
    echo "OpenCode plugin file was not found: $plugin_file" >&2
    exit 1
  fi

  if [ ! -d "$skills_dir" ]; then
    echo "OpenCode skills directory was not found: $skills_dir" >&2
    exit 1
  fi

  mkdir -p "$OPENCODE_CONFIG_DIR/plugins" "$OPENCODE_CONFIG_DIR/skills"
  replace_symlink "$plugin_file" "$OPENCODE_CONFIG_DIR/plugins/paper-reading-toolkit.js"
  replace_symlink "$skills_dir" "$OPENCODE_CONFIG_DIR/skills/paper-reading-toolkit"

  log "OpenCode plugin registered at: $OPENCODE_CONFIG_DIR/plugins/paper-reading-toolkit.js"
  log "OpenCode skills linked at: $OPENCODE_CONFIG_DIR/skills/paper-reading-toolkit"
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

validate_target

if should_install_codex; then
  install_codex_plugin
fi

if should_install_opencode; then
  install_opencode_plugin
fi

install_obsidian_app
configure_obsidian_vault
maybe_open_obsidian

cat <<EOF_DONE

Paper Reading Toolkit setup complete.

Installed/updated:
- Target: $INSTALL_TARGET
- Obsidian vault: $VAULT_PATH
EOF_DONE

if should_install_codex; then
  cat <<EOF_CODEX
- Codex plugin: $PLUGIN_NAME@$MARKETPLACE_NAME
EOF_CODEX
fi

if should_install_opencode; then
  cat <<EOF_OPENCODE
- OpenCode plugin: $OPENCODE_CONFIG_DIR/plugins/paper-reading-toolkit.js
- OpenCode skills: $OPENCODE_CONFIG_DIR/skills/paper-reading-toolkit
EOF_OPENCODE
fi

cat <<EOF_DONE

Restart Codex or OpenCode so the plugin skills are loaded.
Use deep-dive as the entrypoint for paper reading. Memory First is built into deep-dive.
EOF_DONE
