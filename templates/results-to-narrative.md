# Results-to-Narrative Template

**Purpose:** Convert regression table output to paper prose without hallucinating numbers.
**Rule:** Every number in the output must come from the actual table. Use `[VERIFY: description]` for every specific value until you confirm it from the table.

---

## How to Use

1. Identify the table and key row you want to narrate
2. Fill in the **Input** fields below
3. Use the **Output Scaffold** that matches your design
4. Replace every `[VERIFY: ...]` tag with the actual number from the table
5. Review the final paragraph for identification language compliance (see `identification-protocol.md`)

---

## Input

```
Table: [Table number and title]
Key variable: [Treatment / main independent variable]
Outcome variable: [Dependent variable name]
Specification: [Column number and brief description]
Sample mean of outcome: [VERIFY: value from summary statistics]
```

---

## Output Scaffolds

### A. Difference-in-Differences

**Draft paragraph:**

> Table [N], Column [M] reports the baseline difference-in-differences estimates. Treated banks [VERIFY: increase/decrease] [outcome variable] by [VERIFY: coefficient × 100] percentage points relative to control banks following [event/policy], an effect equivalent to [VERIFY: magnitude / sample mean × 100]% of the pre-treatment sample mean. The estimate is [VERIFY: statistically significant at the X% level / not statistically significant]. [If significant:] This result is robust to alternative clustering at the [VERIFY: state/county/year] level (Table A[N]), alternative sample construction (Table A[N+1]), and [VERIFY: additional robustness check] (Table A[N+2]).

**Mechanism sentence (add after baseline):**

> Consistent with [mechanism], the effect is [VERIFY: larger/smaller] for banks with [VERIFY: characteristic], while banks without [VERIFY: characteristic] show [VERIFY: no effect / a smaller effect of X pp] (Table [N], Columns [M] and [M+1]).

---

### B. Instrumental Variables

**Draft paragraph:**

> Table [N] reports the IV estimates. The first stage confirms that [instrument] is a strong predictor of [endogenous variable], with an F-statistic of [VERIFY: value] (Column 1), well above the conventional threshold of 10. The second-stage estimate implies that a one-unit increase in [endogenous variable] [VERIFY: increases/decreases] [outcome] by [VERIFY: coefficient] [units], or [VERIFY: magnitude / mean × 100]% of the sample mean. [Causal language is permitted here because the IV exclusion restriction is stated in Section 3.2.]

**Exclusion restriction defense (must appear nearby):**

> The exclusion restriction requires that [instrument] affects [outcome] only through [endogenous variable]. We argue this holds because [VERIFY: institutional reason]. The main threat is [VERIFY: threat], which we address in [VERIFY: location in paper].

---

### C. Cross-Sectional / Panel OLS (Correlational)

**Draft paragraph:**

> Table [N], Column [M] shows that banks with higher [independent variable] are associated with [VERIFY: higher/lower] [outcome variable]. The coefficient of [VERIFY: value] implies that a one-standard-deviation increase in [independent variable] ([VERIFY: SD from Table 1]) is associated with a [VERIFY: coefficient × SD × 100] pp [VERIFY: increase/decrease] in [outcome], or [VERIFY: magnitude / mean × 100]% of the sample mean.

**Note:** Do not use causal verbs (causes, leads to, drives) in OLS cross-sectional results unless an identification assumption is explicitly stated. Use "is associated with," "predicts," or "is correlated with."

---

### D. Event Study

**Draft paragraph:**

> Figure [N] plots the event study estimates. The coefficients in the [VERIFY: X] periods prior to [event] are close to zero and not statistically different from zero (joint F-test: p = [VERIFY: value]), consistent with the parallel trends assumption. Following [event], treated banks [VERIFY: increase/decrease] [outcome] by [VERIFY: peak coefficient] pp in [VERIFY: year/quarter], with the effect [VERIFY: persisting / fading by period T].

---

## Economic Magnitude Sentences

Use one or more of these to contextualize the result:

- **Sample mean:** "...equivalent to [VERIFY: X]% of the unconditional sample mean of [VERIFY: Y]."
- **SD units:** "...a [VERIFY: X]-standard-deviation shift in [outcome]."
- **Dollar terms:** "...translating to approximately $[VERIFY: X] million per bank per year."
- **Comparable effect:** "...larger than the effect of [comparable intervention in the literature] ([VERIFY: citation]), which [VERIFY: effect size]."

---

## Robustness Summary Sentence

> The result is robust to [VERIFY: list 2-3 robustness checks from appendix tables], as reported in Table A[N] through Table A[N+k].

---

## Common Mistakes to Avoid

| Wrong | Right |
|-------|-------|
| "The coefficient is 0.04" (unverified) | "[VERIFY: coefficient from Table 2, col. 3]" |
| "Banks increase lending by 4%" (causal in OLS) | "Banks are associated with 4% higher lending" |
| "The effect is large" | "[VERIFY: X]% of the sample mean, [large/moderate/small] relative to [benchmark]" |
| Skipping F-stat for IV | "First-stage F = [VERIFY: value]" |
| Forgetting to cite the robustness table | "Table A[N] confirms..." |

---

## Checklist Before Using This Draft

- [ ] All `[VERIFY: ...]` tags replaced with actual numbers from tables
- [ ] No causal language in OLS sections (correlational language used)
- [ ] Economic magnitude contextualized (% of mean or SD)
- [ ] Robustness table cited
- [ ] Identification assumption stated before causal claims
