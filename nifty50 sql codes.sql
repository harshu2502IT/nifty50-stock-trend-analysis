use nifty50_db;
SELECT 
    *
FROM
    nifty50;

-- How did Nifty perform each year?
SELECT 
    Year,
    ROUND(MIN(Close), 2) AS Yearly_Low,
    ROUND(MAX(Close), 2) AS Yearly_High,
    ROUND(AVG(Close), 2) AS Avg_Close,
    ROUND(AVG(Daily_Return), 4) AS Avg_Daily_Return,
    ROUND(SUM(Volume) / 1000000, 2) AS Total_Volume_M,
    COUNT(*) AS Trading_Days
FROM
    nifty50
GROUP BY Year
ORDER BY Year;

-- Which months are historically strongest?
SELECT 
    Month,
    Month_Name,
    ROUND(AVG(Close), 2) AS Avg_Close,
    ROUND(AVG(Daily_Return), 4) AS Avg_Return,
    ROUND(AVG(Volatility_30), 4) AS Avg_Volatility,
    COUNT(*) AS Trading_Days
FROM
    nifty50
GROUP BY Month , Month_Name
ORDER BY Month;


--  Best 10 trading days
SELECT 
    Trade_Date,
    ROUND(Open, 2) AS Open,
    ROUND(Close, 2) AS Close,
    ROUND(Daily_Return, 2) AS Daily_Return_Pct,
    Volume,
    RSI_Signal,
    Trend
FROM
    nifty50
ORDER BY Daily_Return DESC
LIMIT 10;

-- Quarterly volatility: Which quarters are most volatile?
SELECT 
    Year,
    Quarter,
    ROUND(AVG(Volatility_30), 4) AS Avg_Volatility,
    ROUND(AVG(Daily_Range), 2) AS Avg_Daily_Range,
    ROUND(MAX(Daily_Return), 2) AS Best_Day,
    ROUND(MIN(Daily_Return), 2) AS Worst_Day,
    COUNT(*) AS Trading_Days
FROM
    nifty50
GROUP BY Year , Quarter
ORDER BY Year , Quarter;

-- Trend analysis: How many days in uptrend vs downtrend?
SELECT 
    Trend,
    COUNT(*) AS Total_Days,
    ROUND(AVG(Daily_Return), 4) AS Avg_Return,
    ROUND(AVG(Volume) / 1000000, 2) AS Avg_Volume_M,
    ROUND(AVG(Volatility_30), 4) AS Avg_Volatility
FROM
    nifty50
GROUP BY Trend;

-- RSI signals: Overbought vs oversold days
SELECT 
    RSI_Signal,
    COUNT(*) AS Total_Days,
    ROUND(AVG(RSI_14), 2) AS Avg_RSI,
    ROUND(AVG(Daily_Return), 4) AS Avg_Return,
    ROUND(AVG(Close), 2) AS Avg_Close
FROM
    nifty50
WHERE
    RSI_Signal IS NOT NULL
GROUP BY RSI_Signal;

--  MACD signals: Bullish vs bearish days
SELECT 
    MACD_Signal_Flag,
    COUNT(*) AS Total_Days,
    ROUND(AVG(Daily_Return), 4) AS Avg_Return,
    ROUND(AVG(Volume) / 1000000, 2) AS Avg_Volume_M,
    ROUND(AVG(Close), 2) AS Avg_Close
FROM
    nifty50
GROUP BY MACD_Signal_Flag;

-- Day of week analysis: Which day is strongest?
SELECT 
    Day_of_Week,
    COUNT(*) AS Total_Days,
    ROUND(AVG(Daily_Return), 4) AS Avg_Return,
    ROUND(AVG(Volume) / 1000000, 2) AS Avg_Volume_M,
    ROUND(MAX(Daily_Return), 2) AS Best_Return,
    ROUND(MIN(Daily_Return), 2) AS Worst_Return
FROM
    nifty50
GROUP BY Day_of_Week
ORDER BY Avg_Return DESC;

--  COVID crash & recovery: 2020 month by month
SELECT 
    Month_Name,
    ROUND(MIN(Close), 2) AS Monthly_Low,
    ROUND(MAX(Close), 2) AS Monthly_High,
    ROUND(AVG(Daily_Return), 4) AS Avg_Return,
    ROUND(AVG(Volatility_30), 4) AS Avg_Volatility,
    COUNT(*) AS Trading_Days
FROM
    nifty50
WHERE
    Year = 2020
GROUP BY Month , Month_Name
ORDER BY Month;

-- Volume vs big moves: High volume days
SELECT 
    Trade_Date,
    ROUND(Close, 2) AS Close,
    ROUND(Daily_Return, 2) AS Daily_Return_Pct,
    Volume,
    Trend,
    RSI_Signal
FROM
    nifty50
WHERE
    Volume > (SELECT 
            AVG(Volume) * 1.5
        FROM
            nifty50)
ORDER BY Volume DESC
LIMIT 15;