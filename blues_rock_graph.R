library ('tidyverse')

data_bluesrock <- read_csv('blues_rock_graph.csv')|>
  pivot_longer( 
    cols = c(rock, blues),
    names_to = "genre",
    values_to = "number of musicians")

ggplot(data = data_bluesrock) +
  theme_light() +
  aes(x = year,
      y = `number of musicians`, 
      group = `genre`,
      color = `genre`)+
  labs(
    x = "Decades",
    y = "Number of Musicians",
    color = "Genre"
  )+
  scale_x_continuous(
    limits = c(1900, 2010),
    breaks = seq(1900, 2010, 10)
  )+
  geom_point(size = 2)+
  geom_line(size = 1)

