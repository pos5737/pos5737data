
# a function to create new, clean directories
# https://stackoverflow.com/questions/38375305/how-to-overwrite-a-folder-on-the-computer-using-functions-in-r
md <- function(fp) {
  if(!file.exists(fp)) {  # If the folder does not exist, create a new one
    md(dirname(fp))
    dir.create(fp)
  } else {   # If it existed, delete and replace with a new one
    unlink(fp, recursive = TRUE)
    dir.create(fp)
  }
}

# clean the directories containing the data
md("data/")
md("raw-data/")
md("formatted-data/")
if (file.exists("formatted-data.zip")) file.remove("formatted-data.zip")


# get all raw data
files <- list.files("make-data/get-raw/", full.names = TRUE)
files %>%
  map(~ source(.))

# clean all raw data
files <- list.files("make-data/clean-raw/", full.names = TRUE)
files %>%
  map(~ source(.))

# export to formats
source("make-data/format-data.R")
