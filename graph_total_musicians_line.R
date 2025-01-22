library(tidyverse)
library(ggplot2)

# Reads the cleaned dataframe of all musicians in their start years
all_musicians <- read.csv("muscisian_per_startyear_final.csv")

# Plots number of total musicians starting over start years
ggplot(data = all_musicians) +
  aes(
    x = Key, # Starting years of musicians
    y = Value # Number of musicians
  )+
  labs(
    #title = Number of musicians over the decades, from 1900-2015.
    x = "Decades",
    y = "Number of Musicians",
  ) +
  theme_light(
    base_size = 14,
  ) +
  theme(
    axis.text = element_text(size = 12)
  ) +
  scale_x_continuous(
    limits = c(1900, 2020),
    breaks = seq(1900, 2020, 10)
  ) +
  geom_point() +
  geom_line()

ggsave("n_musicians_per_decades.pdf")