# Installing Paper Reading Toolkit for OpenCode

## One-Click Install

```bash
curl -fsSL https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/main/install-opencode.sh | bash
```

Equivalent:

```bash
curl -fsSL https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/main/install.sh | bash -s -- opencode
```

## What It Installs

- OpenCode plugin symlink:
  `~/.config/opencode/plugins/paper-reading-toolkit.js`
- OpenCode skills symlink:
  `~/.config/opencode/skills/paper-reading-toolkit`
- Local toolkit checkout:
  `~/.config/opencode/paper-reading-toolkit`
- Academic Research vault folders under:
  `~/Documents/Obsidian/Academic Research/`

Restart OpenCode after installation.

## Use

Ask OpenCode to use its native skill tool:

```text
use skill tool to load paper-reading-toolkit/deep-dive
```

Then read papers normally:

```text
使用 deep-dive 深度阅读这篇论文：https://arxiv.org/abs/xxxx.xxxxx
```
