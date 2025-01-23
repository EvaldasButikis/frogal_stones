library(tidyverse)
library(ggplot2)

# dataframe for graphing rock over time, relative to the total musicians 
pr_rock_metal_musicians <- read.csv("Data_rock_punk_blues_metal.csv") |>
  mutate(total_metal_parent_musicians = rock + metal) |>
  pivot_longer(
    cols = c(metal, rock),
    names_to = "genre",
    values_to = "number_of_musicians"
  ) |>
  mutate(pr_musicians = (number_of_musicians / total_metal_parent_musicians) * 100 )

# Plots line graph percentage of rock and punk musicians starting over the decades relative to total number of rock-punk musicians
ggplot(data = pr_rock_metal_musicians) +
  aes(
    x = year,
    y = pr_musicians / 100,
    group = genre,
    fill = genre 
  )+
  labs(
    #title = Number of musicians over the decades, from 1900-2015.
    x = "Years",
    y = "Proportion of Musicians"
  ) +
  theme_light(
    base_size = 14,
  ) +
  theme(
    axis.text = element_text(size = 12)
  ) +
  scale_x_continuous(
    limits = c(1945, 2015),
    breaks = seq(1940, 2015, 10)
  ) +
  scale_y_continuous(
    labels = scales::label_percent()
  ) +
  geom_col(width = 1) +
  scale_fill_manual(
    values = c("#C77CFF", "#F8766D"),
    labels = c("Metal", "Rock"),
    name = "Genre"
  )

ggsave("pr_parent_rock_metal_musicians_column.pdf")