library ('tidyverse')

data_n_genres <- read_csv('Data_rock_punk_blues_metal.csv')|>
  pivot_longer( 
    cols = c(rock, total),
    names_to = "genre",
    values_to = "number of musicians")
print(data_n_genres)

ggplot(data = data_n_genres) +
  theme_light() +
  aes(x = year,
      y = `number of musicians`, 
      group = `genre`,
      color = `genre`)+
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
  scale_color_discrete(
    name = "Genre"
  )+
  scale_x_continuous(
    limits = c(1940, 2010),
    breaks = seq(1940, 2020, 10)
    )+
    geom_point(size = 2)+
    geom_line(size = 1)+
    scale_color_manual(values = c("#F8766D", "#000000")
              ,
                   labels = c( "Rock", "All genres")
      )

#+
#  ggsave('n_musicians_rock_total.pdf')
  


