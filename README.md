# Corporate Bond Yield & Financial Metrics Analysis

An econometric analysis predicting the yield to maturity of senior secured bonds issued by S&P 500 companies using multiple linear regression in R.



## Project Overview

Yield to maturity represents an investor’s expected return and is determined by a bond’s price, relative to its future payout. By predicting this value, the model helps determine whether a bond is considered cheap or expensive relative to fair value, informing buy or sell decisions. If the predicted yield to maturity is greater than the market-implied yield, then the bond is overpriced, and vice versa.

This project builds a moderately strong empirical linear regression model (R-squared = 0.3641, RSE = 0.92%) to evaluate key financial and macro-level factors influencing senior secured bond yields. 



## Key Findings & Methodology

- **Sample Size:** n = 1,081 senior secured bonds across S&P 500 issuing companies.
- **Model Progression & Performance:**
  - The initial model explained 30.67% of variation (R-squared = 0.3067) with an RSE of 0.95%.
  - The final model improved the R-squared to 0.3641 and reduced the residual standard error to 0.92%, cutting average error by 19.47% compared to the baseline standard deviation.
- **Model Diagnostics & Assumptions:**
  - **Non-Linearity & Skewness:** Addressed heavy right-skewness in company size by log-transforming market value (log(Market Value)), capturing a clear inverse linear relationship with yield.
  - **Multicollinearity:** Evaluated using Variance Inflation Factors (VIF < 1.18) and correlation matrices.
  - **Model Selection:** Utilized Mallow's Cp improvements (dropping from 112.02 to 74.83) and nested F-tests (p < 0.05) to justify adding RBICS economic sectors and a duration-leverage interaction term.
- **Practical Insights:**
  - **Company Size:** A 100% increase in market value (ranging from $6.45 billion to $3.75 trillion) decreases bond yield by approximately 0.47%, holding other factors constant.
  - **Leverage & Duration Interaction:** Yields increase by 0.11% per unit of Debt/EBITDA, but this penalty compounds by an additional 0.10% more for long-term durations than short/medium-term ones—highlighting compounding uncertainty over time.
  - **Sector Variation:** Consumer Services sector bonds exhibit a yield 0.49% higher on average than the Business Services reference sector.


## Repository Structure

```text
├── 00_prep.R               # Data cleaning, feature engineering, and joining script
├── project_analysis.Rmd    # Complate R Markdown source script containing code and figures
├── final_figures.pdf       # Contains the figures rendered in project_analysis.Rmd
├── final_report.pdf        # Full analytical report and statistical write-up
├── .gitignore              # Configured to exclude proprietary raw data and RStudio cache
├── .bond_analysis.Rproj    # .Rproj file 
└── README.md               # Project documentation
```

## R Packages Used
- `tidyverse`
- `janitor`
- `readxl`
- `car` (for VIF diagnostics)
- `olsrr` (for regression diagnostics)
- `patchwork`
- `modelr`

## Data Restrictions
The raw financial data used in this project was sourced from FactSet under proprietary licensing. Therefore, raw dataset files are omitted from this public repository.

## Authors
- Robert Silaghi
- George Kobrossy
- Malachi Cassels
