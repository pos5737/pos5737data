#' ANES Feeling Thermometers, 1978-2016
#'
#' A tidied dataset from
#' \href{https://electionstudies.org/data-center/anes-time-series-cumulative-data-file/}{ANES}. This
#' dataset include variables for year, education, and feeling thermometers for the Republican and Democratic parties.
#'
#' @format A data frame with 38,100 rows and 4 variables:
#' \describe{
#'   \item{year}{the year of the survey}
#'   \item{education}{the respondent's level of education}
#'   \item{ft_democratic_party}{the respondent's feelings toward the Democratic party}
#'   \item{ft_republican_party}{the respondent's feelings toward the Democratic party}
#' }
#' @examples
#' # load data
#' data(therms)
#'
#' plot(therms$ft_democratic_party, therms$ft_republican_party)
"therms"


