# ============================================================
# 🌦️ WEATHER DATA VISUALIZATION PROJECT (Customized Version)
# ============================================================

# 1️⃣ Install and load packages
install.packages(c("tidyverse", "lubridate", "ggplot2", "plotly"), dependencies = TRUE)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(plotly)

# 2️⃣ Load your dataset
weather <- read_csv("weather.csv")

# 3️⃣ Data inspection
cat("✅ Dataset loaded successfully\n\n")
print(colnames(weather))
str(weather)
head(weather)

# 4️⃣ Clean and prepare data
weather <- na.omit(weather)

# Convert date
weather$`Formatted Date` <- as.POSIXct(weather$`Formatted Date`, format="%Y-%m-%d %H:%M:%S", tz="UTC")
weather$Month <- month(weather$`Formatted Date`, label = TRUE)
weather$Year <- year(weather$`Formatted Date`)

# 5️⃣ Plot 1 - Temperature Trend Over Time
p1 <- ggplot(weather, aes(x = `Formatted Date`, y = `Temperature (C)`)) +
  geom_line(color = "steelblue") +
  labs(title = "Temperature Trend Over Time",
       x = "Date", y = "Temperature (°C)") +
  theme_minimal()
print(p1)
ggsave("temperature_trend.png", plot = p1, width = 8, height = 5)

# 6️⃣ Plot 2 - Monthly Temperature Variation
p2 <- ggplot(weather, aes(x = Month, y = `Temperature (C)`, fill = Month)) +
  geom_boxplot() +
  labs(title = "Monthly Temperature Variation",
       x = "Month", y = "Temperature (°C)") +
  theme_minimal()
print(p2)
ggsave("monthly_temperature.png", plot = p2, width = 8, height = 5)

# 7️⃣ Plot 3 - Humidity vs Temperature
p3 <- ggplot(weather, aes(x = `Temperature (C)`, y = Humidity)) +
  geom_point(alpha = 0.5, color = "darkorange") +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Humidity vs Temperature",
       x = "Temperature (°C)", y = "Humidity (%)") +
  theme_minimal()
print(p3)
ggsave("humidity_vs_temperature.png", plot = p3, width = 8, height = 5)

# 8️⃣ Interactive Plotly Visualization
fig <- plot_ly(weather,
               x = ~`Formatted Date`,
               y = ~`Temperature (C)`,
               type = 'scatter',
               mode = 'lines',
               line = list(color = 'royalblue')) %>%
  layout(title = "Interactive Temperature Trend",
         xaxis = list(title = "Date"),
         yaxis = list(title = "Temperature (°C)"))
fig  # Shows in Viewer tab

# 9️⃣ Monthly Summary
monthly_summary <- weather %>%
  group_by(Month) %>%
  summarise(
    Avg_Temp = mean(`Temperature (C)`, na.rm = TRUE),
    Avg_Humidity = mean(Humidity, na.rm = TRUE),
    Avg_Pressure = mean(`Pressure (millibars)`, na.rm = TRUE),
    Avg_WindSpeed = mean(`Wind Speed (Km/h)`, na.rm = TRUE)
  )

print(monthly_summary)
write_csv(monthly_summary, "monthly_summary_output.csv")

cat("\n✅ Project completed! Plots saved and summary generated successfully.\n")
