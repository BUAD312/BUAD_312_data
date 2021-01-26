#' Bike trips using LA Metro's bike share program from 2017-2019
#'
#' A data set containing bike trips recorded by LA Metro's bike share program
#'  between 2017 - 2019
#'
#' @format A data frame with 763839 rows and 26 variables:
#' \describe{
#'   \item{trip_id}{Locally unique integer that identifies the trip}
#'   \item{duration}{Length of trip in minutes}
#'   \item{start_time}{The date/time when the trip began, presented in ISO 8601 format in local time}
#'   \item{end_time}{The date/time when the trip ended, presented in ISO 8601 format in local time}
#'   \item{start_station}{The station ID where the trip originated (for station name and more information on each station see the Station Table)}
#'   \item{start_lat}{The latitude of the station where the trip originated}
#'   \item{start_lon}{The longitude of the station where the trip originated}
#'   \item{end_station}{The station ID where the trip terminated (for station name and more information on each station see the Station Table)}
#'   \item{end_lat}{The latitude of the station where the trip terminated}
#'   \item{end_lon}{The longitude of the station where the trip terminated}
#'   \item{bike_id}{Locally unique integer that identifies the bike}
#'   \item{plan_duration}{The number of days that the plan the passholder is using entitles them to ride; 0 is used for a single ride plan (Walk-up)}
#'   \item{trip_route_category}{"One Way" or "Round Trip"}
#'   \item{passholder_type}{Type of LA Metro pass used for the trip (e.g. "Monthly Pass", "Walk-up", "Annual Pass",
#'    "One Day Pass","Flex Pass", "Testing"). Testing `passholder_type` means that a trip was done by a Metro employee}
#'   \item{bike_type}{Typ of bike used on the trip (e.g. "standard","electric", "smart"). Possibly NA}
#'   \item{year}{Helper date column based on `start_time`}
#'   \item{month}{Helper date column based on `start_time`}
#'   \item{day}{Helper date column based on `start_time`}
#'   \item{hour}{Helper date column based on `start_time`}
#'   \item{minute}{Helper date column based on `start_time`}
#'   \item{usc_ride}{Did the ride start at a station near USC?}
#'   \item{time_of_day}{}
#'   \item{end_time_of_day}{}
#'   \item{start_station_name}{LA Metro bike share station name provided by LA Metro}
#'   \item{start_region}{Region of LA in which the ride started. Grouped defined by LA Metro}
#' }
#' @source \url{https://bikeshare.metro.net/about/data/}
"bike_trip_data"
