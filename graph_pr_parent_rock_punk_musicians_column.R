library(tidyverse)
library(ggplot2)

# dataframe for graphing rock & punk musicians over time, relative to the total of rock & punk musicians
relative_rock_punk_musicians <- read.csv("Data_final.csv") |>
  mutate(total_rock_punk = Rock + Punk) |>
  pivot_longer(
    cols = c(Rock, Punk),
    names_to = "genre",
    values_to = "number_of_musicians"
  ) |>
  mutate(relative_musicians = (number_of_musicians / total_rock_punk) * 100 )

# Plots column percentage of rock and punk musicians starting over the decades relative to total number of rock & punk musicians
ggplot(data = relative_rock_punk_musicians) +
  aes(
    x = year,
    y = relative_musicians / 100,
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
  scale_x_continuous(
    limits = c(1945, 2015),
    breaks = seq(1940, 2015, 10)
  ) +
  scale_y_continuous(
    labels = scales::label_percent()
  ) +
  geom_col(
    width = 1
  )+
  scale_fill_manual(
    values = c("#7CAE00", "#F8766D" ),
    labels = c("Punk", "Rock" ),
    name = "Genre"
  )

ggsave("pr_parent_rock_punk_musicians_column.pdf")