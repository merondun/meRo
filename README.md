# meRo Helpful R functions

Collection of R functions for handling and visualizing -omic data. 

## Contact

For any questions or concerns, please open an issue on this repository or reach out to Justin Merondun: heritabilities@gmail.com
 
## Table of Contents

- [Installation](#installation)
- [R Scripts](#scripts)
  - [Summary Stats](#summary-stats)

## Installation

Installation is quick and simple if you have devtools available: 

```
devtools::install_github('merondun/meRo')
```

Functions have proper help documentation within RStudio: 

```
?sum_stats
```

![R Helper](man/figures/R_Help_Output.png)

## R Scripts

### Summary Stats 

Reports mean, median, SD, SE, IQR, and lower/upper 95% CI. Works seamlessly in tidy pipes by group. Specify NAs are removed with na.rm=TRUE. 

**INPUTS:**

Any data frame in R.

```
library(tidyverse)
library(meRo)

set.seed(123)

# Create a data frame
df = data.frame(
  rowID = 1:100,
  group = sample(c("Group1", "Group2", "Group3"), 100, replace = TRUE),
  value = rnorm(100) # Generate normally distributed random numbers
)

df %>% group_by(group) %>% sum_stats(value)
```

**OUTPUTS:**

```
# A tibble: 3 × 8
  group    mean    sd    se  median   iqr conf_low conf_high
  <chr>   <dbl> <dbl> <dbl>   <dbl> <dbl>    <dbl>     <dbl>
1 Group1 0.0424 1.10  0.192 -0.0487  1.62   -0.349     0.433
2 Group2 0.228  0.881 0.161  0.115   1.21   -0.101     0.557
3 Group3 0.106  1.19  0.196  0.251   1.49   -0.292     0.503
```
