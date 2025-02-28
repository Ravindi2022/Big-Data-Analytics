library(ggplot2)
data <-read.csv("C://Users//ASUS//Documents//Computer Science @Plymuni . NSBM//3rd Year//Big Data Analytics//Lab//origin.csv")
head(data)
str(data)

#examine the dataset
table(data$Country)

#drawing cluster results
ggplot(data, aes(x=Height, y=Weight, color=Cluster))+
  stat_ellipse(aes(fill = Cluster), geom = "polygon", alpha=0.4)+
  geom_point(size=3, alpha=0.8)+
  labs(title ="Height against weight distribution",
       x="Height",
       y="Weight")+
  theme_minimal()

table(data$Country, data$Cluster)


#implementation of cluster model using K-Means

#let's remove country column
model_data <-data[,c("Height","Weight")]
head(model_data)

#Kmeans model
set.seed(150)
results <- kmeans(model_data, centers = 3)

results

#adding labels to clusters
data$Cluster <- as.factor(results$cluster)
data$Cluster

