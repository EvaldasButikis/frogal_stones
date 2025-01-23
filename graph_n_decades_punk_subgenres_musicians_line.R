library(tidyverse)
library(ggplot2)

# dataframe for graphing blues & rock musicians per decades
n_decade_punk_subgenres_musicians <- read.csv("Punk_subgenres.csv") |>
  pivot_longer(
    cols = c(garage.rock, punk, post_hardcore),
    names_to = "genre",
    values_to = "number_of_musicians"
  ) |>
  mutate(decade = floor(year / 10) * 10) |>
  group_by(decade, genre) |>
  summarise(number_of_musicians = sum(number_of_musicians))

# Plots number of blues & rock musicians starting per decades
ggplot(data = n_decade_punk_subgenres_musicians) +
  aes(
    x = decade,
    y = number_of_musicians,
    group = `genre`,
    color = `genre`
  )+
  labs(
    #title = Number of musicians over the decades, from 1900-2015.
    x = "Decades",
    y = "Number of Musicians",
    color = "Genre"
  ) +
  theme_light(
    base_size = 14,
  ) +
  theme(
    axis.text = element_text(size = 12)
  ) +
  scale_x_continuous(
    limits = c(1940, 2010),
    breaks = seq(1940, 2010, 10)
  ) +
  geom_point(size = 2) +
  geom_line(size = 1) +
  scale_color_discrete(
    labels = c("Garage Rock", "Post-Hardcore", "Punk")
  )

ggsave("n_decade_punk_subgenres_musicians_line.pdf")