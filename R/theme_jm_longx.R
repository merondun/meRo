#' Custom ggplot2 Theme Function
#'
#' This function applies a custom ggplot2 theme with specific aesthetic modifications. It modifies the base black-and-white theme by adjusting the text elements including axis text, plot title, legend text, and legend title, and sets their font family to "Myriad". Additionally, it allows the user to specify the font size for these elements. The function also positions the legend at the top of the plot.
#' 
#' @param font_size Numeric value specifying the font size to be used for text elements in the plot. The default value is 10.
#' 
#' @return A ggplot2 theme object that can be added to ggplot2 plot objects.
#' 
#' @export
#' 
#' @import ggplot2

.onLoad <- function(libname, pkgname) {
  tryCatch({
    requireNamespace("sysfonts", quietly = TRUE)
    font_path <- system.file("fonts", "MYRIADPRO-REGULAR.OTF", package = "meRo")
    if (file.exists(font_path)) {
      sysfonts::font_add("Myriad", font_path)
      showtext::showtext_auto()
    }
  }, error = function(e) {
    message <- paste("Could not load sysfonts and fonts correctly:", e$message)
    packageStartupMessage(message)
  })
}

theme_jm_longx <- function(font_size) {
  ggplot2::theme_bw() +
  ggplot2::theme(
      axis.text.x = ggplot2::element_text(angle = 45, vjust = 1, hjust = 1),
      text = ggplot2::element_text(family = "Myriad", size = font_size),
      title = ggplot2::element_text(family = "Myriad", size = font_size),
      legend.text = ggplot2::element_text(family = "Myriad", size = font_size),
      legend.title = ggplot2::element_text(family = "Myriad", size = font_size)
    )
}
