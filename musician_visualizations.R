library(tidyverse)
library(ggplot2)

# Reads the cleaned dataframe of all musicians in their start years
all_musicians <- read.csv("muscisian_per_startyear_final.csv")

rock_punk_musicians <- read.csv("rock_punk_genres_peryear.csv") |>
  pivot_longer(
    cols = c(rock, punk),
    names_to = "genre",
    values_to = "number of musicians"
  )

# Plots number of total musicians starting over the decades
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

ggsave("n_musicians_per_decades.pdf", last_plot())

# Plots number of rock and punk musicians starting over the decades
ggplot(data = rock_punk_musicians) +
  aes(
    x = year, # Starting years of punk and rock musicians
    y = `number of musicians`, # Number of musicians
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

ggsave("n_punk_rock_musicians_per_decades.pdf", last_plot())
