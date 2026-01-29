# GDP Forecasting with MIDAS Regression

**M2 272 Gestion Quantitative - Université Paris Dauphine**

Replication of Andreou, Ghysels, Kourtellos (2013):  
*"Should Macroeconomic Forecasters Use Daily Financial Data and How?"*

---

## Project Structure

```
Gestion-Quantitative-MIDAS/
├── main.ipynb              # Main notebook (run this)
├── requirements.txt        # Python dependencies
├── README.md
│
├── DATAS/
│   └── bloomberg_all_tickers.csv   # Bloomberg financial data
│
├── FUNCTIONS/
│   ├── __init__.py         # Package init
│   ├── data_loader.py      # Bloomberg data loading
│   ├── transformations.py  # Log-returns, PCA factors
│   ├── midas.py            # MidasSpec, MidasModel class
│   ├── benchmarks.py       # AR(1) model, forecast combination
│   └── plots.py            # Visualization functions
│
└── PLOT ANALYSIS/          # Generated plots (auto-saved)
```

---

## Installation

### Option 1: Automatic Setup (Recommended)

**Windows:**
```bash
# Double-click setup.bat or run in terminal:
.\setup.bat
```

**Linux/Mac:**
```bash
chmod +x setup.sh
./setup.sh
```

This will:
1. Create a virtual environment (`.venv`)
2. Install all dependencies from `requirements.txt`
3. Configure the environment for Jupyter

### Option 2: Manual Setup

```bash
# Clone the repository
git clone <repo-url>
cd Gestion-Quantitative-MIDAS

# Create virtual environment
python -m venv .venv

# Activate (Windows)
.venv\Scripts\activate

# Activate (Linux/Mac)
source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

---

## Usage

1. **Activate the environment:**
   - Windows: `.venv\Scripts\activate`
   - Linux/Mac: `source .venv/bin/activate`

2. **Run the notebook:**
   - VS Code: Open `main.ipynb` and select `.venv` as kernel
   - Jupyter: `jupyter notebook main.ipynb`

3. Run all cells - plots are saved to `PLOT ANALYSIS/`

---

## Modules

### `data_loader.py`
Loads Bloomberg CSV data with special handling for date encoding issues.

### `transformations.py`
- `transform_panel_auto()`: Log-returns for prices, first-diff for rates
- `compute_daily_factors()`: PCA factor extraction

### `midas.py`
- `MidasSpec`: Model specification dataclass
- `MidasModel`: Estimation and recursive forecasting
- `MidasModelStateDep`: State-dependent extension with time-varying θ
- `exp_almon_weights()`: MIDAS weighting function

### `benchmarks.py`
- `AR1Model`: Simple AR(1) benchmark
- `combine_forecasts_msfe()`: MSFE-weighted forecast combination

### `plots.py`
Visualization functions saving to `PLOT ANALYSIS/`:
- `plot_forecast_comparison()`: MIDAS vs AR(1)
- `plot_factor_analysis()`: Factor performance, crisis periods
- `plot_midas_weights()`: Weight function analysis

---

## References

Andreou, E., Ghysels, E., & Kourtellos, A. (2013). *Should Macroeconomic Forecasters Use Daily Financial Data and How?* Journal of Business & Economic Statistics, 31(2), 240-251.

---

## Authors

M2 272 Gestion Quantitative - Université Paris Dauphine
