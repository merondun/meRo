#' Summary Statistics
#' 
#' This function calculates the mean, standard deviation, standard error, median, IQR, and confidence intervals for a given column.
#' @export

sum_stats <- function(df, value){
  value <- enquo(value)
  df %>% summarise(
    mean = mean(!!value, na.rm = TRUE),
    sd = sd(!!value, na.rm = TRUE),
    se = sd / sqrt(n()),
    median = median(!!value, na.rm = TRUE),
    iqr = IQR(!!value, na.rm = TRUE),
    conf_low = mean - qt(0.975, df=n()-1)*se,
    conf_high = mean + qt(0.975, df=n()-1)*se
  )
}

