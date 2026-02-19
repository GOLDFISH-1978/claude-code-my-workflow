---
name: referee-anticipation
description: Generate a Referee Anticipation Matrix (RAM) from an empirical banking paper draft. Use when preparing for submission, responding to a desk rejection, or proofing the identification section. Trigger phrases: "referee anticipation", "generate RAM", "anticipate referee concerns", "referee matrix", "what will referees say".
allowed-tools: Read, Grep, Glob, Write
---

# Referee Anticipation Matrix Generator

## When to Use

- Paper draft is mostly complete and you want to anticipate top-journal concerns
- Preparing a cover letter or response to referees
- Stress-testing the identification section before submission
- After a desk rejection, to understand likely concerns

## Instructions

### Step 1: Locate the Paper

Find the paper in the current project. Look for:
- `paper/main.tex` or `paper/sections/*.tex` in the current `projects/*/` directory
- If no path is obvious, ask the user which paper to review

### Step 2: Read the Paper Thoroughly

Read in this order:
1. `sections/empirical-strategy.tex` — identification assumption and design
2. `sections/results.tex` and `sections/mechanism.tex` — main claims
3. `sections/data.tex` — sample and variable construction
4. `sections/robustness.tex` — what's already addressed
5. `sections/introduction.tex` — stated contribution and claims

### Step 3: Apply the Five Lenses

For each lens below, generate 2-5 specific predicted referee concerns based on the actual paper content. Be concrete — reference the specific claim, table, or section that would draw criticism.

**Lens 1: Identification Validity**
- Is the identification assumption clearly stated?
- What is the most credible threat to exogeneity?
- Are pre-trends documented (DiD)? First stage reported (IV)? Density test run (RD)?
- Does the paper use causal language without sufficient design justification?

**Lens 2: Data and Sample Quality**
- What sample restrictions could introduce selection bias?
- Are variable construction choices non-standard or undocumented?
- Is there potential survivorship bias?
- Does the sample period include structural breaks that could confound results?

**Lens 3: Mechanism**
- Is the proposed mechanism directly tested or only asserted?
- Could an alternative mechanism generate the same reduced-form result?
- Are heterogeneity results consistent with the stated mechanism?

**Lens 4: Alternative Explanations**
- What other events or policies coincide with the treatment?
- What omitted variables could drive the result?
- Does the placebo test convincingly rule out spurious correlations?

**Lens 5: Statistical Robustness**
- Is the result robust to alternative SE clustering?
- Are there subsample stability concerns?
- Is the economic magnitude contextualized and defensible?
- Are there multiple testing concerns across outcome variables?

### Step 4: Assign Severity

For each concern:
- **High** — Would likely lead to rejection if unaddressed
- **Med** — Would require a response in revision
- **Low** — Minor clarification request

### Step 5: Generate the RAM

Populate the template from `templates/referee-anticipation-matrix.md` with the predicted concerns. Save to:

```
projects/[PaperSlug]/docs/referee-anticipation-YYYY-MM-DD.md
```

Report the file path to the user and summarize:
- Total concerns identified
- Number marked High severity
- Top 3 most critical issues (suggested immediate action)

## Important Rules

1. **Only report concerns you can ground in the paper text.** Do not fabricate vague generic concerns.
2. **Do not invent numbers.** If a concern requires a specific value, write `[VERIFY: value from paper]`.
3. **Distinguish "not found" from "wrong."** If the parallel trends test isn't in the paper, say "not found in draft" — not "fails parallel trends."
4. **Be harsh but fair.** Channel a top-5 finance journal referee. Flag genuine issues, not stylistic preferences.
5. **Do not edit any paper files.** This is a review skill — generate the RAM only.

## Examples

### Example trigger
> "Can you generate a RAM for the bank capital paper before I submit?"

### What Claude does
1. Reads `projects/bank-capital/paper/sections/empirical-strategy.tex`
2. Finds: DiD design with staggered adoption, uses two-way FE (not Callaway-Sant'Anna)
3. Flags: High severity concern — "Standard TWFE with staggered adoption may be biased; paper should use Callaway-Sant'Anna (2021) or Sun-Abraham (2021)"
4. Continues through all 5 lenses
5. Saves populated RAM to `projects/bank-capital/docs/referee-anticipation-2026-02-19.md`

## Troubleshooting

- **No paper found:** Ask user for the path to `main.tex` or the paper's sections directory
- **Paper is incomplete:** Note which sections are missing; generate concerns based on what exists; flag gaps
- **Very long paper:** Read introduction + empirical strategy + results first; read other sections on demand
