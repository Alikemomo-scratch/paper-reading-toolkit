# Paper Reading Toolkit

A Codex plugin marketplace for academic paper reading, structured research, Markdown formatting, and Obsidian-based research notes.

## One-Line Install

```bash
curl -fsSL https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/main/install.sh | bash
```

Then start a new Codex thread so the bundled skills are loaded.

## Manual Install

```bash
codex plugin marketplace add Alikemomo-scratch/paper-reading-toolkit --ref main
codex plugin add paper-reading-toolkit@paper-reading-toolkit
```

## What It Adds

- `deep-dive`: read, discuss, critique, summarize, and archive papers, PDFs, arXiv links, and paper titles.
- `memory-management`: write durable Markdown notes into an Obsidian vault.
- `beautify-output`: turn dense answers into clearer, high-signal Markdown.
- `research`: create structured research outlines.
- `research-add-items`: add research objects to an existing outline.
- `research-add-fields`: add fields to an existing research schema.
- `research-deep`: execute item-by-item deep research into JSON outputs.
- `research-report`: convert structured JSON results into Chinese Markdown reports.

## Obsidian Setup

This plugin writes normal Markdown files. No Obsidian community plugin is required.

1. Install Obsidian:

   ```text
   https://obsidian.md/download
   ```

2. Create or open an Academic Research vault. The default path is:

   ```text
   ~/Documents/Obsidian/Academic Research/
   ```

3. If your vault lives somewhere else, set:

   ```bash
   export PAPER_READING_OBSIDIAN_VAULT="/absolute/path/to/Academic Research"
   ```

4. Recommended vault folders:

   ```text
   00 - Maps of Content/
   10 - Knowledge/
   10 - Knowledge/_论文/
   10 - Knowledge/_概念/
   ```

5. Recommended MOC file:

   ```text
   00 - Maps of Content/Academic Research MOC.md
   ```

## Typical Prompts

```text
使用 deep-dive 深度阅读这篇论文：https://arxiv.org/abs/...
```

```text
归档笔记吧
```

```text
使用 research 调研 World Action Models 代表工作
```

```text
用 beautify-output 把这份论文总结重新整理成重点清晰的 Markdown
```

## Repository Layout

```text
.agents/plugins/marketplace.json
plugins/paper-reading-toolkit/
  .codex-plugin/plugin.json
  skills/
install.sh
```

## Update

```bash
codex plugin marketplace upgrade paper-reading-toolkit
codex plugin add paper-reading-toolkit@paper-reading-toolkit
```
