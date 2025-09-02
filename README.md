# 🏘️ Affordable Housing Accessibility in R – Kumartuli, Kolkata

## 📌 Overview
This project analyzes the accessibility of affordable housing in Kumartuli, a historic neighborhood in Kolkata, India. Using R, we simulate and explore data on housing units, income levels, and proximity to essential services like hospitals, schools, and public transport. The goal is to identify equity gaps and propose data-driven improvements for urban planning.

## 🎯 Objective
- Simulate neighborhood-level housing data for Kumartuli
- Use R to analyze accessibility to key services
- Create visualizations to highlight disparities
- Develop a simple accessibility score for comparison

## 🛠️ Tools Used
- **R** – Data manipulation and visualization
- **tidyverse** – For data wrangling and plotting
- **ggplot2** – For creating visual insights

## 🗂️ Dataset Description
Simulated dataset includes:
- `block`: Subsections of Kumartuli (e.g., Kumartuli North, Kumartuli South)
- `housing_units`: Number of affordable housing units
- `avg_income`: Average household income (INR/month)
- `distance_to_hospital`: Distance in km
- `distance_to_school`: Distance in km
- `distance_to_transport`: Distance in km

### 📊 Sample Data
```r
housing_data <- data.frame(
  block = c("Kumartuli North", "Kumartuli South", "Pottery Lane", "Riverfront Block", "Workshop Alley"),
  housing_units = c(85, 60, 110, 45, 70),
  avg_income = c(18000, 15000, 17000, 14000, 16000),
  distance_to_hospital = c(2.1, 3.0, 1.5, 3.8, 2.5),
  distance_to_school = c(1.2, 2.5, 1.0, 3.2, 2.0),
  distance_to_transport = c(0.8, 2.0, 0.6, 2.8, 1.5)
)
📈 Visualizations
1. Distance to Public Transport by Block
ggplot(housing_data, aes(x = block, y = distance_to_transport)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Distance to Public Transport by Block",
       x = "Block", y = "Distance (km)") +
  theme_minimal()

2. Accessibility Score Calculation
housing_data$access_score <- with(housing_data, 
  round((1 / (distance_to_hospital + distance_to_school + distance_to_transport)) * 100, 1)
)

3. Income vs Accessibility Score
ggplot(housing_data, aes(x = avg_income, y = access_score)) +
  geom_point(size = 4, color = "darkgreen") +
  labs(title = "Income vs Accessibility Score",
       x = "Average Income (INR)", y = "Accessibility Score") +
  theme_minimal()

🧠 Key Insights
Blocks with lower income tend to have poorer access to essential services

Pottery Lane shows the best accessibility score due to proximity to all services

Riverfront Block and Kumartuli South need targeted infrastructure improvements

🌿 Recommendations
Improve transport and healthcare access in southern and riverfront blocks

Prioritize school proximity in future housing developments

Use accessibility scores to guide equitable urban planning decisions
