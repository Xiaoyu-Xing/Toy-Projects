# Classification.
import numpy as np 
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.neural_network import MLPClassifier
from sklearn.preprocessing import StandardScaler

data = load_breast_cancer()
print(data.keys())
print(data.data.shape)
print(data.target_names)

x_train, x_test, y_train, y_test = train_test_split(
	data.data, data.target, test_size=0.33
	)

model = RandomForestClassifier()
model.fit(x_train, y_train)
model.score(x_train, y_train)
model.score(x_test, y_test)
predictions = model.predict(x_test)
np.sum(predictions == y_test)/len(y_test)

scaler = StandardScaler()
x_train_l = scaler.fit_transform(x_train)
x_test_l = scaler.transform(x_test)
model2 = MLPClassifier()
model2.fit(x_train_l, y_train)
model2.score(x_train_l, y_train)
model2.score(x_test_l, y_test)

# Regression
import pandas as pd 
from sklearn.linear_model import LinearRegression
from sklearn.ensemble import RandomForestRegressor
# from sklearn.model_selection import train_test_split
df = pd.read_csv('./airfoil_self_noise.dat', sep='\t', header=None)
print(df.head())
print(df.info())
data_r = df[[0,1,2,3,4]].values
target_r = df[5].values

x_train_r, x_test_r, y_train_r, y_test_r = train_test_split(
	data_r, target_r, test_size=0.33)
model_r = LinearRegression()
model_r.fit(x_train_r, y_train_r)
model_r.score(x_train_r, y_train_r)
model_r.score(x_test_r, y_test_r)
predictions = model_r.predict(x_test_r)

model_r_2 = RandomForestRegressor()
model_r_2.fit(x_train_r, y_train_r)
model_r_2.score(x_train_r, y_train_r)
model_r_2.score(x_test_r, y_test_r)