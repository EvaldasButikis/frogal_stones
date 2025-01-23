library ('tidyverse')

data_finals <- read_csv('Data_final.csv')|>
  pivot_longer( 
    cols = c(Rock, Punk, Metal, total),
    names_to = "genre",
    values_to = "number of musicians")

ggplot(data = data_finals) +
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
    #,
  #  labels = c("Garage Rock","Post Hardcore", "Punk")
  )+
  scale_x_continuous(
    limits = c(1940, 2010),
    breaks = seq(1940, 2020, 10)
    )+
  geom_point(size = 2) +
  geom_line(size = 1) +
  scale_color_manual(
    values = c("#C77CFF", "#7CAE00", "#F8766D", "#000000"),
    labels = c("Metal", "Punk", "Rock", "All")
    )

 +    ggsave('n_musicians_rock_punk_metal_total.pdf')
  


