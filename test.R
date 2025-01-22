library ('tidyverse')

data_test <- read_csv('test.csv')|>
  pivot_longer( 
    cols = c(rock, punk),
    names_to = "genre",
    values_to = "number of musicians")

ggplot(data = data_test) +
  theme_light() +
  aes(x = year,
      y = `number of musicians`/ total, 
      group = `genre`,
      color = `genre`)+
  labs(
    x = "Year",
    y = "Proportion of Musicians",
    color = "Genre"
  )+
  scale_x_continuous(
    limits = c(1940, 2010),
    breaks = seq(1940, 2020, 10)
  )+
  geom_point(size = 2)+
  geom_line(size = 1)

