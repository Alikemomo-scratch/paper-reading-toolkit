---
name: memory-management
description: Use when durable memory should be retrieved or written in the user's Obsidian vaults, including project decisions, Trellis/OpenSpec-derived project insights, debugging lessons, explicit remember requests, paper discussions, research insights, and cross-session knowledge.
---

# Memory Management

Durable personal and cross-project memory is stored only as Obsidian-compatible
Markdown files. Do not use OpenCode journals, QMD, embeddings, vector indexes,
or memory block tools as durable memory.

Trellis and OpenSpec are separate project-local sources of truth. Do not mirror
all Trellis/OpenSpec content into Obsidian. Use Obsidian for reasoning,
decisions, lessons, and cross-project knowledge that will matter after the
current task or change is gone.

## Vaults

Resolve vault paths in this order:

1. If `PAPER_READING_OBSIDIAN_VAULT` is set, use it for Academic Research.
2. Otherwise use `~/Documents/Obsidian/Academic Research/` for Academic Research.
3. If code-project memory is needed, use `PROJECT_DEVELOPMENT_OBSIDIAN_VAULT`
   when set; otherwise use `~/Documents/Obsidian/Project Development/`.
4. If the selected vault does not exist and the user has not asked to create it,
   ask before writing outside the current workspace.

- Project development: `PROJECT_DEVELOPMENT_OBSIDIAN_VAULT` or `~/Documents/Obsidian/Project Development/`
- Academic research: `PAPER_READING_OBSIDIAN_VAULT` or `~/Documents/Obsidian/Academic Research/`

Each vault should use:

- `00 - Maps of Content/` for MOCs and indexes
- `10 - Knowledge/` for durable notes

Writing to these vaults is outside the current workspace and may require
approval. Request a narrow filesystem-write approval before writing when needed.

## Code Project Boundary

Use Trellis for code project work when a repo has `.trellis/` or the user is
working in a Trellis/Qoder-style task flow:

- active task state
- PRD, requirements, non-goals, and acceptance criteria
- project specs
- implement/check context
- task archive and finish-work journal

Use OpenSpec for code project work when the repo is explicitly OpenSpec-backed:

- requirements and behavior contracts
- change proposals and task lists
- acceptance criteria and validation plans
- spec deltas and stable project-local conventions
- project-local implementation constraints

Use Obsidian Project Development for:

- why a project decision was made
- alternatives considered and rejected
- non-obvious bug root causes
- cross-project reusable lessons
- architecture rationale
- durable project conventions and patterns

If a learning belongs in both places, write the normative rule or acceptance
criterion to Trellis/OpenSpec and the reasoning chain to Obsidian Project
Development. Cross-link or mention the Trellis task path or OpenSpec change id
in the Obsidian note when useful.

## Academic Boundary

Do not route Trellis tasks, Trellis journals, code project PRDs, or finish-work
outputs into Academic Research. Do not let Trellis change paper notes, concept
notes, formula rules, research reports, or Academic Research MOCs.

Academic Research remains governed by the existing `deep-dive`, `research`,
`research-deep`, `research-report`, and related academic memory rules.

## When To Retrieve

Silently evaluate retrieval triggers at the start of each task:

- Known project, tech stack, Trellis task, OpenSpec change, paper, method, or
  concept is mentioned.
- A debugging session starts.
- The user asks about prior decisions, preferences, or remembered context.
- Academic content, literature, or research direction is discussed.
- A non-trivial code project implementation task is about to use Trellis or
  OpenSpec.

Retrieval rule:

1. If Trellis is relevant, first identify the active task and read only relevant
   PRD, task state, spec/check context, and workflow state.
2. If OpenSpec is relevant, first identify and read the active change/spec files.
3. For code projects, read the relevant Project Development MOC/index note.
4. Search filenames and contents to narrow candidates.
5. Read at most 1-3 relevant notes or targeted sections.
6. Reuse retrieved context within the same session.
7. Ask the user to narrow scope if results are broad.

