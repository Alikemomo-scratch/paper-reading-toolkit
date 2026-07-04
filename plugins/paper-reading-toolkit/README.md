# Paper Reading Toolkit Plugin

This directory is the plugin payload used by the root marketplace.

Paper Reading Toolkit provides a paper-reading workflow for Codex:

- `deep-dive` is the entrypoint for reading, discussing, critiquing, Memory First retrieval, and preparing paper archives.
- `memory-management` writes durable Markdown notes to the configured Obsidian vault.
- `beautify-output` restructures dense paper explanations into clearer Markdown.

There is intentionally no separate orchestration skill. Use `deep-dive` directly; its skill instructions include the Memory First behavior.

## One-Click Install

```bash
curl -fsSL https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/main/install.sh | bash
```

The installer installs the Codex plugin and initializes Obsidian folders.

## Manual Install

```bash
codex plugin marketplace add Alikemomo-scratch/paper-reading-toolkit --ref main
codex plugin add paper-reading-toolkit@paper-reading-toolkit
```

## Normal Flow

1. Use `deep-dive` on a paper, PDF, arXiv link, or title.
2. `deep-dive` applies Memory First and searches the configured Obsidian Academic Research notes for related papers and concepts before reading.
3. The agent reads the paper and starts the discussion with a structured first pass.
4. You discuss the paper until the important understanding is clear.
5. Say `归档笔记吧` or ask to archive.
6. The agent writes or updates the Obsidian note through `memory-management`.

## Obsidian Vault

Set `PAPER_READING_OBSIDIAN_VAULT` if your Academic Research vault is not at `~/Documents/Obsidian/Academic Research/`.

## Example Prompts

```text
使用 deep-dive 深度阅读这篇论文：https://arxiv.org/abs/xxxx.xxxxx
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
