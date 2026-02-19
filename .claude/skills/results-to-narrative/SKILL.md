---
name: results-to-narrative
description: Convert a regression table or figure into a draft results paragraph following the Results-to-Narrative template. Use when writing or revising the results section of an empirical paper. Trigger phrases: "convert results to prose", "narrate Table N", "write results paragraph", "results to narrative", "draft the results section", "write up Table N".
allowed-tools: Read, Grep, Glob, Write
---

# Results-to-Narrative Converter

## When to Use

- You have regression output and want a draft paragraph for the results section
- You need to contextualize an economic magnitude
- You want to check that your narrative matches identification-protocol.md requirements
- You're drafting the mechanism section from heterogeneity tables

## Instructions

### Step 1: Gather Inputs

Ask the user for (or infer from context):
1. **Table reference:** "Table 2, Column 3" or a description of the result
2. **Design type:** DiD / IV / OLS / Event study (determines scaffold)
3. **Key coefficient:** The main result row (variable name and value if known)
4. **Outcome variable:** Name and units
5. **Sample mean of outcome:** From Table 1 summary statistics (if available)

If the paper files are accessible, read the relevant table `.tex` file from `output/tables/` to verify numbers.

### Step 2: Select the Scaffold

From `templates/results-to-narrative.md`, choose the matching design scaffold:
- **A** — Difference-in-Differences
- **B** — Instrumental Variables
- **C** — Cross-Sectional / Panel OLS
- **D** — Event Study

### Step 3: Draft the Paragraph

Produce a draft paragraph using the scaffold. Apply these rules:

1. **Use `[VERIFY: ...]` for every specific number.** Do not invent coefficients, standard errors, or p-values. If the user has provided numbers, use them exactly and tag them as `[VERIFIED]`.
2. **Check identification language.** If the design is OLS/correlational, use "associated with," "predicts," "is correlated with" — never "causes," "leads to," or "drives."
3. **Include economic magnitude.** Express the coefficient as a % of the sample mean (if known) or in intuitive units.
4. **Include robustness sentence.** Reference at least one appendix table (even if it doesn't exist yet — tag as `[VERIFY: Table A_]`).
5. **Include mechanism sentence** if the user provides heterogeneity results.

### Step 4: Add Checklist

Append the checklist from `templates/results-to-narrative.md` at the end of the draft so the user knows what to verify.

### Step 5: Save (Optional)

If the user wants to save the draft, write it to:
```
projects/[PaperSlug]/paper/sections/results_draft_YYYY-MM-DD.md
```
(markdown, not `.tex` — it's a draft for review, not direct input)

## Important Rules

1. **Never invent numbers.** Every coefficient, p-value, and magnitude must come from the user or the actual table file. Use `[VERIFY]` for anything unconfirmed.
2. **Never use causal language for OLS results** unless the user explicitly confirms an identification design is in play.
3. **Follow the scaffold exactly.** The template structure exists to prevent missing economic magnitude, robustness citations, and mechanism statements.
4. **Do not edit source paper files.** This skill produces a draft for the user to paste in — it does not directly edit `results.tex`.

## Examples

### Example 1: DiD result

**User says:** "Write up the main result from Table 2. It's a DiD. The treatment variable is post × treated. The outcome is log loan growth. Sample mean of log loan growth is 0.08."

**Claude produces:**
> Table 2, Column [VERIFY: M] reports the baseline difference-in-differences estimates. Treated banks experience a [VERIFY: sign] [VERIFY: coefficient × 100] pp change in log loan growth relative to control banks following the policy change, an effect equivalent to [VERIFY: magnitude / 0.08 × 100]% of the pre-treatment sample mean. The estimate is [VERIFY: statistically significant at X% / not significant]. This result is robust to alternative clustering at the [VERIFY: state/year] level (Table A[VERIFY: N]), alternative sample construction (Table A[VERIFY: N+1]), and [VERIFY: robustness check] (Table A[VERIFY: N+2]).

### Example 2: IV with weak instrument concern

**User says:** "Write up the IV result. First stage F is 8.2."

**Claude flags:** First-stage F = 8.2 is below the conventional threshold of 10. The narrative should note: "While the first-stage F-statistic of 8.2 is below the conventional threshold of 10, we report [VERIFY: weak-instrument-robust inference method, e.g., Anderson-Rubin confidence intervals] as a robustness check."

## Troubleshooting

- **User doesn't know sample mean:** Instruct to check Table 1 summary statistics; leave `[VERIFY: sample mean]` in draft
- **No table file accessible:** Proceed with `[VERIFY]` tags throughout; user fills them in
- **Mixed design (DiD + IV):** Use scaffold B (IV) for the instrumented result; note the first stage explicitly
- **Multiple outcomes:** Draft one paragraph per outcome variable; keep each concise
