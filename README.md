# nifty50-stock-trend-analysis
# Nifty 50 Stock Trend Analysis 2020–2024

![Power BI](https://img.shields.io/badge/PowerBI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![Pandas](https://img.shields.io/badge/Pandas-150458?style=for-the-badge&logo=pandas&logoColor=white)

## 📌 Project Overview
An end-to-end data analytics project analyzing 5 years of Nifty 50 index historical data
to identify price trends, technical indicators, market signals, and investment insights.

## ❓ Business Problem Statement
A domestic asset management company wants to understand the long-term price behavior
of the Nifty 50 index to guide large-cap fund allocation decisions.

> "How can the firm use 5 years of Nifty 50 historical data to identify trend cycles,
> detect support/resistance zones, and build a visual dashboard for smarter
> index-based investment decisions?"

## 🛠️ Tools & Technologies
| Tool | Purpose |
|------|---------|
| Python (pandas, numpy, yfinance) | Data collection, cleaning, feature engineering |
| Matplotlib | Data visualization |
| MySQL | Data storage & SQL analysis |
| Power BI | Interactive dashboard |
| GitHub | Version control |

## 📁 Project Structure
```
nifty50/
├── data/
│   ├── nifty50_data.csv
│   ├── nifty50_cleaned.csv
│   └── nifty50_features.csv
├── python/
│   └── nifty50 analysis.ipynb
├── sql/
│   └── nifty50 sql code.sql
├── powerbi/
│   └── nifty50.pbix
├── report/
│   └── Nifty50_Project_Report.docx
└── README.md
```

## 📊 Dataset Details
- **Source:** Yahoo Finance (via yfinance library)
- **Ticker:** ^NSEI (Nifty 50 Index)
- **Period:** January 2020 – December 2024
- **Total Records:** 1,234 trading days
- **Columns:** Open, High, Low, Close, Volume

## ⚙️ Feature Engineering
The following technical indicators were engineered from raw OHLCV data:
- **Moving Averages:** SMA 20, SMA 50, SMA 200, EMA 20, EMA 50
- **Bollinger Bands:** Upper, Middle, Lower, Width
- **RSI:** 14-day Relative Strength Index
- **MACD:** MACD Line, Signal Line, Histogram
- **Returns:** Daily Return, Cumulative Return
- **Volatility:** 30-day Rolling Volatility
- **Signals:** Trend, RSI Signal, MACD Signal Flag
- **Date Features:** Year, Month, Quarter, Day of Week

## 🔍 SQL Business Queries
12 business queries were written to answer key questions:
1. Year-wise performance analysis
2. Monthly trend analysis
3. Best 10 trading days
4. Worst 10 trading days
5. Quarterly volatility analysis
6. Uptrend vs Downtrend breakdown
7. RSI signal distribution
8. MACD signal analysis
9. Day of week returns
10. COVID crash & recovery (2020)
11. High volume days analysis
12. Yearly cumulative return

## 📈 Key Findings
- 📈 Nifty 50 grew from ₹10,000 to ₹26,200 — approximately **160% return** over 5 years
- 📉 Worst day: **March 23, 2020** at **-12.98%** (COVID-19 crash)
- 📈 Best day: **April 7, 2020** at **+8.76%** (COVID recovery bounce)
- 📅 **Tuesday** is historically the strongest trading day
- 🔴 Market was in **Uptrend 70%** of the time over 5 years
- 📊 **69.2% Neutral**, 26.3% Overbought, 4.5% Oversold (RSI signals)
- 💹 Nifty delivered **positive returns in 4 out of 5 years**

## 🖥️ Power BI Dashboard
The interactive dashboard includes:
- KPI Cards (All Time High, Low, Avg Price, Avg Return, Trading Days)
- Price Trend Chart with Moving Averages (SMA 20, 50, 200)
- Year-wise Average Daily Return Bar Chart
- RSI Indicator Line Chart
- Market Signal Breakdown Donut Chart
- Average Return by Day of Week Bar Chart
- Year & Trend Button Slicers
  <img width="1245" height="649" alt="Screenshot 2026-03-21 101122" src="https://github.com/user-attachments/assets/3f5993fc-a569-499f-8c0d-68aea3a96bbe" />


## 🚀 How to Run
1. Clone the repository:
```bash
   git clone https://github.com/YOUR_USERNAME/nifty50-stock-trend-analysis.git
```
2. Install Python dependencies:
```bash
   pip install yfinance pandas numpy matplotlib sqlalchemy mysql-connector-python
```
3. Run the Jupyter notebook in `python/` folder
4. Import `nifty50_features.csv` into MySQL and run `sql/nifty50_queries.sql`
5. Open `powerbi/nifty50_dashboard.pbix` in Power BI Desktop

## 📋 Requirements
```
yfinance
pandas
numpy
matplotlib
sqlalchemy
mysql-connector-python
ta
plotly
```


## 📄 License
This project is for educational and portfolio purposes only.
Data sourced from Yahoo Finance via the yfinance library.
