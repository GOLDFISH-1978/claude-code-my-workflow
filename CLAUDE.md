# CLAUDE.md — Banking Paper Factory

**Project:** Banking Paper Factory
**Branch:** main

---

## Non-Negotiables

1. **Identification clarity first** — state the identification assumption before any result
2. **Mechanism transparency** — test channels, don't just assert them
3. **Reproducible pipelines** — all tables/figures from code; `main.do` runs cleanly from scratch
4. **Referee-proof robustness** — minimum: alternative clustering, alternative sample, alternative spec
5. **No fabricated facts** — no invented numbers, no unverified citations, `[VERIFY]` tags for all AI-drafted magnitudes

See `.claude/rules/identification-protocol.md` for causal language enforcement.

---

## Folder Structure

```
Banking-Paper-Factory/
├── CLAUDE.md                    # This file
├── MEMORY.md                    # Persistent learnings
├── .claude/                     # Rules, skills, agents, hooks
├── projects/                    # One subfolder per paper
│   ├── README.md                # Scaffold docs + quick start
│   └── _example_paper/          # Copy this for each new paper
│       ├── paper/               # LaTeX manuscript (authoritative source)
│       ├── data/raw|processed|final/
│       ├── code/main.do + stata/ + R/ + python/
│       ├── output/tables|figures|logs/
│       ├── slides/              # Beamer companion (derived from paper)
│       └── docs/                # RAM, submission log
├── explorations/                # Research sandbox (60/100 threshold)
├── templates/                   # Session logs, RAM, results-to-narrative, etc.
├── quality_reports/             # Plans, specs, session logs, merge reports
└── master_supporting_docs/      # Reference papers and datasets
```

---

## Commands

```bash
# LaTeX paper (4-pass)
cd projects/PaperSlug/paper
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex

# Stata pipeline (from paper root)
stata -b do code/main.do

# R figures
Rscript code/R/figures.R

# Python data pull
python3 code/python/data_pull.py

# Quality score
python scripts/quality_score.py projects/PaperSlug/paper/main.tex
```

---

## Quality Thresholds

| Score | Gate | Meaning |
|-------|------|---------|
| 80 | Commit | Good enough to save |
| 90 | Co-author / submission draft | Ready for external eyes |
| 95 | Excellence | Aspirational |

Same thresholds apply to paper drafts and companion slides.

---

## Skills Quick Reference

| Command | What It Does |
|---------|-------------|
| `/referee-anticipation` | Generate RAM from current paper draft |
| `/results-to-narrative` | Convert Table N output to draft paragraph |
| `/review-paper [file]` | Full manuscript review |
| `/proofread [file]` | Grammar/typo/overflow review |
| `/compile-latex [file]` | 3-pass LaTeX + bibtex |
| `/validate-bib` | Cross-reference all citations |
| `/review-r [file]` | R code quality review |
| `/lit-review [topic]` | Literature search + synthesis |
| `/research-ideation [topic]` | Research questions + strategies |
| `/interview-me [topic]` | Interactive research interview |
| `/data-analysis [dataset]` | End-to-end analysis orchestration |
| `/commit [msg]` | Stage, commit, PR, merge |
| `/learn` | Save session learnings to MEMORY.md |

---

## Current Project State

| Paper | Status | Journal Target | Identification |
|-------|--------|----------------|----------------|
| [Paper 1 title] | Draft | [Target journal] | [DiD / IV / RD] |

---

## Beamer Environments (Companion Slides)

| Environment | Effect | Use Case |
|-------------|--------|---------|
| [your-env] | [Description] | [When to use] |

<!-- Add your Beamer environments as you build seminar slides -->
