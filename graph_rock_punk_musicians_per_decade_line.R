library(tidyverse)
library(ggplot2)

# dataframe for graphing rock & punk musicians over decades
decade_rock_punk_musicians <- read.csv("rock_punk_genres_peryear.csv") |>
  pivot_longer(
    cols = c(rock, punk),
    names_to = "genre",
    values_to = "number_of_musicians"
  ) |>
  mutate(decade = floor(year / 10) * 10) |>
  group_by(decade, genre) |>
  summarise(number_of_musicians = sum(number_of_musicians))

# plots line graph of number of rock-punk musicians per decade
ggplot(data = decade_rock_punk_musicians) +
  aes(
    x = decade, # Starting years of punk and rock musicians
    y = number_of_musicians, # Number of musicians
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
  scale_color_discrete(
    name = "Genre",
    labels = c("Punk", "Rock")
  ) +
  scale_x_continuous(
    limits = c(1940, 2020),
    breaks = seq(1940, 2020, 10)
  ) +
  geom_point(size = 2) +
  geom_line(size = 1)

ggsave("n_rock_punk_musicians_per_decades.pdf")