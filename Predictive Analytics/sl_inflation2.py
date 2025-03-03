import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import GradientBoostingRegressor
from sklearn.metrics import mean_absolute_error, r2_score 

data = pd.read_csv("C://Users//ASUS//Documents//Computer Science @Plymuni . NSBM//3rd Year//Big Data Analytics//Lab//sl_inflation.csv")

#selecting the independant and dependant columns
x = data.drop(columns = ["Year", "Inflation_Rate (%)"])
y = data["Inflation_Rate (%)"]

#splitting the dataset
x_train, x_test, y_train, y_test = train_test_split(x,y, test_size = 0.2, random_state=42)

#model training
model = GradientBoostingRegressor(n_estimators = 100, learning_rate=0.1, max_depth = 3, random_state = 42)
model.fit(x_train, y_train)

predictions = model.predict(x_test)

#evaluating the performance
r2 = r2_score(y_test, predictions)
print(f"Accuracy = {r2:2f}")

next_year = np.array([[8.2, 255, 260, 300, 3900, 2400, 3500]])
future = model.predict(next_year)
print(f"Inflation Rate in 2029 = {future[0]:.2f}%")

#
