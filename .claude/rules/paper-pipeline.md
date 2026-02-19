---
globs: ["projects/*/paper/**/*.tex", "projects/*/paper/*.tex"]
---

# Paper Pipeline

**Path scope:** `projects/*/paper/**/*.tex`

This rule governs the LaTeX manuscript workflow for empirical banking papers.
It is distinct from the Beamer slide workflow (see `beamer-quarto-sync.md`).

---

## Single Source of Truth

- `paper/main.tex` and `sections/*.tex` are the **authoritative source** for all paper content
- `slides/seminar.tex` is **derived** — when paper content changes, slides must be updated
- Never make content changes to slides that aren't also reflected in the paper

---

## Tables and Figures: Code-Generated Only

**Tables** must always be `\input{}` references:
```latex
\input{../output/tables/table2.tex}
```
Never type regression coefficients or standard errors manually in `.tex` files.

**Figures** must always be `\includegraphics{}` references:
```latex
\includegraphics[width=\textwidth]{../output/figures/fig1.pdf}
```
Never copy-paste figure content or embed screenshots.

If a table or figure needs to change, change the code that generates it, re-run the pipeline, and recompile the paper.

---

## Compilation

Standard 4-pass LaTeX compilation for papers:

```bash
cd projects/PaperSlug/paper
pdflatex -interaction=nonstopmode main.tex
bibtex main
pdflatex -interaction=nonstopmode main.tex
pdflatex -interaction=nonstopmode main.tex
```

Check the final compilation log for:
- Overfull `\hbox` warnings > 5pt (must fix)
- Undefined citation keys (must fix)
- Missing figure files (must fix)
- `\ref` and `\label` mismatches (must fix)

---

## Standard Paper Structure

```latex
\input{sections/introduction}
\input{sections/institutional-background}  % or Literature Review
\input{sections/data}
\input{sections/empirical-strategy}
\input{sections/results}
\input{sections/mechanism}
\input{sections/robustness}
\input{sections/conclusion}
\appendix
\input{appendix}
```

Section files live in `sections/` and are `\input{}` into `main.tex`.
Never write body content directly in `main.tex` (preamble and structure only).

---

## Identification Section Requirements

The `empirical-strategy.tex` section must contain, in order:
1. The identification assumption (stated explicitly)
2. The institutional setting that makes the assumption credible
3. The test or evidence supporting the assumption (parallel trends, first stage, etc.)
4. Discussion of the main threat to identification and why it is unlikely

See `identification-protocol.md` for causal language rules.

---

## Bibliography

- One bibliography file per paper: `paper/references.bib`
- Add entries as you go; never fabricate citations
- Use `\cite{}` with the standard author-year key format
- Run `bibtex main` as part of every full compilation

---

## Quality Before Commit

Before committing a paper revision:

- [ ] Tables and figures all present (no missing `\input{}` targets)
- [ ] No manually typed regression numbers in `.tex` files
- [ ] Identification assumption stated in `empirical-strategy.tex`
- [ ] No causal language in sections where identification assumption isn't stated
- [ ] Bibliography compiles cleanly (no undefined citations)
- [ ] No overfull hbox warnings > 5pt
- [ ] Appendix tables match robustness claims in body text
