#' State of Georgia COVID new cases and deaths
#'
#' A dataset containing counts of new cases and deaths from the top 5 counties in Georgia from 2020-04-26 to 2020-05-09
#'
#' @format A data frame with 245 rows and 5 variables:
#' \describe{
#'   \item{county}{The top 5 county names}
#'   \item{date}{Date from time period between 2020-04-26 to 2020-05-09 to match the plot in the
#'   Vox article \url{https://www.vox.com/covid-19-coronavirus-us-response-trump/2020/5/18/21262265/georgia-covid-19-cases-declining-reopening}}
#'   \item{cases}{The number of new cases for a particular day. Used to match the plot in the
#'   Vox article \url{https://www.vox.com/covid-19-coronavirus-us-response-trump/2020/5/18/21262265/georgia-covid-19-cases-declining-reopening} }
#' }
#' @source \url{https://covid-hub.gio.georgia.gov/datasets/georgia-covid-19-case-data}
"georgia_covid"
