library ('tidyverse')

data_rockmetal <- read_csv('startyear_rock_punk_metal.csv')|>
  pivot_longer( 
    cols = c(rock, punk, metal),
    names_to = "genre",
    values_to = "number of musicians")

ggplot(data = data_rockmetal) +
  theme_light() +
  aes(x = year,
      y = `number of musicians`, 
      group = `genre`,
      color = `genre`)+
  scale_x_continuous(
    limits = c(1940, 2010),
    breaks = seq(1940, 2020, 10)
    )+
    geom_point(size = 2)+
    geom_line(size = 1)
    


print(data_rockmetal)  
  

