## README

Project Overview
This project explores the use of team-level statistics to predict football match outcomes, focusing on data from UEFA Euro 2020. By analyzing variables such as attempts on target, pass accuracy, and ball possession, the study aims to identify which metrics are the most reliable indicators of match results.

The analysis uses linear regression models to assess correlations between these statistics and the number of goals scored. Findings reveal that attempts on target is the strongest predictor of success, while pass accuracy and ball possession have weaker but significant correlations.

Key Findings
Attempts on Target: Strongest predictor of goals (correlation coefficient: 0.71).
Pass Accuracy: Moderate correlation (correlation coefficient: 0.23).
Ball Possession: Moderate correlation (correlation coefficient: 0.27).
Predictive models based on attempts on target showed the highest reliability in forecasting goals.

How to Run the Code
Clone this repository:
git clone <https://github.com/Gla-DDoS/INF6027Project.git>

Navigate to the project directory:
cd INF6027Project

Install dependencies (ensure R and required packages like tidyverse and MASS are installed).
Run the R script (In Rstudio):
source("INF6027.R")
