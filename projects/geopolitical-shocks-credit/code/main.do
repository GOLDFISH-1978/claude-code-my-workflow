/*
 * File:        main.do
 * Project:     geopolitical-shocks-credit
 * Author:      [Name]
 * Date:        [YYYY-MM-DD]
 * Last edit:   [YYYY-MM-DD]
 *
 * Description: Master runner — executes full data pipeline end-to-end.
 *              Set global root before running. Run: do main.do
 */

* --- CONFIGURE THIS ONCE ---
global root "[ABSOLUTE PATH TO projects/geopolitical-shocks-credit]"
* Example: global root "/Users/name/projects/geopolitical-shocks-credit"

* --- Setup ---
version 17
set more off
local date = string(today(), "%tdCCYYNNDD")

cap log close
log using "${root}/output/logs/main_`date'.log", replace text

* --- Run pipeline ---
do "${root}/code/stata/01_clean.do"
do "${root}/code/stata/02_merge.do"
do "${root}/code/stata/03_analysis.do"
do "${root}/code/stata/04_robustness.do"

log close
di "Pipeline complete: `date'"
