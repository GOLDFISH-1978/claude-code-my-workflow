# Identification Protocol

**This rule is always active.** It governs causal language and identification discipline in all banking papers, slides, and code output.

---

## Core Principle

Every causal claim requires a stated identification assumption. If the design does not support causal inference, use correlational language. There are no exceptions.

---

## No Causal Language Without Design

**Forbidden causal verbs** (unless the identification assumption is explicitly stated AND defended in the same section or slide):

> causes · leads to · drives · impacts · affects · induces · increases · decreases · improves · worsens · generates · produces · results in

**Permitted correlational alternatives:**

> is associated with · predicts · is correlated with · is related to · co-moves with · is linked to · is higher for · is lower when

**When causal language IS permitted:**
The identification assumption must appear in the same section (paper) or the same slide or the immediately preceding slide (presentation), with a clear defense of why it holds.

**Example of the required pattern:**
> "Assuming that regulatory cutoffs are not manipulated (the RD continuity assumption), banks just below the threshold provide a valid counterfactual for banks just above. Under this assumption, crossing the threshold *causes* a [VERIFY: X pp] increase in capital ratios."

---

## Design-Specific Requirements

### Instrumental Variables
- First-stage F-statistic ≥ 10; if using weak-instrument-robust inference (e.g., Anderson-Rubin, Conditional Likelihood Ratio), state which method
- Exclusion restriction: state it, defend it, and identify the most credible threat
- Monotonicity: confirm or discuss LATE vs. ATE interpretation

### Difference-in-Differences
- Parallel trends test required; document which pre-period test is used
- Staggered adoption: must cite Callaway and Sant'Anna (2021) or Sun and Abraham (2021) and explain design choice
- Anticipation effects: address explicitly if treatment is announced before effective date

### Event Studies
- Normalization period: document which period is set to zero and why
- Binning rule: document end-point bin choice and sensitivity
- Contamination: exclude firms with overlapping events if relevant

### Regression Discontinuity
- McCrary (2008) or Cattaneo-Jansson-Ma density test required
- Bandwidth selection: state algorithm (IK, CCT, or manual); show sensitivity to bandwidth
- Donut RD: document exclusion radius if used

### Cross-Sectional / Panel OLS
- If using causal language, justify via selection-on-observables argument or cite a natural experiment in the same paper
- Otherwise use correlational language only

---

## Robustness Architecture

Every main result (Table 1 / Figure 1) must have at least one robustness check. The minimum architecture:

1. Alternative standard error clustering (e.g., state × year vs. bank)
2. Alternative sample (winsorization threshold, sample period, excluded outliers)
3. Alternative specification (different control variables or fixed effects)

Robustness checks go in a dedicated Robustness section and/or appendix tables. Do not bury them in footnotes.

---

## Red Flags

These patterns should trigger a warning and are not permitted without explicit justification:

- **Specification search:** Choosing controls to achieve significance
- **Multiple testing without correction:** More than 5 outcome variables without Bonferroni, Holm, or FDR adjustment
- **Kitchen sink controls:** Including all available controls without theoretical motivation
- **Survivorship bias:** Sample restricted to survivors without discussion
- **Outcome variable redefinition:** Changing the primary outcome after seeing results

---

## Applying This Rule

When reviewing text, code comments, or presentation content:

1. Flag every causal verb
2. Check whether the identification assumption is stated in the same location
3. If not → replace with correlational language or add the assumption
4. Log the correction as `[LEARN:identification]` if a pattern is found repeatedly
