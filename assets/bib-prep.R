library(janitor)
library(lubridate)
library(glue)
library(tidyverse)
library(bib2df)
library(distilltools)


# Load bibliography
# Export from Zotero by selecting My Publications -> Export -> Better BibLaTex
# on default settings
bib_path <- read_csv(here::here("_bib/pubs.csv"))
#bib_path2 <- bib2df(here::here("_bib", "references.bib"))

# Format dataframe version of bibliography
pubs <-
  bib_path |>
  select(
    Key,
    `Item Type`,
    `Publication Year`,
    `Publication Title`,
    DOI,
    Title,
    Author,
    `Abstract Note`
  ) |>
  clean_names() |>
  rename(
    item = `item_type`,
    year = `publication_year`,
    abstract = `Abstract Note`
  ) |>
  arrange(desc(year))

write_csv(pubs, here::here("_bib", "pubs.csv"))
