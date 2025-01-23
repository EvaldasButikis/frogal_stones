library(tidyverse)
library(ggplot2)

# dataframe for graphing rock & total musicians per decade
n_decade_rock_total_musicians <- read.csv("Data_final.csv") |>
  pivot_longer(
    cols = c(Rock, total),
    names_to = "genre",
    values_to = "number_of_musicians"
  ) |>
  mutate(decade = floor(year / 10) * 10) |>
  group_by(decade, genre) |>
  summarise(number_of_musicians = sum(number_of_musicians))

# plots line graph of number of rock & total musicians per decade
ggplot(data = n_decade_rock_total_musicians) +
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
  scale_color_manual(
    values = c("#F8766D", "#000000"),
    labels = c("Rock", "All")
  )

ggsave("n_decade_rock_total_musicians_line.pdf")