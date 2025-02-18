#loading the libraries to the project
library(ggplot2)
library(forecast)

#loading the dataset
data <- read.csv("C://Users//ASUS//Downloads//Population_Dataset.csv")

str(data)
summary(data)

# Data preprocessing: Converting 'Date' variable to date format
data$Date <- as.Date(data$Date)

# Creating the time series for the 'Population' column
pop_t_s <- ts(data$Population, start = c(2005, 1), frequency = 12) 

# Plotting the time series
plot(pop_t_s, main = "Population Time Series", 
     xlab = "Year", ylab = "Population", col = "darkblue") 

# Future predictions using ARIMA model
model <- auto.arima(pop_t_s)
predict <- forecast(model, h = 24)
plot(predict, main = "Population Forecast")
