library(tidyverse)

df <- read_csv("savant_data.csv")

colnames(df)

df <- df %>%
  mutate(whiff_rate = whiffs / swings)

p3 <- ggplot(df, aes(x = plate_x, y = plate_z)) +
  stat_density_2d_filled() +
  coord_equal() +
  labs(
    title = "MLB Pitch Location Density",
    x = "Horizontal Pitch Location",
    y = "Vertical Pitch Location"
  ) +
  theme_minimal()

ggsave("Location_density.png", plot = p3, width = 8, height = 6)


p4 <- ggplot(df, aes(x = plate_x, y = plate_z, color = whiff_rate)) +
  geom_point(alpha = 0.5) +
  scale_color_viridis_c() +
  coord_equal() +
  labs(
    title = "Pitch Locations Colored by Whiff Rate",
    x = "Plate X",
    y = "Plate Z",
    color = "Whiff Rate"
  ) +
  theme_minimal()

ggsave("Location_Whiff_Rate.png", plot = p4, width = 8, height = 6)

p5 <- ggplot(df, aes(x = plate_x, y = plate_z, color = whiff_rate)) +
  geom_point(alpha = 0.5) +
  scale_color_viridis_c() +
  geom_rect(
    xmin = -0.83, xmax = 0.83,
    ymin = 1.5, ymax = 3.5,
    color = "black",
    fill = NA
  ) +
  coord_equal() +
  labs(
    title = "Pitch Locations and Whiff Rate",
    x = "Plate X",
    y = "Plate Z"
  ) +
  theme_minimal()


ggsave("Locations_and_Whiff.png", plot = p5, width = 8, height = 6)