Do not announce retrieval unless it affects the answer or the user asks.

## When To Write

Write durable Obsidian memory when content has cross-session reuse value:

- User explicitly asks to remember something.
- A project architecture, technology, workflow, or design decision is confirmed.
- A non-obvious bug fix or debugging lesson is completed.
- A Trellis/OpenSpec-backed task produces reusable rationale or project lessons.
- A project convention, linter, formatter, CI, or workflow rule changes.
- A paper discussion yields useful viewpoints, objections, or research questions.
- A research synthesis should become durable.

Skip temporary scratch context and task-local facts that belong only in the
current Trellis task, Trellis journal, or OpenSpec change.

## Finish Routing

At the end of substantial code project implementation or review work, produce:

```text
Trellis updates:
- stable project-local spec/task/check/journal update, or "none"

OpenSpec updates:
- stable project-local rule/spec/acceptance change, or "none"

Obsidian Project Development updates:
- durable reasoning/decision/lesson to record, or "none"

No-write notes:
- task-local facts intentionally not persisted, or "none"
```

Write only after the route is clear. Trellis/OpenSpec updates happen in the
repo. Obsidian Project Development updates may require filesystem approval.

This finish routing is for code project development only. Academic Research
workflows keep their existing archive behavior.

## Routing

- Project Development: repository behavior, implementation decisions, workflows,
  Trellis/OpenSpec-derived insights, debugging lessons, conventions, and
  reusable engineering knowledge.
- Academic Research: paper discussions, concepts, literature insights, research
  questions, and research synthesis.

If ambiguous, choose based on the future audience. Ask only when routing affects
where the user will look later.

## Note Principles

- Update over create: update the relevant object note if it exists.
- One note per real-world object: project, paper, or coherent research topic.
- Preserve reasoning, not just conclusions: context, alternatives, logic,
  evidence, and implications.
- Keep frontmatter keys in English.
- Write note titles and body content in Chinese by default unless the user asks
  otherwise.
- Use Obsidian `[[wikilinks]]` for related concepts and notes.
- MOCs contain navigation and short summaries, not copied note bodies.

## Required Frontmatter

New durable notes should include:

```markdown
---
type: project | paper | concept | research-object
cssclasses:
  - project
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - project
---
# Title
```

The first tag must match `type`.

## Project Notes

Useful sections:

- `项目概览`
- `当前约定`
- `关键事实`
- `重要决策`
- `开发中形成的经验`
- `Trellis 关联`
- `OpenSpec 关联`
- `待办与问题`
- `相关链接`

## Paper Notes

Paper notes preserve technical content and discussion insights. Include:

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

Formula rules:

- Preserve important formulas in LaTeX `$$` blocks.
- Put blank lines before and after `$$` blocks.
- Check variable consistency, symbol conventions, subscripts/superscripts,
  summation ranges, and key operators.
- Split long formulas with `aligned`.

## Concept Notes

Academic concept notes live under:

`<Academic Research vault>/10 - Knowledge/_概念/`

Before classifying a new concept, list the existing subdirectories and choose
the best fit. Create concept notes only for methods, models, datasets,
simulators/frameworks, and technical concepts.

## MOC Updates

After creating a new note:

- Add a `- [[note-name]]` entry with a short description to the relevant MOC.
- For concept notes, also update the relevant concept category MOC when present.
- Keep updates idempotent and avoid rewriting unchanged MOC content.

## Workflow

1. Decide whether the knowledge is durable.
2. If Trellis/OpenSpec is involved, identify what belongs in repo-local project
   memory first.
3. Choose the correct Obsidian vault for durable reasoning or lessons.
4. Ensure required directories exist.
5. Inspect the MOC and likely object notes.
6. Update a matching object note, or create one focused new note.
7. Add frontmatter, tags, wikilinks, Trellis/OpenSpec references, and MOC links.
8. Verify the note is retrieval-friendly.
