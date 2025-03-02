import pandas as pd

import matplotlib.pyplot as plt

import seaborn as sns

sns.set_style("whitegrid")

data = pd.read_csv("C://Users//ASUS//Documents//Computer Science @Plymuni . NSBM//3rd Year//Big Data Analytics//Lab//sl_inflation.csv")

#inflation rate over years
plt.figure(figsize=(10,5))
sns.lineplot(x=data["Year"], y=data["Inflation_Rate (%)"], marker = "0", linestyle = "-", color = "red")
plt.title("Inflation Rate of Sri Lanka")

print(data.columns)

plt.figure(figsize=(10,5))
sns.lineplot(x=data["Year"], y=data["Exchange_Rate (LKR/USD)"], marker = "o" , linestyle= "-"  , label = "Exchange_Rate (LKR/USD)")
sns.lineplot(x=data["Year"], y=data["Fuel_Price (LKR/litre)"], marker = "o" , linestyle= "-" ,  label = "Fuel_Price (LKR/litre)")
sns.lineplot(x=data["Year"], y=data["Food_Price_Index"], marker = "o" , linestyle= "-"  , label = "Food_Price_Index")
sns.lineplot(x=data["Year"], y=data["Imports (Billion LKR)"], marker = "o" , linestyle= "-" ,  label = "Imports (Billion LKR)")
sns.lineplot(x=data["Year"], y=data["Exports (Billion LKR)"], marker = "o" , linestyle= "-" ,  label = "Exports (Billion LKR)")
plt.title("Contribution factors on Inflation Rate of Sri Lanka")
plt.xlabel("Year")
plt.ylabel("Amount")
plt.legend()
plt.show()

plt.figure(figsize=(10,5))
corr_matrix = data.drop(columns =["Year"]).corr()
sns.heatmap(corr_matrix, annot = True, cmap= "coolwarm" , fmt=".2f", linewidth=0.5)
plt.title("Heat Map")
plt.show()
