library(ggplot2)
library(dplyr)
library(factoextra)

data <- read.csv("C://Users//ASUS//Documents//Computer Science @Plymuni . NSBM//3rd Year//Big Data Analytics//Lab//customer_data_pca.csv")


#standardization
scaled_data <- scale(data)
head(scaled_data)

#calculating PCA with eingvalues and eingvectors

pca_model <- prcomp(scaled_data, center=TRUE, scale=TRUE)
pca_model

#transforming dataset into principal components
pca_transformed_data <- as.data.frame(pca_model$x)

#kmeans for PC1, PC2
set.seed(150)
cluster_results <-kmeans(pca_transformed_data[,1:2], centers=4)

pca_transformed_data$Cluster <-as.factor(cluster_results$cluster)

#Age against spending score
ggplot(pca_transformed_data, aes (x= PC1, y= PC2, color=Cluster))+
  stat_ellipse (aes (fill = Cluster), geom = "polygon", alpha=0.4)+
  geom_point(size=3, alpha=0.8)+
  labs (title = "PC1 against PC2 distribution of Clusters",
        x ="PC1",
        y = "PC2") +
  theme_minimal()

#drawing proper cluster bounderies
#creating corvex hull for each cluster
compute_hell <-function
