library(tidyverse)

df <- read_csv("savant_data.csv")

head(df)

pitcher_stats <- df %>%
  select(
    player_name,
    total_pitches,
    velocity,
    spin_rate,
    k_percent,
    whiffs,
    swings,
    hardhit_percent,
    barrels_per_bbe_percent
  )

pitcher_stats <- pitcher_stats %>%
  filter(total_pitches > 500)

ggplot(pitcher_stats, aes(x = velocity, y = k_percent)) +
  geom_point(color = "blue") +
  labs(
    title = "Pitch Velocity vs Strikeout Rate (2024 MLB)",
    x = "Average Pitch Velocity (mph)",
    y = "Strikeout Percentage"
  ) +
  theme_minimal()

ggplot(pitcher_stats, aes(x = spin_rate, y = k_percent)) +
  geom_point(color = "red") +
  labs(
    title = "Spin Rate vs Strikeout Rate (2024 MLB)",
    x = "Average Spin Rate (rpm)",
    y = "Strikeout Percentage"
  ) +
  theme_minimal()

pitcher_stats %>%
  select(velocity, spin_rate, k_percent, hardhit_percent, barrels_per_bbe_percent) %>%
  cor(use = "complete.obs")

model <- lm(k_percent ~ velocity + spin_rate + hardhit_percent, data = pitcher_stats)

summary(model)

ggplot(pitcher_stats, aes(x = velocity, y = k_percent)) +
  geom_point() +
  geom_smooth(method = "lm", color = "black") +
  theme_minimal()