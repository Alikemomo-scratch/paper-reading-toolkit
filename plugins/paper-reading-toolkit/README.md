# Paper Reading Toolkit Plugin

This directory is the plugin payload used by the root marketplace.

Paper Reading Toolkit provides an AGENTS.md-aware paper-reading workflow for Codex:

- `paper-reading-workflow` coordinates setup, reading, discussion, formatting, and archiving.
- `deep-dive` reads, discusses, critiques, and prepares paper archives.
- `memory-management` writes durable Markdown notes to the configured Obsidian vault.
- `beautify-output` restructures dense paper explanations into clearer Markdown.

## One-Click Install

Run from the workspace where you want `AGENTS.md` configured:

```bash
curl -fsSL https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/main/install.sh | bash
```

The installer installs the Codex plugin, initializes Obsidian folders, and updates `AGENTS.md` with a marked Paper Reading Toolkit block.

## Manual Install

```bash
codex plugin marketplace add Alikemomo-scratch/paper-reading-toolkit --ref main
codex plugin add paper-reading-toolkit@paper-reading-toolkit
```

## Normal Flow

1. Use `paper-reading-workflow` or `deep-dive` on a paper, PDF, arXiv link, or title.
2. The agent first searches the configured Obsidian Academic Research notes for related papers and concepts.
3. The agent reads the paper and starts the discussion with a structured first pass.
4. You discuss the paper until the important understanding is clear.
5. Say `归档笔记吧` or ask to archive.
6. The agent writes or updates the Obsidian note through `memory-management`.

## Local AGENTS.md Integration

This plugin should be used together with the `AGENTS.md` that applies to the current Codex workspace. Local `AGENTS.md` rules define language, vault paths, archive conventions, memory policy, and research/project boundaries. These skill instructions provide the mechanics, not a replacement for local policy.

Set `PAPER_READING_OBSIDIAN_VAULT` if your Academic Research vault is not at `~/Documents/Obsidian/Academic Research/`.

## Example Prompts

```text
使用 paper-reading-workflow 检查并初始化 Paper Reading Toolkit。
```

```text
使用 paper-reading-workflow 深度阅读这篇论文：https://arxiv.org/abs/xxxx.xxxxx
```

```text
先查一下我的 Obsidian 里有没有相关笔记，再开始读这篇论文。
```

```text
核心方法没讲清楚，结合模型结构、输入输出、训练目标重新解释。
```

```text
归档笔记吧。
```

```text
用 beautify-output 把这份论文总结重新整理成重点清晰的 Markdown。
```

## Recommended Pairing

For structured deep-research workflows, pair this plugin with [Weizhena/Deep-Research-skills](https://github.com/Weizhena/Deep-Research-skills). Skills such as `research`, `research-add-items`, `research-add-fields`, `research-deep`, and `research-report` belong there and are intentionally not bundled here.
