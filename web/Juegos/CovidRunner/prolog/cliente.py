import requests
import json
r= requests.get("http://localhost:8080/")
respuesta =  r.content
print(json.loads(respuesta))
