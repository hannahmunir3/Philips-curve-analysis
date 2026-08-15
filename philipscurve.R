library(xts)
library(dplyr)
library(stargazer)
#============#
pcreg <- read.csv("C:/Users/hanna/OneDrive/Desktop/ideas for assignment/PCR.data.csv")
pcreg_xts <- as.xts(pcreg[,-1], order.by = as.Date(pcreg[,1], format = "%d/%m/%Y"))

df <- pcreg
names(df) <- c("date", "unemployment", "cpi")
df$date <- as.Date(df$date, format = "%d/%m/%Y")

df <- df %>%
  arrange(date) %>%
  mutate(
    ln_cpi = log(cpi),
    inflation = 100 * (ln_cpi - lag(ln_cpi, 12))
  )

# Traditional Phillips Curve
# =======================#
df_trad <- df
pcreg_trad <- lm(inflation ~ unemployment, data = df_trad)
summary(pcreg_trad)


# Lagged Phillips Curve
# ========================#
df_lag <- df

df_lag$lag1  <- lag(df_lag$inflation, 1)
df_lag$lag2  <- lag(df_lag$inflation, 2)
df_lag$lag3  <- lag(df_lag$inflation, 3)
df_lag$lag4  <- lag(df_lag$inflation, 4)
df_lag$lag5  <- lag(df_lag$inflation, 5)
df_lag$lag6  <- lag(df_lag$inflation, 6)
df_lag$lag7  <- lag(df_lag$inflation, 7)
df_lag$lag8  <- lag(df_lag$inflation, 8)
df_lag$lag9  <- lag(df_lag$inflation, 9)
df_lag$lag10 <- lag(df_lag$inflation, 10)
df_lag$lag11 <- lag(df_lag$inflation, 11)
df_lag$lag12 <- lag(df_lag$inflation, 12)

df_lag$pc_avg_lag12 <- (
  df_lag$lag1 + df_lag$lag2 + df_lag$lag3 + df_lag$lag4 + df_lag$lag5 + df_lag$lag6 + df_lag$lag7 + df_lag$lag8 + df_lag$lag9 + df_lag$lag10 + df_lag$lag11 + df_lag$lag12) / 12

df_lag <- na.omit(df_lag)

pcreg_lag <- lm(inflation ~ pc_avg_lag12 + unemployment, data = df_lag)
summary(pcreg_lag)


# Stargazer table
# ===================== #
stargazer(pcreg_trad, pcreg_lag,
          type = "html",
          title = "Phillips Curve OLS Regressions",
          dep.var.labels = "Inflation",
          column.labels = c("Traditional Phillips Curve", "Lagged Phillips Curve"),
          order = c("unemployment", "pc_avg_lag12"),
          covariate.labels = c("Unemployment Rate", "Expected Inflation (12-month avg)"),
          digits = 3,
          out = "phillips_curve_OLS_table.html")
browseURL("phillips_curve_OLS_table.html")
