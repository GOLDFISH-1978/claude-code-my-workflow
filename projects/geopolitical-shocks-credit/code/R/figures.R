# figures.R — [PaperSlug]
# Purpose: Generate all figures for the paper
# Inputs:  data/final/analysis_sample.csv (or .dta via haven)
# Outputs: output/figures/fig1_*.pdf, fig2_*.pdf, ...
#
# Run from project root: Rscript code/R/figures.R

library(tidyverse)
library(here)

# --- Paths ---
ROOT <- here::here()  # Assumes script run from project root
data_path <- file.path(ROOT, "data", "final")
fig_path  <- file.path(ROOT, "output", "figures")
dir.create(fig_path, showWarnings = FALSE, recursive = TRUE)

# --- Load data ---
# df <- read_csv(file.path(data_path, "analysis_sample.csv"))
# or: df <- haven::read_dta(file.path(data_path, "analysis_sample.dta"))

# --- Figure 1: [Description] ---
# p1 <- ggplot(df, aes(...)) + ...
# ggsave(file.path(fig_path, "fig1_event_study.pdf"), p1, width = 7, height = 5)

message("Figures saved to: ", fig_path)
