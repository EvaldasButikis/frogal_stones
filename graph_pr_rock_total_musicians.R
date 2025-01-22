library(tidyverse)
library(ggplot2)

# dataframe for graphing rock over time, relative to the total musicians 
pr_rock_total_musicians <- read.csv("Data_rock_punk_blues_metal.csv") |>
  mutate(pr_rock_parent_musicians = (rock / total) * 100 )

# Plots line graph percentage of rock and punk musicians starting over the decades relative to total number of rock-punk musicians
ggplot(data = pr_rock_total_musicians) +
  aes(
    x = year,
    y = pr_rock_parent_musicians / 100
  )+
  labs(
    #title = Number of musicians over the decades, from 1900-2015.
    x = "Decades",
    y = "Proportion of Rock Musicians"
  ) +
  theme_light(
    base_size = 14,
  ) +
  theme(
    axis.text = element_text(size = 12)
  ) +
  scale_x_continuous(
    limits = c(1940, 2015),
    breaks = seq(1940, 2015, 10)
  ) +
  scale_y_continuous(
    labels = scales::label_percent()
  ) +
  geom_point(size = 2, color = "#F8766D") +
  geom_line(size = 1, color = "#F8766D")

ggsave("pr_rock_total_musicians_line.pdf")