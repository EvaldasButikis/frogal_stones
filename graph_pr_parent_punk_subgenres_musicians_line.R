library(tidyverse)
library(ggplot2)

# dataframe for graphing rock over time, relative to the total rock & blues musicians 
pr_parent_punk_subgenres_musicians <- read.csv("Punk_subgenres.csv") |>
  mutate(total_rock_parent_musicians = garage.rock + punk + post_hardcore) |>
  pivot_longer(
    cols = c(garage.rock, punk, post_hardcore),
    names_to = "genre",
    values_to = "number_of_musicians"
  ) |>
  mutate(pr_musicians = (number_of_musicians / total_rock_parent_musicians) * 100 )

# Plots line graph percentage of rock & blues musicians start years relative to total number of blues-rock musicians
ggplot(data = pr_parent_punk_subgenres_musicians) +
  aes(
    x = year,
    y = pr_musicians / 100,
    group = genre,
    color = genre 
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
    limits = c(1950, 2015),
    breaks = seq(1950, 2015, 10)
  ) +
  scale_y_continuous(
    labels = scales::label_percent()
  ) +
  geom_point(size = 2) +
  geom_line(size = 1) +
  scale_color_discrete(
    labels = c("Garage Rock", "Post-Hardcore", "Punk"),
    name = "Genre"
  )

ggsave("pr_parent_punk_subgenres_musicians_line.pdf")