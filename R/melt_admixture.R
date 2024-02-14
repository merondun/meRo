#' Melt Admixture
#'
#' This function reads specified files and processes them.
#'
#' @param prefix Prefix for the filenames.
#' @param qdir Directory location for the Q files.
#' @return Processed dataframe.
#' @export
#'
melt_admixture <- function(prefix, qdir) {
    #... rest of your function code
}

melt_admixture <- function(prefix, qdir) {
  
  samps <- read.table(paste0(qdir,'/',prefix, '.fam'), header=FALSE) %>% 
    dplyr::select(V2) %>%
    dplyr::rename(ID=V2)
  
  all_files <- list.files(qdir, pattern = "\\.Q$",full.names=TRUE)
  desired_files = grep(paste0('.*/',prefix, "(\\.\\d+)?\\.Q$"), all_files, value = TRUE)
  
  qdat <- NULL
  for (q in desired_files){
    cat('Melting K: ', q, '\n')
    qf <- read.table(q)
    k <- ncol(qf)
    names(qf) <- paste0('K', seq(1, k))
    qfm <- cbind(samps, qf)
    qfm$Specified_K <- k   
    meltq <- qfm %>% tidyr::pivot_longer(!c(ID, Specified_K), names_to = 'K', values_to = 'Q')  
    qdat <- rbind(qdat, meltq)
  }
  
  return(qdat)
}
