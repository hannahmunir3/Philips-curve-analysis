### Philips curve README

US Inflation and Unemployment Analysis
Tools: R, tidyverse, ggplot2, OLS regression
Data set: US economic data (FRED), 1980-2024

Does unemployment help explain inflation?

## Data

The analysis uses US economic data covering 1980-2024.


The main variables are:

•Inflation: CPI is used.

•Unemployment: Unemployment rate was used as a proxy for unemployment gap (U-U*).

•Lagged in inflation: 𝛑t  is inflation. πt-1… πt-12  displays the lag from the previous year. The average of the previous 12 months is taken to find the yearly average lag.

Data Source:

•	Federal Reserve Bank of St. Louis. (n.d). Consumer Price Index for All Urban Consumers (CPIAUCSL) https://fred.stlouisfed.org/series/CPIAUCSL

•	Federal Reserve Bank of St. Louis. (n.d). Unemployment rate (UNRATE). https://fred.stlouisfed.org/series/UNRATE

## Methods
 
 The analysis follows these steps:
 1. Import and clean economic data
 2. Explore trends in inflation and unemployment over 1980-2024
 3. Visualise the relationship between inflation and unemployment
 4. Estimate a basic Philips Curve regression
 5. Estimate a model including lagged inflation
 6. Compare regression results
 7. Evaluate the limitations of the models
 
## Statistical model
 
•The traditional Philips Curve OLS regression equation:
 𝛑t = α +  γUt  

•An adapted lagged Philips Curve OLS regression equation:
 𝛑t = α + ((β) 1⁄12(πt-1 + πt-2  + πt-3 + πt-4 + πt-5 + πt-6 + πt-7 + πt-8 + πt-9 + πt-10 + πt-11 + πt-12)t)+ γUt

## Key findings
• The traditional Philips curve observes low significance between inflation and unemployment. 

• Including lagged inflation, in order to capture expectations, displayed significant results. This is consistent with the expectations-augments Philips curve.

• Central banks should consider managing inflation expectations, as it provides a high magnitude on inflation compared to market conditions. 


Overall, the analysis suggests a negative relationship between unemployment and inflation was observed.

## Visualisations
<img width="915" height="622" alt="philips curve results" src="https://github.com/user-attachments/assets/a8a51fbf-3fe6-47e2-bf9f-faa81bb03ade" />


## Limitations
• Unemployment rate was used as a proxy for unemployment gap (U-U*). Therefore slack in the market isn't considered through my OLS regression.

• The relationship between inflation and unemployment may change across different economic periods.

•The omission of the regression error, which includes supply shocks.

• Inflation can be affected by many factors that are not included in the models.


## Tools and Skills

Programming: R
Libraries: stargazer, dplyer, xts

Skills demonstrated:

• Data cleaning and transformation

• Data visualisation

• Statistical analysis

• Regression modelling

• Communicating analytical findings


## Author

Hannah Munir

Third year undergraduate student interested in data analytics, statistical analysis and applying data to real world problems.
