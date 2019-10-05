
# load packages
library(tidyverse)

# load raw data
parties_df_raw <- haven::read_dta("raw-data/parties/Legislative_new.tab") %>%
  glimpse()

# initial filtering follwing clark and golder ----
# clark and golder do extensive filtering in their analysis,
# so i reproduce that here. the decisions below follow their Stata .do file
# available at https://dataverse.harvard.edu/file.xhtml?persistentId=doi:10.7910/DVN/HGXPHP/5HNOG3&version=1.0
parties_df_raw0 <- parties_df_raw %>%
  # drop elections with no recognizable parties
  filter(countrynumber != 163,
         countrynumber != 165,
         countrynumber != 197,
         countrynumber != 189,
         countrynumber != 146,
         countrynumber != 198,
         countrynumber != 167,
         !(countrynumber == 70 & year == 1958),
         !(countrynumber == 70 & year == 1960),
         !(countrynumber == 70 & year == 1962),
         !(countrynumber == 70 & year == 1964),
         !(countrynumber == 70 & year == 1966),
         !(countrynumber == 70 & year == 1968),
         !(countrynumber == 70 & year == 1970),
         !(countrynumber == 12 & year == 1963)) %>%
  # drop fused votes
  filter(countrynumber != 67,
         countrynumber != 76,
         !(countrynumber == 59 & year == 1957),
         !(countrynumber == 59 & year == 1971),
         !(countrynumber == 59 & year == 1985),
         !(countrynumber == 59 & year == 1989),
         !(countrynumber == 59 & year == 1993),
         !(countrynumber == 57 & year == 1990),
         !(countrynumber == 54 & year == 1966),
         !(countrynumber == 54 & year == 1970),
         !(countrynumber == 54 & year == 1974),
         !(countrynumber == 54 & year == 1986)) %>%
  # drop countries with large "others"
  filter(!(enep_others > 15 & enep_others < 100)) %>%
  # drop countries with majoritarian uppers
  filter(countrynumber != 132,
         countrynumber != 29,
         !(countrynumber == 87 & year == 1988),
         !(countrynumber == 87 & year == 1992),
         !(countrynumber == 87 & year == 1996),
         !(countrynumber == 116 & year == 1987),
         !(countrynumber == 116 & year == 1996)) %>%
  glimpse()

# tidy the data ----
parties <- parties_df_raw0 %>%
  # keep only variables of interest
  select(country, year, average_magnitude = avemag, eneg, enep = enep1,
         upper_tier = uppertier, en_pres = enpres, proximity = proximity1) %>%
  mutate(social_heterogeneity = cut_number(eneg, 3, labels = c("Bottom 3rd of ENEG",
                                                               "Middle 3rd of ENEG",
                                                               "Top 3rd of ENEG"))) %>%
  # create factor variable with electoral system
  mutate(electoral_system = cut(x = average_magnitude,
                                breaks = c(-Inf, 1, 7, Inf),
                                labels = c(c("Single-Member District",
                                             "Small-Magnitude PR",
                                             "Large-Magnitude PR"))))

# save to file
save(parties, file = "data/parties.rda")

