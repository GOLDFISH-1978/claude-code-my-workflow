"""
data_pull.py — [PaperSlug]
Purpose: [Pull data from API / database / external source]
Inputs:  [API credentials from environment variables, not hardcoded]
Outputs: data/raw/[output_file.csv]

Run: python code/python/data_pull.py
"""

from pathlib import Path
from datetime import date
import logging

# --- Paths (no hardcoded absolute paths) ---
ROOT = Path(__file__).parent.parent.parent  # projects/PaperSlug/
DATA_RAW = ROOT / "data" / "raw"
LOG_DIR = ROOT / "output" / "logs"
DATA_RAW.mkdir(parents=True, exist_ok=True)
LOG_DIR.mkdir(parents=True, exist_ok=True)

# --- Logging ---
log_file = LOG_DIR / f"data_pull_{date.today().strftime('%Y%m%d')}.txt"
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s %(levelname)s %(message)s",
    handlers=[logging.FileHandler(log_file), logging.StreamHandler()],
)
logger = logging.getLogger(__name__)

# --- Main ---
def main():
    logger.info("Starting data pull")
    # [Add data pull logic here]
    # Credentials: load from environment variables, never hardcode
    # api_key = os.environ["API_KEY"]
    logger.info("Data pull complete. Output saved to: %s", DATA_RAW)


if __name__ == "__main__":
    main()
