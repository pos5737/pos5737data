
# this script moves data from another folder LOCALLY, so
# it won't work on any machine than mine

# load packages
library(tidyverse)

# remove all files from data/
root <- "data/"
files <- list.files(root)
paths <- paste0(root, files)
file.remove(paths)

# add data/ directory
dir.create("data/")

# add parties data
parties_df <- read_rds("~/Dropbox/classes/pos5737/pos5737.github.io/data/parties.rds")
save(parties_df, file = "data/parties_df.rda")

# # add nominate data
# nominate_df <- read_rds("~/Dropbox/classes/pos5737/pos5737.github.io/data/nominate.rds")
# save(nominate_df, file = "data/nominate.rda", compress='xz')
#
# # add gamson data
# gamson_df <- read_rds("~/Dropbox/classes/pos5737/pos5737.github.io/data/gamson.rds")
# save(gamson_df, file = "data/gamson.rda")
#
# # add state-legislators data
# sl_df <- read_rds("~/Dropbox/classes/pos5737/pos5737.github.io/data/state-legislators.rds")
# save(sl_df, file = "data/state-legislators.rda", compress='xz')
