from flask import Flask
from flask import render_template
import requests
app = Flask(__name__ , static_folder='static' )
@app.route('/')
def hello_world():
	#r= requests.get("http://localhost:8000/")
	#respuesta =  r.content

	variables= {'velocidad_mundo':50}
	return render_template('juego.html',variables=variables )

app.run(debug=True)
