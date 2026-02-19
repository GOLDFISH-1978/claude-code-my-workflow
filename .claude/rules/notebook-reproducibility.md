---
globs: ["projects/*/code/**/*.ipynb", "explorations/**/*.ipynb"]
---

# Notebook Reproducibility

**Path scope:** `projects/*/code/**/*.ipynb` and `explorations/**/*.ipynb`

---

## Core Rule

**Notebooks are exploratory only.**

Any logic that runs in a production pipeline — data cleaning, model estimation, table or figure generation — must live in a `.py`, `.do`, or `.R` script. Notebooks are for understanding data, testing ideas, and generating visualizations that will later be formalized in scripts.

If notebook code needs to run as part of the reproducible pipeline, convert it to a script first.

---

## Required Header Cell

Every notebook must begin with a markdown cell containing:

```markdown
## [Notebook Title]

**Purpose:** [One sentence: what this notebook does]
**Inputs:**
- `../../data/processed/filename.csv`  (relative to notebook location)
**Outputs:**
- `../../output/logs/notebook_name_YYYYMMDD.txt`  (run report)
- `../../output/figures/figN.pdf`  (if any figures are produced)
**Status:** Exploratory / Production-ready (choose one)
```

If **Status** is `Production-ready`, convert to a `.py` script before finalizing the pipeline.

---

## Run Report Export

Every notebook must export a brief run report to `output/logs/` on completion.
Add a final cell:

```python
from datetime import date
import pathlib

report = f"""
Notebook: [notebook_name]
Run date: {date.today().isoformat()}
Inputs loaded: [list key input files]
Outputs written: [list key output files]
Final shapes: [relevant summary]
"""

log_path = pathlib.Path("../../output/logs") / f"notebook_name_{date.today().strftime('%Y%m%d')}.txt"
log_path.parent.mkdir(parents=True, exist_ok=True)
log_path.write_text(report)
print(f"Run report saved to {log_path}")
```

---

## Reproducibility Requirements

1. **Restartable from scratch.** The notebook must run cleanly via Kernel → Restart & Run All with no prior state. No reliance on variables defined in earlier sessions.

2. **No hardcoded absolute paths.** Use relative paths or define a `ROOT` variable:
   ```python
   from pathlib import Path
   ROOT = Path("../../")  # relative to notebook location
   DATA = ROOT / "data" / "processed"
   ```

3. **No credentials or PII in cell outputs.** Clear all outputs that contain API keys, passwords, full PII tables, or raw customer data before committing.

4. **Random seed set once at top:**
   ```python
   import numpy as np
   np.random.seed(42)
   import random
   random.seed(42)
   ```

---

## What Belongs in a Notebook vs. a Script

| Task | Notebook | Script |
|------|----------|--------|
| Initial data exploration | ✅ | |
| Visualizing distributions | ✅ | |
| Prototype regression | ✅ | |
| Final data pipeline | | ✅ `.py` or `.do` |
| Production figures | | ✅ `.R` or `.py` |
| Scheduled / automated runs | | ✅ script only |
| Code reviewed by co-authors | | ✅ script preferred |

---

## Exploration Notebooks

Notebooks in `explorations/` follow the same header and run-report rules, but the quality threshold is 60/100 (see `exploration-fast-track.md`). Status must be `Exploratory`.
