




#' Scatter polt of two variables x1 and y1
#'
#' @param data Dataset to plot
#' @param x1 is the variable on x axis
#' @param y1 is the variable on y axis
#'
#' @return ggplot2 object
#' @import ggplot2
#' @export

viz_sctter <- function(data, x1, y1) {
  ggplot2::ggplot(
    data = data,
    mapping = aes(x = {{ x1 }}, y = {{ y1 }})
  ) +
    geom_point()
}
