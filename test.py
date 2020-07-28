import requests

dictToSend = {"eyeColor": "0", "hairType": "0", "intelligence": "0", "strength": "0", "speed": "0", "power": "0", "combat": "0"}
res = requests.post('https://amiaheroapi.herokuapp.com/api', json = dictToSend)
#res = requests.post('http://127.0.0.1:5000/api', json = dictToSend)

print (res.text)
