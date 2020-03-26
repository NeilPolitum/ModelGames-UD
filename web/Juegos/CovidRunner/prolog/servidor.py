from http.server import HTTPServer, BaseHTTPRequestHandler
from pyswip import Prolog
import json
class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):

    def do_GET(self):
        prolog = Prolog()
        prolog.consult('familia.pl')
        self.send_response(200)
        self.end_headers()
        lista = list(prolog.query("familiarde(X,Y)"))
        myjson = json.dumps(lista)
        self.wfile.write(bytes(myjson,"utf-8"))
        
httpd = HTTPServer(('localhost', 8080), SimpleHTTPRequestHandler)
httpd.serve_forever()
