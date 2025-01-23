library (tidyverse)
library(ggplot2)

data_n_rock_grandparent <- read_csv('Data_final.csv')|>
  mutate(rock_grandparent = Rock + Punk + Metal)

ggplot(data = data_n_rock_grandparent) +
  theme_light() +
  aes(x = year,
      y = rock_grandparent
    )+
  labs(
    x = "Year",
    y = "Number of Musicians",
    color = "Genre"
  )+
  
  theme_light(
    base_size = 14,
  ) +
  theme(
    axis.text = element_text(size = 12)
  )+
  scale_color_continuous(
    name = "Genre"
  )+
  scale_x_continuous(
    limits = c(1940, 2010),
    breaks = seq(1940, 2020, 10)
  )+
  geom_point(size = 2)+
  geom_line(size = 1)

#+
#  ggsave('n_musicians_rock_total.pdf')



