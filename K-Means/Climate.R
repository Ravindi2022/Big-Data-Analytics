#loading the libraries to the project
library(ggplot2)

# Load the data set
data <- read.csv("C://Users//ASUS//Documents//Computer Science @Plymuni . NSBM//3rd Year//Big Data Analytics//Lab//Climate.csv")
head(data)
str(data)

# Examine the data set
table(data$ClimateZone)

# Scatter plot of Temperature vs. Rainfall (colored by Climate Zone)
ggplot(data, aes(x=Temperature, y=Rainfall, color=ClimateZone)) +
  geom_point(size=3, alpha=0.7) +
  labs(title="Temperature vs Rainfall Distribution",
       x="Temperature",
       y="Rainfall") +
  theme_minimal()

# Prepare data for clustering (removing Climate Zone)
model_data <- data[, c("Temperature", "Rainfall")]
head(model_data)

# K-Means clustering
set.seed(150)
results <- kmeans(model_data, centers=3)

# Add cluster labels to the dataset
data$Cluster <- as.factor(results$cluster)

# Scatter plot with clusters
ggplot(data, aes(x=Temperature, y=Rainfall, color=Cluster)) +
  stat_ellipse(aes(fill=Cluster), geom="polygon", alpha=0.4) +
  geom_point(size=3, alpha=0.8) +
  labs(title="K-Means Clustering of Temperature vs Rainfall",
       x="Temperature",
       y="Rainfall") +
  theme_minimal()

# Compare ClimateZone with Clusters
table(data$ClimateZone, data$Cluster)
