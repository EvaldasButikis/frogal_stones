library(tidyverse)
library(ggplot2)

# dataframe for graphing rock over time, relative to the total musicians 
pr_rock_punk_metal_musicians <- read.csv("Data_final.csv") |>
  mutate(total_punk_metal_parent_musicians = Rock + Punk + Metal) |>
  pivot_longer(
    cols = c(Metal, Punk, Rock),
    names_to = "genre",
    values_to = "number_of_musicians"
  ) |>
  mutate(pr_musicians = (number_of_musicians / total_punk_metal_parent_musicians) * 100 )

# Plots line graph percentage of rock and punk musicians starting over the decades relative to total number of rock-punk musicians
ggplot(data = pr_rock_punk_metal_musicians) +
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
    limits = c(1940, 2015),
    breaks = seq(1940, 2015, 10)
  ) +
  scale_y_continuous(
    labels = scales::label_percent()
  ) +
  geom_point(size = 2) +
  geom_line(size = 1) +
  scale_color_manual(
    values = c("#C77CFF", "#7CAE00", "#F8766D"),
    labels = c("Metal", "Punk", "Rock")
  )

ggsave("pr_rock_total_musicians_line.pdf")