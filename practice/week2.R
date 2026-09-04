library(tidyverse)
library(tidycensus)

pa_income <- get_acs(
  geography = 'county',
  variables = 'B19013_001',
  state = 'PA',
  year = 2023,
  survey = 'acs5'
)

dim(pa_income)
glimpse(pa_income)
head(pa_income)

pa_income$GEOID

income_filtered <- pa_income |>
  filter(estimate < 50000)

moe_filtered <- pa_income |>
  filter(moe>3000)


select(pa_income, NAME, estimate, moe)
select(pa_income, GEOID, estimate)

pct_table <- mutate(pa_income, moe_pct = moe / estimate * 100)
