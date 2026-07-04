# Paper Reading Toolkit

Paper Reading Toolkit is a Codex plugin marketplace for academic paper reading. It gives Codex a lightweight framework that can install the paper-reading plugin, prepare Obsidian, read a paper, connect it to existing notes, discuss the paper with you, and archive the final understanding back into your configured Obsidian vault.

The runtime entrypoint is intentionally simple: use `deep-dive`. There is no separate orchestration skill. Memory First retrieval is built into `deep-dive`; `memory-management` handles durable Obsidian notes; `beautify-output` makes dense explanations easier to scan.

The framework does three things well:

1. `deep-dive` handles paper reading, critique, discussion, Memory First retrieval, and archive preparation.
2. `memory-management` handles durable Obsidian Markdown notes and vault routing.
3. `beautify-output` makes dense paper explanations easier to scan without deleting substance.

## One-Click Install

Run the installer:

```bash
curl -fsSL https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/main/install.sh | bash
```

The installer does three things:

1. Installs or upgrades the Codex plugin marketplace entry.
2. Installs Obsidian when supported by the current OS/package manager.
3. Creates the Academic Research vault folders and MOC file.

Then start a new Codex thread so the bundled skills are loaded.

## Install Options

Use these environment variables for non-default paths or CI-style installs:

```bash
export PAPER_READING_OBSIDIAN_VAULT="/absolute/path/to/Academic Research"
export PAPER_READING_SKIP_OBSIDIAN_APP=1
export PAPER_READING_SKIP_VAULT=1
```

Manual install without setup:

```bash
codex plugin marketplace add Alikemomo-scratch/paper-reading-toolkit --ref main
codex plugin add paper-reading-toolkit@paper-reading-toolkit
```

Update later:

```bash
codex plugin marketplace upgrade paper-reading-toolkit
codex plugin add paper-reading-toolkit@paper-reading-toolkit
```

## Obsidian Setup

This plugin writes normal Markdown files. No Obsidian community plugin is required.

Default Academic Research vault path:

```text
~/Documents/Obsidian/Academic Research/
```

The installer creates:

```text
00 - Maps of Content/
00 - Maps of Content/Academic Research MOC.md
10 - Knowledge/
10 - Knowledge/_论文/
10 - Knowledge/_概念/
```

If your vault is elsewhere, set `PAPER_READING_OBSIDIAN_VAULT` before running the installer or before starting Codex.

## How The Workflow Works

The normal flow is:

1. Start with `deep-dive`.
2. Before reading the paper, `deep-dive` applies Memory First from its own skill instructions.
3. It searches the configured Academic Research notes for exact paper matches and related concepts.
4. It reads the paper and gives an initial structured view: summary, core method, links to existing knowledge, and first impressions.
5. Discuss the paper with the agent. This is where the useful understanding usually forms: model structure, data flow, training objective, assumptions, weak claims, related work, and open questions.
6. When the discussion is mature, ask the agent to archive the note.
7. The agent uses `memory-management` to write or update a Markdown note in the configured Obsidian vault and update the relevant MOC.
8. Use `beautify-output` when you want the explanation or final note draft reorganized into clearer Markdown.

In short: `deep-dive` reads and discusses, `memory-management` persists, and `beautify-output` polishes.

## Usage Examples

Set up the framework:

```text
帮我检查 Paper Reading Toolkit 是否配置好，包括 Codex 插件和 Obsidian vault。
```

Read a paper:

```text
使用 deep-dive 深度阅读这篇论文：https://arxiv.org/abs/xxxx.xxxxx
```

Read a local PDF:

```text
使用 deep-dive 阅读这个 PDF，先查一下我的 Obsidian 里有没有相关笔记，然后给我一个初步分析。
```

Discuss after the first pass:

```text
核心方法还是没讲清楚，结合模型结构、输入输出、训练目标重新解释一下。
```

Connect to existing notes:

```text
这篇论文和我已有的 VLA / world model / JEPA 笔记有什么关系？
```

Archive after discussion:

```text
归档笔记吧。
```

Polish the output:

```text
用 beautify-output 把这份论文总结重新整理成重点清晰的 Markdown。
```

## Recommended Pairing

For structured benchmark, market, or literature research, use this plugin together with [Weizhena/Deep-Research-skills](https://github.com/Weizhena/Deep-Research-skills).

That project is the right home for skills such as `research`, `research-add-items`, `research-add-fields`, `research-deep`, and `research-report`. This plugin intentionally does not bundle those skills; it focuses on paper reading, paper discussion, formatting, and Obsidian note archiving.

## Repository Layout

```text
.agents/plugins/marketplace.json
install.sh
plugins/paper-reading-toolkit/
  .codex-plugin/plugin.json
  skills/
    deep-dive/
    memory-management/
    beautify-output/
```
