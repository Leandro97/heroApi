from flask import Flask, render_template, request, url_for, jsonify
from flask_restplus import Api, Resource, fields
from sklearn.externals import joblib
import numpy as np
import model
import os
from os import path

app = Flask(__name__)

@app.route('/')
def main():
	model.createDataset()

@app.route('/api', methods=['POST'])
def my_test_endpoint():
	model.createDataset()
	classifier = joblib.load("classifier.joblib")
	input_json = request.get_json(force=True) 
	data 	   = [int(val) for val in input_json.values()]
	prediction = classifier.predict(np.array(data).reshape(1, -1))
	types      = {0: "Villain", 1: "Hero"}
	result     = types[prediction[0]]

	return jsonify({"message": result	})

if __name__ == "__main__":
	port = int(os.environ.get("PORT", 5000))
	app.run(host='0.0.0.0', port=port)
