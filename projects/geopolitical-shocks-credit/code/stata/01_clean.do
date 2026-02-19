/*
 * File:        01_clean.do
 * Project:     [PaperSlug]
 * Author:      [Name]
 * Date:        [YYYY-MM-DD]
 * Last edit:   [YYYY-MM-DD]
 *
 * Inputs:      ${root}/data/raw/[source_file.dta]
 * Outputs:     ${root}/data/processed/clean_[sample].dta
 *              ${root}/output/logs/01_clean_YYYYMMDD.log
 *
 * Description: [Clean raw data: handle missing values, winsorize, label variables]
 */

local date = string(today(), "%tdCCYYNNDD")
cap log close
log using "${root}/output/logs/01_clean_`date'.log", replace text

* --- Load raw data ---
use "${root}/data/raw/[source_file.dta]", clear

* --- [Cleaning steps go here] ---

* --- Save processed data ---
save "${root}/data/processed/clean_sample.dta", replace

log close
