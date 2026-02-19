/*
 * File:        02_merge.do
 * Project:     [PaperSlug]
 * Author:      [Name]
 * Date:        [YYYY-MM-DD]
 *
 * Inputs:      ${root}/data/processed/clean_sample.dta
 *              ${root}/data/processed/[auxiliary_data.dta]
 * Outputs:     ${root}/data/final/analysis_sample.dta
 *              ${root}/output/logs/02_merge_YYYYMMDD.log
 *
 * Description: [Merge datasets; construct final analysis sample]
 */

local date = string(today(), "%tdCCYYNNDD")
cap log close
log using "${root}/output/logs/02_merge_`date'.log", replace text

use "${root}/data/processed/clean_sample.dta", clear

* --- Merge ---
merge [1:1 / m:1] [id_var] using "${root}/data/processed/[auxiliary_data.dta]"

* --- Always check merge quality ---
count if _merge != 3
assert _merge != 1  // No unmatched master observations (or document why)
drop _merge

* --- Save final sample ---
save "${root}/data/final/analysis_sample.dta", replace

log close
