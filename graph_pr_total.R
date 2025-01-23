library ('tidyverse')
library(ggplot2)

data_pr_genres <- read_csv('Data_rock_punk_blues_metal.csv')|>
  pivot_longer( 
    cols = c(blues, rock),
    names_to = "genre",
    values_to = "number of musicians")

ggplot(data = data_pr_genres) +
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
    limits = c(1900, 2010),
    breaks = seq(1900, 2020, 10)
  )+
  scale_y_continuous(
    labels = scales::label_percent()
    )+
  geom_point(size = 2)+
  geom_line(size = 1)+
  scale_color_manual(values = c("#7CAE00","#C77CFF"),
                     labels = c( "Metal","Punk")
                     )

#+
#ggsave('pr_total_rock_metal_punk.pdf')

