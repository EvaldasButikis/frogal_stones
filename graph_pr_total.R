library ('tidyverse')
library(ggplot2)

data_prpunk <- read_csv('Punk_subgenres.csv')|>
  pivot_longer( 
    cols = c(`garage rock`, `post_hardcore`, `punk`),
    names_to = "genre",
    values_to = "number of musicians")

ggplot(data = data_prpunk) +
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
    name = "Genre",
  labels = c("Garage Rock","Post Hardcore", "Punk")
)+
  scale_x_continuous(
    limits = c(1950, 2010),
    breaks = seq(1950, 2010, 10)
  )+
  scale_y_continuous(
    labels = scales::label_percent()
    )+
  geom_point(size = 2)+
  geom_line(size = 1)
#+ scale_color_manual(values = c("#00BFC4", "#F8766D"),
#                     labels = c("Blues", "Rock")
            #         )
+    ggsave('pr_total_punk_sub.pdf')

