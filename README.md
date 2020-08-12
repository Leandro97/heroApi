# Hero Api
Pick your attributes, discover your tendency.

This simple app requires that user choose 7 attributes:
- Eye color
- Hair type
- Intelligence level
- Strength level
- Speed level
- Power level
- Combat level

When submit button is pressed, a POST http request is sent to a flask server hosted at https://amiaheroapi.herokuapp.com/api, that receives the
attribute json and predict user tendency (Villain or Hero) using a Random Forest Classifier. The classifier is trained using 732 instances of characters 
obtained in https://superheroapi.com/.

# How to use
Clone this repository in a Mac computer. Ui folder contains the app project, so you can run it in simulators, or install it in actual Apple devices. 

Send a POST http request to https://amiaheroapi.herokuapp.com/api containg a json object with the chosen attributes. For example:
{"eyeColor": "0", "hairType": "3", "intelligence": "0", "strength": "2", "speed": "1", "power": "4", "combat": "4"}
