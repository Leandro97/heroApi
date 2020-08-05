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

When submit button is pressed, a POST http request is sent to a flask server hosted at https://www.heroku.com, that receives the
attribute json and predict user tendency (Villain or Hero) using a Random Forest Classifier.

# How to use
Clone this repository in a Mac computer. Ui folder contains the app project, so you can run it in simulators, or install it in actual Apple devices. 
