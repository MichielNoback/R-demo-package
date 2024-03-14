#' Plot bacterial growth data
#'
#' Plots bacterial growth curves with duplos and multiple conditions.
#'
#' @param growth_data A tibble of data frame in long format, similar to the growth_data demo table of this package.
#' @param add_smoother A logical indicating whether to add a smoother to the plot.
#' @returns Nothing
#' @examples
#' plot_growth_curves(growth_data)
#' plot_growth_curves(growth_data, add_smoother = TRUE)
#' @details
#' Additional details...
#'
#' @export
plot_growth_curves <- function(growth_data, add_smoother=FALSE) {
    plt <- ggplot2::ggplot(data = growth_data,
                           mapping = ggplot2::aes(x = minutes,
                                                  y = OD600,
                                                  linetype = duplo,
                                                  shape = duplo,
                                                  color = condition)) +
           ggplot2::geom_point() +
           ggplot2::theme_minimal()
    if (add_smoother) {
        plt <- plt + ggplot2::geom_smooth(se = F, formula = 'y ~ x', method = "loess")
    }
    print(plt)
}


