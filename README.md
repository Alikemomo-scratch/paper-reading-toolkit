# Paper Reading Toolkit

Paper Reading Toolkit is a Codex plugin marketplace for academic paper reading. It gives Codex a lightweight paper workflow that can read a paper, connect it to your existing Obsidian notes, discuss the paper with you, and then archive the final understanding back into your configured Obsidian vault.

The framework is intentionally small. It does three things well:

1. `deep-dive` handles paper reading, critique, discussion, and archive preparation.
2. `memory-management` handles durable Obsidian Markdown notes and vault routing.
3. `beautify-output` makes dense paper explanations easier to scan without deleting substance.

It is also `AGENTS.md`-aware. Your local `AGENTS.md` remains the place for personal workflow rules: language preference, vault paths, archive conventions, memory boundaries, and project/research boundaries. The plugin supplies the paper-reading mechanics; your local instructions supply the house style.

## Install

One-line install:

```bash
curl -fsSL https://raw.githubusercontent.com/Alikemomo-scratch/paper-reading-toolkit/main/install.sh | bash
```

Then start a new Codex thread so the bundled skills are loaded.

Manual install:

```bash
codex plugin marketplace add Alikemomo-scratch/paper-reading-toolkit --ref main
codex plugin add paper-reading-toolkit@paper-reading-toolkit
```

To update later:

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

If your vault lives somewhere else, set:

```bash
export PAPER_READING_OBSIDIAN_VAULT="/absolute/path/to/Academic Research"
```

Recommended vault structure:

```text
00 - Maps of Content/
10 - Knowledge/
10 - Knowledge/_论文/
10 - Knowledge/_概念/
```

Recommended MOC file:

```text
00 - Maps of Content/Academic Research MOC.md
```

If your local `AGENTS.md` defines Obsidian vault paths or archive rules, those local rules should be treated as the source of truth.

## How The Workflow Works

The normal flow is:

1. Start with `deep-dive`.
2. Before reading the paper, the agent searches the configured Academic Research notes for exact matches and related concepts.
3. The agent reads the paper and gives an initial structured view: summary, core method, links to existing knowledge, and first impressions.
4. You discuss the paper with the agent. This is where the useful understanding usually forms: model structure, data flow, training objective, assumptions, weak claims, related work, and open questions.
5. When the discussion is mature, ask the agent to archive the note.
6. The agent uses `memory-management` to write or update a Markdown note in the configured Obsidian vault and update the relevant MOC.
7. Use `beautify-output` when you want the explanation or final note draft reorganized into clearer Markdown.

In short: `deep-dive` reads and discusses, `memory-management` persists, and `beautify-output` polishes.

## Usage Examples

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

## Local AGENTS.md Integration

Priority order:

1. System/developer/Codex safety instructions.
2. The applicable local `AGENTS.md` files for the current workspace.
3. This plugin's skill instructions.

Use `AGENTS.md` for durable local rules such as:

- language preference
- Obsidian vault paths
- paper note structure
- archive triggers
- memory boundaries
- Trellis/OpenSpec boundaries
- project finish rules

A starter snippet is available at [`AGENTS.paper-reading.example.md`](./AGENTS.paper-reading.example.md). Copy the relevant parts into your own workspace `AGENTS.md`; the installer does not overwrite local agent instructions.

## Recommended Pairing

For structured benchmark, market, or literature research, use this plugin together with [Weizhena/Deep-Research-skills](https://github.com/Weizhena/Deep-Research-skills).

That project is the right home for skills such as `research`, `research-add-items`, `research-add-fields`, `research-deep`, and `research-report`. This plugin intentionally does not bundle those skills; it focuses on paper reading, paper discussion, formatting, and Obsidian note archiving.

## Repository Layout

```text
.agents/plugins/marketplace.json
AGENTS.paper-reading.example.md
plugins/paper-reading-toolkit/
  .codex-plugin/plugin.json
  skills/
install.sh
```
