#installing required libraries
install.packages("ggplot2") #for graphs
install.packages("forecast") #model to predict future

#loading to project
library(ggplot2)
library(forecast)

#loading the dataset
data <- read.csv("C://Users//ASUS//Downloads//Coconut_Price_SriLanka_2005_2025.csv")

str(data)

#data pre processing month variable to date format
data$Month <- as.Date(data$Month)

#ggplot(data, aes(x= Coconut_Price))+
  #geom_histogram(binwidth =8, fill="red", color="black")+
  #labs(title= "Coconut Price Distribution",
       #x="Rs", y="frequency")+
  #theme_minimal() 

#creating the time series
coco_t_s <- ts(data$Coconut_Price, start = c(2005,1), frequency = 12)

#plot the time series
plot(coco_t_s, main = "Coconut Price Time Series",
     xlab="Year", ylab="Price", col="darkblue")

#future predictions
model<- auto.arima(coco_t_s)
predict <- forecast(model, h =24)
plot(predict) 
