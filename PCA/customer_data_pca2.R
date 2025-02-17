library(ggplot2)
data <- read.csv("C://Users//ASUS//Documents//customer_data_pca.csv")
head(data)
str(data)

#kmeans model
set.seed(150)
results <-kmeans(data, centers =4)

#adding labels to clusters
dataCluster <-as.factor(results$cluster)

#drawing cluster results
ggplot(data, aes (x= Age, y= Annual_Income, color-Cluster))+
  stat_ellipse(aes (fill = Cluster), geom = "polygon", alpha=0.4)+
  geom_point(size=3, alpha=0.8)+
  labs (title = "Age against Annual_Income distribution of Clusters",
        x ="Age",
        y = "Annual_Income") +
  theme_minimal()

 #Age against spending score
ggplot(data, aes (x= Age, y= Spending_Score, color-Cluster))+
  stat_ellipse (aes (fill = Cluster), geom = "polygon", alpha=0.4)+
  geom_point(size=3, alpha=0.8)+
  labs (title = "Age against Spending_Score distribution of Clusters",
            x ="Age",
        y = "Spending_Score") +
  theme_minimal()

#annual income vs spending score
ggplot(data, aes (x= Annual_Income, y= Spending_Score, color-Cluster))+
  stat_ellipse(aes (fill = Cluster), geom = "polygon", alpha=0.4)+
  geom_point (size=3, alpha=0.8)+
  Jahc/title - "Annual Toroma anainct Spending score distribution of 
