library(tidyverse)

acc <- read_delim(file = "~/Downloads/model_acc.csv", delim = ";", locale = locale(decimal_mark = ".", grouping_mark = ",")) %>%
  select(model_id, name_muni, rmse) %>%
  pivot_wider(names_from = model_id, values_from = rmse) %>%
  rowwise() %>%
  mutate(g = max(g1, g2, g3, g4, g5, na.rm = TRUE)) %>%
  select(name_muni, g, global) %>%
  mutate(diff = g - global) %>%
  arrange(diff)

acc %>%
  filter(diff < 0)

0.28/acc %>%
  filter(diff == 0)

acc %>%
  filter(diff > 0)
