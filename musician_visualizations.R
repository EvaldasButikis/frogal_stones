library(tidyverse)
library(ggplot2)

# Reads the cleaned dataframe of all musicians in their start years
all_musicians <- read.csv("muscisian_per_startyear_final.csv")

# dataframe for graphing rock & punk musicians over time
rock_punk_musicians <- read.csv("rock_punk_genres_peryear.csv") |>
  pivot_longer(
    cols = c(rock, punk),
    names_to = "genre",
    values_to = "number_of_musicians"
  )

# dataframe for graphing rock & punk musicians over time, relative to the total of rock & punk musicians
relative_rock_punk_musicians <- read.csv("rock_punk_genres_peryear.csv") |>
  mutate(total_rock_punk = rock + punk) |>
  pivot_longer(
    cols = c(rock, punk),
    names_to = "genre",
    values_to = "number_of_musicians"
  ) |>
  mutate(relative_musicians = (number_of_musicians / total_rock_punk) * 100 )

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

ggsave("n_punk_rock_musicians_per_decades.pdf", last_plot())

# Plots column percentage of rock and punk musicians starting over the decades relative to total number of rock-punk musicians
ggplot(data = relative_rock_punk_musicians) +
  aes(
    x = year, # Starting years of punk and rock musicians
    y = relative_musicians / 100, # Number of musicians
    group = `genre`,
    fill = `genre`
  )+
  labs(
    #title = Number of musicians over the decades, from 1900-2015.
    x = "Decades",
    y = "Proportion of Musicians",
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
  scale_y_continuous(
    labels = scales::label_percent()
  ) +
  geom_col(
    width = 1
  )

# Plots line graph percentage of rock and punk musicians starting over the decades relative to total number of rock-punk musicians
ggplot(data = relative_rock_punk_musicians) +
  aes(
    x = year, # Starting years of punk and rock musicians
    y = relative_musicians / 100, # Number of musicians
    group = `genre`,
    color = `genre`
  )+
  labs(
    #title = Number of musicians over the decades, from 1900-2015.
    x = "Decades",
    y = "Proportion of Musicians",
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
  scale_y_continuous(
    labels = scales::label_percent()
  ) +
  geom_point(size = 2) +
  geom_line(size = 1)