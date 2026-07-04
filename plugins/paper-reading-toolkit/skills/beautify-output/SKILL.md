---
name: beautify-output
description: Use when a user asks for polished, beautified, highlighted, sectioned, template-driven, TL;DR, Markdown, paper-analysis, research-summary, or clearer output formatting.
---

# Beautify Output

Use this skill to turn a dense answer into a readable, high-signal Markdown response. Preserve the substance; improve scanability, emphasis, and sectioning.

## Local AGENTS.md Coordination

Before using this skill, apply the `AGENTS.md` instructions that are active for the current workspace. Use those local instructions for language, output style, memory policy, Obsidian vault paths, archive rules, and research/project boundaries. If local `AGENTS.md` conflicts with this skill, follow the local rule unless higher-priority system or developer instructions say otherwise.

## Core Pattern

Use Chinese by default unless the user asks otherwise.

Start with the answer, not setup:

```markdown
**一句话结论**
[最重要判断]

**最重要的 3 点**
1. [point]
2. [point]
3. [point]

**展开说明**
[short sections]
```

## Formatting Rules

- Use short bold section headings, usually 1-6 Chinese characters or 1-3 English words.
- Put the strongest conclusion first, then evidence, then caveats.
- Bold only labels, key claims, and contrastive terms; do not bold whole paragraphs.
- Use `inline code` for identifiers, commands, paths, filenames, formulas, model names when precision matters.
- Use tables only for comparisons with at least three rows or multiple attributes.
- Use numbered lists for sequences or ranked priorities; use bullets for unordered points.
- Keep paragraphs short. Split when a paragraph carries more than one idea.
- Avoid decorative formatting, emoji, ASCII art, nested bullets, and gratuitous blockquotes.
- Preserve code blocks, citations, formulas, and exact source wording when they matter.

## Paper And Research Template

For papers, PDFs, arXiv links, research notes, or literature discussion, prefer:

```markdown
**一句话结论**

**论文在解决什么**

**核心贡献**
1. ...
2. ...
3. ...

**方法/框架拆解**

**关键实验或证据**

**我认为真正有价值的地方**

**薄弱点与疑问**

**和你已有研究的关系**

**下一步值得追的问题**
```

When used together with `deep-dive`, keep that skill's required items (`一句话总结`, `核心方法`, `与已有知识的关联`, `初步印象`) and make them visually clearer rather than replacing them.

## Technical Answer Template

For engineering or code-oriented answers, prefer:

```markdown
**结论**

**改了什么**

**为什么这样做**

**验证**

**风险/后续**
```

Use file links and command outputs only when they help the user act.

## Judgment

If the user asks for a raw answer, a minimal answer, exact text, JSON, code, a commit message, or a specific format, follow that format instead. Beautification should never make the answer longer, vaguer, or less faithful.
