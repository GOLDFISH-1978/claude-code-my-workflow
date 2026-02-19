# Workflow Quick Reference — Banking Paper Factory

**Model:** Contractor (you direct, Claude orchestrates)

---

## The Loop

```
Idea / question
    ↓
[IDENTIFY] Design the identification strategy first — instrument, DiD, RD, event study
    ↓
[PLAN] (if multi-file or unclear) → Show plan → Your approval
    ↓
[DATA] Build reproducible Stata/R/Python pipeline → logs + code-generated outputs only
    ↓
[ANALYZE] Run regressions → tables in output/tables/ (never manual)
    ↓
[WRITE] results-to-narrative template + [VERIFY] tags → fill in from actual tables
    ↓
[REFEREE-PROOF] /referee-anticipation → address High-severity concerns → resubmit loop
    ↓
[SUBMIT] Pre-submission checklist passed → submit
    ↓
Repeat (revision / new paper)
```

---

## I Ask You When

- **Design forks:** "IV vs. DiD — which is more credible given X?"
- **Identification threat:** "Is threat Y addressed well enough or should I add a test?"
- **Specification ambiguity:** "Two-way clustering vs. state × year FE — which fits the setting?"
- **Scope question:** "Run robustness N now or after next draft?"
- **Novel result:** "Unexpected sign — investigate mechanism or check the code?"

---

## I Just Execute When

- Code fix is obvious (bug, missing log statement, broken path)
- Verification (tolerance checks, compilation, pipeline run)
- Documentation (session logs, submission log, RAM update)
- Figure generation (per established R/Stata standards)
- Deployment (after you approve, I handle LaTeX compile + bibliography)

---

## Quality Gates (No Exceptions)

| Score | Action |
|-------|--------|
| ≥ 80 | Ready to commit |
| ≥ 90 | Ready for co-author / submission draft |
| < 80 | Fix blocking issues first |

---

## Non-Negotiables

- **`${root}` paths in all Stata do-files** — no hardcoded absolute paths
- **`set.seed()` at top** for any stochastic R or Python code
- **`[VERIFY]` tags in all AI-drafted narrative** — never auto-filled with invented numbers
- **Identification assumption stated before any causal claim** — no exceptions (see `identification-protocol.md`)
- **All tables and figures from code** — no manual edits to `.tex` tables or `.pdf` figures
- **Every Stata do-file opens and closes a log** — to `output/logs/`
- **No fabricated citations** — if a paper can't be verified, do not cite it

---

## Preferences

**Primary tool for regressions:** Stata (`reghdfe`, `ivreghdfe`, `estout`/`esttab`)
**Figures:** R (ggplot2 preferred; export as `.pdf` to `output/figures/`)
**Data pulls / automation:** Python (`.py` scripts only; `.ipynb` for exploration only)
**Reporting:** Concise bullets first; details on request
**Session logs:** Always (post-plan, incremental, end-of-session)
**Replication tolerance:** Exact match for point estimates; ±0.001 acceptable for SE differences across packages

---

## Pre-Submission Checklist

Before sending to a journal:

- [ ] `/referee-anticipation` run; all High-severity concerns addressed or accepted as limitations
- [ ] All tables: `\input{../output/tables/*.tex}` (no manually typed numbers in paper)
- [ ] All figures: `\includegraphics{../output/figures/*.pdf}` (no screenshots)
- [ ] `main.do` runs end-to-end cleanly from scratch
- [ ] Identification assumption stated explicitly in `empirical-strategy.tex`
- [ ] No causal language in OLS sections (checked by `identification-protocol.md`)
- [ ] Minimum Publishable Robustness checklist complete (5 items in domain-reviewer)
- [ ] Bibliography compiles cleanly; no undefined citations
- [ ] Parallel trends / first stage / density test reported (as appropriate for design)

---

## Exploration Mode

For prototype regressions, data scoping, or speculative mechanism tests:
- Work in `explorations/` folder
- 60/100 quality threshold (vs. 80/100 for paper pipeline)
- No plan needed — just a 2-minute research value check
- Notebooks allowed here; mark as `Status: Exploratory`
- See `.claude/rules/exploration-fast-track.md`

---

## Key Skills

| Command | When to Use |
|---------|------------|
| `/referee-anticipation` | Before submission or after a desk rejection |
| `/results-to-narrative` | Converting Table N to a draft paragraph |
| `/review-paper [file]` | Full manuscript review |
| `/validate-bib` | Before submission — no undefined citations |
| `/compile-latex [file]` | 3-pass LaTeX compilation |
| `/review-r [file]` | R code quality check |
| `/learn` | Save a pattern discovered in this session to MEMORY.md |

---

## Next Step

You provide task → I plan (if needed) → Your approval → Execute → Done.
