# Paper Reading Toolkit Plugin

This directory is the plugin payload used by the root marketplace.

Install from the repository root:

```bash
codex plugin marketplace add MomoP32/paper-reading-toolkit --ref main
codex plugin add paper-reading-toolkit@paper-reading-toolkit
```

Or use the root installer:

```bash
curl -fsSL https://raw.githubusercontent.com/MomoP32/paper-reading-toolkit/main/install.sh | bash
```

The plugin bundles:

- `deep-dive`: read, discuss, critique, and archive papers, PDFs, arXiv links, and paper titles.
- `memory-management`: write durable Markdown notes into an Obsidian vault.
- `beautify-output`: turn dense research answers into clearer Markdown.
- `research`, `research-add-items`, `research-add-fields`, `research-deep`, `research-report`: run structured research from outline to JSON results to Chinese report.

Set `PAPER_READING_OBSIDIAN_VAULT` if your Academic Research vault is not at `~/Documents/Obsidian/Academic Research/`.

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

## Archive Rules

Paper archive notes should keep:

- metadata, one-sentence summary, core contributions, background, method details, formulas, figures or tables, experiments, discussion insights, doubts, and research implications.
- frontmatter with `type: paper`, `created`, `updated`, and `tags`.
- Obsidian wikilinks for related methods, papers, and concepts.
- an entry in `Academic Research MOC.md`.

The archive workflow is triggered when you ask Codex to save, archive, remember, or persist a sufficiently rich paper discussion.
