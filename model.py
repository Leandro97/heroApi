import requests 
import csv
import os.path
import numpy as np
import pandas as pd
from os import path
from sklearn.preprocessing import LabelEncoder
from sklearn.externals import joblib
from sklearn.ensemble import RandomForestClassifier

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
				             "intelligence", "strength", "speed", "power", 
					     "combat", "role"])

			for charId in range(1,732):
			    URL         = "https://www.superheroapi.com/api/{}/{}".format("3360286107350243", charId)
			    response    = requests.get(url = URL).json() 

			    spamwriter.writerow([response["name"], response["appearance"]["gender"],
						 response["appearance"]["eye-color"], response["appearance"]["hair-color"],
						 response["powerstats"]["intelligence"], response["powerstats"]["strength"],
						 response["powerstats"]["speed"], response["powerstats"]["power"],
						 response["powerstats"]["combat"], response["biography"]["alignment"]])

	df = pd.read_csv("heroes.csv")
	df = df.fillna(df.mean()) #setting mean in NaN values
	df = df.applymap(lambda s : s.lower() if type(s) == str else s) #converting strings to lowercase
	df = df.applymap(lambda ps : formatPowerStat(ps) if type(ps) != str else ps) #converting power stats in categories

	df["eyeColor"] = df["eyeColor"].map(lambda ec : formatEyeColor(ec)) #categorizing eye color
	df["hairType"] = df["hairType"].map(lambda ht : formatHairType(ht)) #categorizing hair type

	le         = LabelEncoder()
	df["role"] = df["role"].replace("-", "bad") 
	df["role"] = df["role"].replace("neutral", "bad") 
	df["role"] = le.fit_transform(df["role"]) #categorizing role
	df         = df.drop("gender", axis = 1)

	#counting heroes and villains
	countHero, countVillain = df["role"].value_counts()

	dfHero    = df[df["role"] == 1] #hero dataframe
	dfVillain = df[df["role"] == 0] #villain dataframe

	newDfVillain = dfVillain.sample(countHero, replace = True, random_state = 1) #oversampling hero dataframe
	balancedDf = pd.concat([newDfVillain, dfHero], axis = 0) #new balanced dataframe

	X = balancedDf.iloc[:, 1:-1].values
	y = balancedDf.iloc[:, -1].values

	classifier = RandomForestClassifier(n_estimators = 10, criterion = 'entropy', random_state = 0)
	classifier.fit(X, y)

	joblib.dump(classifier, "classifier.joblib")
