# Paper Reading Toolkit

A Codex plugin marketplace for AGENTS.md-aware academic paper reading, Markdown formatting, and Obsidian-based research notes.

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
- `beautify-output`: turn dense paper/research answers into clearer, high-signal Markdown.


## Local AGENTS.md Integration

This plugin is designed to work with the `AGENTS.md` that already applies to the current Codex workspace. Treat `AGENTS.md` as the local policy layer and this plugin as the paper-reading implementation layer.

Priority order:

1. System/developer/Codex safety instructions.
2. The applicable local `AGENTS.md` files for the current workspace.
3. This plugin's skill instructions.

Use `AGENTS.md` for durable local rules such as language preference, Obsidian vault paths, memory boundaries, Trellis/OpenSpec boundaries, project finish rules, and paper/archive conventions. The plugin should follow those local rules when it reads papers, formats output, or writes Academic Research notes.

A starter snippet is available at [`AGENTS.paper-reading.example.md`](./AGENTS.paper-reading.example.md). Copy the relevant parts into your own workspace `AGENTS.md`; the installer does not overwrite local agent instructions.

## Recommended Pairing

For structured deep-research workflows, use this plugin together with [Weizhena/Deep-Research-skills](https://github.com/Weizhena/Deep-Research-skills).

That project is the right home for skills such as `research`, `research-add-items`, `research-add-fields`, `research-deep`, and `research-report`. This plugin intentionally does not bundle those skills; it focuses on paper reading, paper discussion, formatting, and Obsidian note archiving.

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
用 beautify-output 把这份论文总结重新整理成重点清晰的 Markdown
```

For structured benchmark, market, or literature research, install and use [Weizhena/Deep-Research-skills](https://github.com/Weizhena/Deep-Research-skills) alongside this plugin.

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
