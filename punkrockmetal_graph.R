library ('tidyverse')

data_several <- read_csv('startyear_rock_punk_metal.csv')|>
  pivot_longer( 
    cols = c(rock, punk, metal),
    names_to = "genre",
    values_to = "number of musicians")

ggplot(data = data_several) +
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
    limits = c(1940, 2010),
    breaks = seq(1940, 2020, 10)
    )+
    geom_point(size = 2)+
    geom_line(size = 1)
  

