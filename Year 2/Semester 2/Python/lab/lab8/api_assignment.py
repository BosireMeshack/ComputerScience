
#Github API
import requests

responseG = requests.get("https://api.github.com/repos/BosireMeshack/Airbnb")
print(responseG.json())

# JSON placeholder API
import requests
responseJ = requests.get("https://jsonplaceholder.typicode.com/users/1")
print(responseJ.json())



#Dog API

import requests
responseD = requests.get("https://api.thedogapi.com/v1/images/search")
print(responseD.json())



#OpenWeather API

import requests
responseWeather = requests.get("https://api.openweathermap.org/data/2.5/weather?q=Budapest,hu&APPID=494d6e76b0c50c8aaa3a0f8c1322e631")
print(responseWeather.json())