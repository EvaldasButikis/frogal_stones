library(tidyverse)
library(ggplot2)

# dataframe for graphing rock & punk musicians per decades
n_decade_rock_metal_musicians <- read.csv("Data_rock_punk_blues_metal.csv") |>
  pivot_longer(
    cols = c(rock, metal),
    names_to = "genre",
    values_to = "number_of_musicians"
  ) |>
  mutate(decade = floor(year / 10) * 10) |>
  group_by(decade, genre) |>
  summarise(number_of_musicians = sum(number_of_musicians))

# Plots number of rock and punk musicians starting per decades
ggplot(data = n_decade_rock_metal_musicians) +
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
    limits = c(1920, 2010),
    breaks = seq(1920, 2010, 10)
  ) +
  geom_point(size = 2) +
  geom_line(size = 1)+
  scale_color_manual(
    values = c("#C77CFF", "#F8766D" ),
    labels = c("Metal", "Rock" )
  )

ggsave("n_decade_rock_metal_musicians_line.pdf")