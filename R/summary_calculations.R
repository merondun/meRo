#' Summary Statistics
#' 
#' This function calculates the mean, standard deviation, standard error, median, IQR, and confidence intervals for a given column.
#' @param df Tibble or data frame with a numeric column to summarize.
#' @param value Numeric column to summarize. NA values will be removed with na.rm=TRUE.
#' @return Processed dataframe of summary statistics.
#' @importFrom dplyr %>% summarise
#' @importFrom magrittr %>%
#' @importFrom utils read.table
#' @importFrom rlang enquo
#' @importFrom stats IQR median qt sd
#' @export

sum_stats <- function(df, value){
  value <- enquo(value)
  df %>% summarise(
    mean = mean(!!value, na.rm = TRUE),
    sd = sd(!!value, na.rm = TRUE),
    se = sd / sqrt(dplyr::n()),
    median = median(!!value, na.rm = TRUE),
    iqr = IQR(!!value, na.rm = TRUE),
    conf_low = mean - qt(0.975, df=dplyr::n()-1)*se,
    conf_high = mean + qt(0.975, df=dplyr::n()-1)*se
  )
}

