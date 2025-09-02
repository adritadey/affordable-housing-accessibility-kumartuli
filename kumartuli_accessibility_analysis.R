# Affordable Housing Accessibility in Kumartuli, Kolkata
# Author: [Your Name]
# Description: Simulated analysis of housing accessibility using R

# Load required library
library(ggplot2)

# Create simulated dataset
housing_data <- data.frame(
  block = c("Kumartuli North", "Kumartuli South", "Pottery Lane", "Riverfront Block", "Workshop Alley"),
  housing_units = c(85, 60, 110, 45, 70),
  avg_income = c(18000, 15000, 17000, 14000, 16000),
  distance_to_hospital = c(2.1, 3.0, 1.5, 3.8, 2.5),
  distance_to_school = c(1.2, 2.5, 1.0, 3.2, 2.0),
  distance_to_transport = c(0.8, 2.0, 0.6, 2.8, 1.5)
)

# View summary statistics
summary(housing_data)

# Visualize distance to public transport
ggplot(housing_data, aes(x = block, y = distance_to_transport)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Distance to Public Transport by Block",
       x = "Block", y = "Distance (km)") +
  theme_minimal()

# Calculate accessibility score
housing_data$access_score <- with(housing_data, 
  round((1 / (distance_to_hospital + distance_to_school + distance_to_transport)) * 100, 1)
)

# View updated dataset
print(housing_data)

# Plot income vs accessibility score
ggplot(housing_data, aes(x = avg_income, y = access_score)) +
  geom_point(size = 4, color = "darkgreen") +
  labs(title = "Income vs Accessibility Score",
       x = "Average Income (INR)", y = "Accessibility Score") +
  theme_minimal()
