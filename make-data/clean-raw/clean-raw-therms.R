
# load packages
library(tidyverse)
library(haven)



# load raw data
raw_df <- read_sav("raw-data-loc/anes_timeseries_cdf.sav") %>%
  glimpse()

# tidy data
therms <- raw_df %>%
  select(year = VCF0004,
         ft_democratic_party = VCF0218,
         ft_republican_party = VCF0224,
         education = VCF0140) %>%
  filter(year >= 1978) %>% # question not asked before 1978
  mutate(education = as_factor(education),
         education = fct_recode(education,
                                "8th Grade or Less" = "1. 8 grades or less ('grade school')",
                                "Some High School" = "2. 9-12 grades ('high school'), no diploma/equivalency",
                                "High School" = "3. 12 grades, diploma or equivalency",
                                "High School and Non-Academic Training" = "4. 12 grades, diploma or equivalency plus non-academic",
                                "Some College" = "5. Some college, no degree; junior/community college",
                                "College Degree" = "6. BA level degrees; advanced degrees incl. LLB"),
         education = na_if(education, "8. DK"),
         education = na_if(education, "9. NA; RF; no Pre IW; short-form 'new' Cross Section"),
         education = fct_drop(education)) %>%
  mutate_at(vars(starts_with("ft_")), ~ as.numeric(.)) %>%
  mutate_at(vars(starts_with("ft_")), ~ ifelse(. > 97, NA, .)) %>%
  glimpse()

# save tidy data
save(therms, file = "data/therms.rda")
