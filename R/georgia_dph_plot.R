#' Make a fixed version of the plot made by Georgia's DPH
#'
#' @param georgia_data The georgia_covid data set from the buad312data library. Expects the dataframe to have columns county, date, cases
#' @return ggplot object with the bar plot
#' @export
make_georgia_dph_plot <- function(georgia_data){
    georgia_covid$fctr_date <- forcats::as_factor(as.character(georgia_covid$date))
    ggplot2::ggplot(georgia_covid, ggplot2::aes(x = fctr_date, y = cases, fill = county)) +
        ggplot2::geom_bar(position = "dodge", stat = "identity") +
        ggplot2::scale_fill_manual(values = c("#5955b0", "#248a93", "#9a843d", "#985932", "#246fac"))
}
