import requests 
import csv
import os.path
import numpy as np
import pandas as pd
from os import path
from sklearn.preprocessing import LabelEncoder
from sklearn.externals import joblib
from sklearn.linear_model import LogisticRegression
from sklearn.externals import joblib

def formatPowerStat(ps):
    if ps < 20:
        return 0
    elif ps >= 20 and ps < 40:
        return 1
    elif ps >= 40 and ps < 60:
        return 2
    elif ps >= 60 and ps < 80:
        return 3
    else:
        return 4
    
def formatEyeColor(ec):
    if "blue" in ec:
        return 0
    elif "brown" in ec:
        return 1
    elif "green" in ec:
        return 2
    else:
        return 3

def formatHairType(ht):
    if "black" in ht:
        return 0
    elif "blond" in ht:
        return 1
    elif "brown" in ht:
        return 2
    else:
        return 3

def createDataset():
	if not path.exists("heroes.csv"):
		with open("heroes.csv", 'w', newline='') as csvfile:
			spamwriter = csv.writer(csvfile, delimiter = ',')
			spamwriter.writerow(["name", "gender", "eyeColor", "hairType", 
				             "intelligence", "strength", "speed", "role"])

			for charId in range(1,732):
			    URL      = "https://www.superheroapi.com/api/{}/{}".format("3360286107350243", charId)
			    response = requests.get(url = URL).json() 

			    spamwriter.writerow([response["name"], response["appearance"]["gender"],
				                 response["appearance"]["eye-color"],
				                 response["appearance"]["hair-color"], response["powerstats"]["intelligence"],
				                 response["powerstats"]["strength"], response["powerstats"]["speed"],
				                 response["biography"]["alignment"]])

	df = pd.read_csv("heroes.csv")
	df = df.fillna(df.mean()) #setting mean in NaN values
	df = df.applymap(lambda s : s.lower() if type(s) == str else s) #converting strings to lowercase
	df = df.applymap(lambda ps : formatPowerStat(ps) if type(ps) != str else ps) #converting power stats in categories

	df["eyeColor"] = df["eyeColor"].map(lambda ec : formatEyeColor(ec)) #categorizing eye color
	df["hairType"] = df["hairType"].map(lambda ht : formatHairType(ht)) #categorizing hair type

	le         = LabelEncoder()
	df["role"] = df["role"].replace("-", "neutral") 
	df["role"] = le.fit_transform(df["role"]) #categorizing role
	df         = df.drop("gender", axis = 1)

	X = df.iloc[:, 1:-1].values
	y = df.iloc[:, -1].values

	classifier = LogisticRegression(random_state = 0, solver = "lbfgs", multi_class = "auto")
	classifier.fit(X, y)

	joblib.dump(classifier, "classifier.joblib")

