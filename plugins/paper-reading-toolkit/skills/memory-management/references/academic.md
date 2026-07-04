# Academic Research Memory

Use this reference for paper reading, academic concept notes, formulas,
literature discussions, research synthesis, and archive requests.

## Vault

Academic Research vault:

`PAPER_READING_OBSIDIAN_VAULT` or `/Users/alikemomo/Documents/Obsidian/Academic Research/`

Expected structure:

- `00 - Maps of Content/` for MOCs and indexes
- `10 - Knowledge/_论文/` for paper notes
- `10 - Knowledge/_概念/` for concept, method, formula, dataset, and theme notes

Writing to the vault may require filesystem approval when the current workspace
cannot write there.

## Retrieve

Retrieve context when a paper, arXiv ID, PDF, method, concept, formula,
dataset, benchmark, research theme, or archive request is mentioned.

Before answering:

1. Search exact paper matches by title, arXiv ID, DOI, filename, and common abbreviations.
2. Search related concept or method notes using keywords from the title, abstract, user prompt, and cited methods.
3. Read at most 1-3 relevant notes or targeted sections.
4. Prefer high-signal snippets over dumping whole notes into context.
5. If an exact paper note already exists, ask whether to update it or start a fresh reading thread.

Do not announce retrieval unless it changes the answer or the user asks what was found.

## Write

Write or update Academic Research notes when:

- The user asks to archive, save, or remember a paper discussion.
- A paper discussion produces durable insights, objections, comparisons, or research questions.
- A concept, formula, method, dataset, benchmark, or literature theme should be reusable later.
- A research synthesis should become a durable Markdown note.

Skip transient chat notes, rough scratch work, and claims that have not been
settled enough to be useful later.

## Paper Notes

For paper notes, preserve:

- `元信息`
- `一句话总结`
- `核心贡献`
- `问题背景`
- `方法详解`
- `关键公式`
- `关键图表`
- `实验结果`
- `我们关心的问题`
- `讨论出的关键观点`
- `对我研究的启发`
- `可复用的方法或框架`
- `反对意见与疑问`
- `相关链接`

Capture the concrete viewpoint that emerged from the conversation. Do not leave
discussion sections generic.

## Formula Rules

- Preserve important formulas in LaTeX `$$` blocks.
- Put blank lines before and after `$$` blocks.
- Check variable consistency, symbol conventions, subscripts/superscripts,
  summation ranges, and key operators.
- Split long formulas with `aligned`.

## Concept Notes

Before classifying a new concept, inspect existing subdirectories under:

`10 - Knowledge/_概念/`

Create concept notes only for methods, models, datasets, simulators/frameworks,
formulas, and technical concepts that are likely to be reused.

Useful sections:

- `定义`
- `出现位置`
- `为什么重要`
- `相关论文或笔记`
- `未解决问题`

## MOC Updates

After creating a new durable note:

1. Add a `- [[note-name]]` entry with a short description to the relevant MOC.
2. For concept notes, also update the relevant concept category MOC when present.
3. Keep updates idempotent and avoid rewriting unchanged MOC content.

## Boundary

Keep Academic Research notes focused on papers, concepts, formulas, methods,
literature, and research questions. Do not archive unrelated task logistics.
