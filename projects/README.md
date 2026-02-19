# Banking Paper Factory — Projects

Each paper lives in its own subfolder. Copy `_example_paper/` to get started.

---

## Quick Start

```bash
cp -r projects/_example_paper projects/my-paper-slug
# then open projects/my-paper-slug/paper/main.tex
```

Replace every `[PaperSlug]` and `[Description]` placeholder in the copied files.

---

## Standard Per-Paper Structure

```
projects/PaperSlug/
├── paper/                         # LaTeX manuscript (authoritative source)
│   ├── main.tex                   # Master document (\input sections)
│   ├── sections/
│   │   ├── introduction.tex
│   │   ├── data.tex
│   │   ├── empirical-strategy.tex # Identification assumption lives here
│   │   ├── results.tex
│   │   ├── mechanism.tex
│   │   ├── robustness.tex
│   │   └── conclusion.tex
│   ├── appendix.tex
│   └── references.bib
│
├── data/
│   ├── raw/          # Never modified; large files go in .gitignore
│   ├── processed/    # Intermediate .dta / .csv / .parquet
│   └── final/        # Analysis-ready datasets
│
├── code/
│   ├── main.do       # Master Stata runner (entry point for full pipeline)
│   ├── stata/
│   │   ├── 01_clean.do
│   │   ├── 02_merge.do
│   │   ├── 03_analysis.do
│   │   └── 04_robustness.do
│   ├── R/
│   │   └── figures.R
│   └── python/
│       └── data_pull.py
│
├── output/
│   ├── tables/       # .tex tables from estout (never manually edited)
│   ├── figures/      # .pdf figures from R/Stata (never manually edited)
│   └── logs/         # Stata/R/Python run logs (auto-generated)
│
├── slides/
│   └── seminar.tex   # Beamer companion slides (derived from paper)
│
└── docs/
    ├── referee-anticipation-YYYY-MM-DD.md  # Living RAM (run /referee-anticipation)
    └── submission-log.md                   # Journal history
```

---

## Key Rules

| Rule | Where Defined |
|------|---------------|
| Identification assumption before causal claims | `.claude/rules/identification-protocol.md` |
| No causal language without design | `.claude/rules/identification-protocol.md` |
| Tables/figures from code only | `.claude/rules/paper-pipeline.md` |
| Stata logs + code-generated output | `.claude/rules/stata-code-conventions.md` |
| Notebooks are exploratory only | `.claude/rules/notebook-reproducibility.md` |
| Paper .tex is authoritative; slides derived | `.claude/rules/paper-pipeline.md` |

---

## Useful Skills

| Command | What It Does |
|---------|-------------|
| `/referee-anticipation` | Generate RAM from current paper draft |
| `/results-to-narrative` | Convert table output to draft paragraph |
| `/review-paper [file]` | Full manuscript review |
| `/proofread [file]` | Grammar/typo check |
| `/compile-latex [file]` | 3-pass LaTeX compilation |
| `/validate-bib` | Cross-reference all citations |

---

## Adding a New Paper

1. `cp -r projects/_example_paper projects/new-paper-slug`
2. Edit `code/main.do` — set `global root` to the absolute path of the new folder
3. Add paper metadata to the **Current Project State** table in `CLAUDE.md`
4. Start with `paper/sections/empirical-strategy.tex` — state the identification assumption first
5. Run `/referee-anticipation` before the first draft is complete to catch structural issues early

---

## .gitignore Recommendations

Add to your `.gitignore`:

```gitignore
# Large raw data (keep processed and final if small enough)
projects/*/data/raw/

# Stata temporary files
projects/**/*.stswp

# LaTeX build artifacts (keep output tables/figures)
projects/**/*.aux
projects/**/*.log
projects/**/*.synctex.gz
projects/**/*.blg
projects/**/*.bbl
```
