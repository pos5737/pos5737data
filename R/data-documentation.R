#' Electoral institutions, social heterogeneity, and number of political parties
#'
#' A tidied dataset from
#' \href{http://mattgolder.com/files/research/cps2.pdf}{Clark and Golder
#' (2006)}. See their paper for fuller descriptions of the variables. Their full
#' replication data are available at
#' \href{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/HGXPHP}{on
#' Dataverse}. These data largely derive from Matt Golder and Nils-Christian
#' Bormann's \href{http://mattgolder.com/elections}{DES data} discussed in this
#' paper \href{http://mattgolder.com/files/research/es3.pdf}{this paper}.
#'
#' @format A data frame with 555 rows and 10 variables:
#' \describe{
#'   \item{country}{the name of the country}
#'   \item{year}{the year of the election}
#'   \item{average_magnitude}{the average district magnitude of electoral districts for the lower house}
#'   \item{eneg}{the effective number of ethnic groups}
#'   \item{enep}{the effective number of electoral parties}
#'   \item{upper_tier}{the percentage of seats allocated in upper tiers}
#'   \item{en_pres}{the effective number of presidential candidates}
#'   \item{proximity}{the temporal proximity of presidential and legislative elections}
#'   \item{social_heterogeneity}{qualitative version of eneg}
#'   \item{electoral_system}{qualitative version of average_magnitude; small-magnitude PR systems have an average magnitude between 1 and 7}
#' }
#' @source Replication data from \href{http://mattgolder.com/files/research/cps2.pdf}{Clark and Golder
#' (2006)} available
#' \href{https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/HGXPHP}{on
#' Dataverse}
#' @references Clark, William Roberts, and Matt Golder. 2006. "Rehabilitating
#'   Duverger's Theory: Testing the Mechanical and Strategic Modifying Effects
#'   of Electoral Laws." \emph{Comparative Political Studies} 39(6): 679-708. [\href{http://mattgolder.com/files/research/cps2.pdf}{paper}]
#' @examples
#'   # load data
#'   data(parties_df)
#'
#'   # regression model from their table 2, pooled analysis, whole sample
#'   fit <- lm(enep ~ log(average_magnitude)*eneg + upper_tier*eneg + en_pres*proximity, data = parties_df)
#'   summary(fit)
"parties_df"


