<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="utf-8">

	<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame
	Remove this if you use the .htaccess -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>Runner</title>
	<meta name="description" content="">
	<meta name="author" content="satur">

	<meta name="viewport" content="width=device-width; initial-scale=1.0">
	<link rel="stylesheet" href="{{ url_for('static', filename='Juegos/CovidRunner/static/bootstrap/css/bootstrap.min.css') }}">
	<script src="{{ url_for('static', filename='Juegos/CovidRunner/static/js/jQuery.js') }}" charset="utf-8"></script>
	<script src="{{ url_for('static', filename='Juegos/CovidRunner/static/bootstrap/js/bootstrap.min.js') }}" charset="utf-8"></script>
</head>
<style>

body {
	background: #EFEFBB;  /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #D4D3DD, #EFEFBB);  /* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #D4D3DD, #EFEFBB); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */

}
canvas {
	border: 1px solid;
}
#contenedor {
	position: relative;
	width: 600px;
	height: 300px;
}
#modal {
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	background-color: rgba(0,0,0,0.7);
}
#boton {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translateY(-50%) translateX(-80%);
}
#botonIns {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translateY(-50%) translateX(60%);
}


</style>
<body onkeyup="saltar(event);">
	<nav class="navbar navbar-light bg-secondary">
		<h1 class="d-bock mx-auto">Covid - Runner</h1>
		<p class="container d-block text-center">Protegete del covid, no dejes que te infecte</p>
	</nav>
	<div class="container">
		<div class = "text-center m-3"  id="contenedor">
			<canvas width="1000" height="300" id="canvas">
			</canvas>
		</div>
		<div id="modal">
			<button class="btn btn-light" id="boton" onclick="iniciar();">
				<img src="{{ url_for('static', filename='play.png') }}" id="imgbtn" />
			</button>
			<button type="button" id="botonIns" class="btn btn-light" data-toggle="modal" data-target="#instrucciones">
				INSTRUCCIONES
			</button>
		</div>
		<div>
			<h2 class="text-center">Tus resultados</h2>
			<ul class="list-group">
				<!-- Estos serian por partida o se los metemos a prolog? -->
				<li class="list-group-item">Puntaje: <span id="puntaje"></span></li>
				<li class="list-group-item">Virus esquivados: <span id="numVirusSuperados"></span></li>
				<li class="list-group-item">Nivel de juego: <span id="nivelJuego"></span></li>
				<li class="list-group-item">Puntuacion maxima: <span id="puntMax"></span></li>
			</ul>
			<p>{{ respuesta }}</p>
		</div>
	</div>
	<!-- modales -->
	<div class="modal fade" id="instrucciones" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" >
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"> <h3>INSTRUCCIONES</h3></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<div class="container">
					<p>Bienvenido, sabemos que estas aburrido por lo que te traemos este juego para que te entretengas un rato en la cuarentena</p><br>
					<h4>Instrucciones</h4><br>
					<p>1. Da click al boton play para empezar a jugar</p><br>
					<p>2. Debes esquivar todos los virus saltando, para ello usa la flecha de arriba para saltar.</p><br>
					<p>3. Cada vez que pasas determinado tiempo sin contagiarte subes de nivel por lo que aumenta la velocidad del juego.</p><br>
					<p>4. Al perder la partida podras ver tus estadisticas debajo del tablero de juego.</p><br>
					<p>DISFRUTALO !!!!</p>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">Cerrar</button>
			</div>
		</div>
	</div>
</div>
<script>
//Variables globales
var velocidad = {{variables.velocidad_mundo}};
var desplazamiento = 8;
var superficie = 267;
var nVirus = 600;
var bucle;
var canvas = document.getElementById("canvas");
var ctx = canvas.getContext("2d");
var ancho = canvas.width;
var alto = canvas.height;
var modal = document.getElementById("modal");
var puntaje = document.getElementById("puntaje");
var numVirus = document.getElementById("numVirusSuperados");
var puntajeAux;
var numVirusAux;
var punMax = document.getElementById("puntMax");
var puntajeMax = 0;
var nivel;
var nivelJuego = document.getElementById("nivelJuego")
//Clases
class Objeto {
	constructor(){
		this.img = document.createElement("img");
	}
	choque(otro){
		if(this.fondo < otro.techo || this.techo > otro.fondo || this.derecha < otro.izquierda || this.izquierda > otro.derecha){
			return false;
		} else {
			return true;
		}
	}
}

class Mundo {
	constructor(){
		this.x = 0;
		this.y = superficie;
		this.tamano = 1000;
		this.espacio = 32;
		this.img = document.createElement("img");
		this.img.src = "{{ url_for('static', filename='Juegos/CovidRunner/static/mundo.png') }}";
		this.imgNube = document.createElement("img");
		this.imgNube.src = "{{ url_for('static', filename='Juegos/CovidRunner/static/nube.png') }}";
		this.nx = 350;
		this.ny = 50;
		this.nd = 250;
	}
	dibujar(){
		var tx = this.x;
		for(var i=0; i<=this.tamano;i++){
			ctx.drawImage(this.img, tx, this.y);
			tx+=this.espacio;
		}
	}
	mover(){
		this.x-=desplazamiento;
	}
}
class Corredor extends Objeto {
	constructor(){
		super();
		this.x = 35;
		this.w = 100;
		this.h = 116;
		this.y = superficie-this.h;
		this.img.src = "{{ url_for('static', filename='Juegos/CovidRunner/static/runner.png') }}";

		this.techo = this.y;
		this.fondo = this.y+this.h-15;

		this.bordeDerecha = 30;
		this.bordeIzquierda = 50;
		this.derecha = this.x+this.w-this.bordeDerecha;
		this.izquierda = this.x+this.bordeIzquierda;

	}
	dibujar(){
		ctx.drawImage(this.img, this.x, this.y);
	}
	actualizarBordes(){
		this.techo = this.y;
		this.fondo = this.y+this.h+10;
	}
}

class Virus extends Objeto {
	constructor(x){
		super();
		this.x = x;
		this.hmin = 25;
		this.hmax = 40;
		this.h = this.generar(this.hmin, this.hmax);
		this.w = this.h*(0.58);
		this.y = superficie-this.h;
		this.nmin = 1;
		this.nmax = 3;
		this.n = this.generar(this.nmin, this.nmax);
		this.dmin = 250;
		this.dmax = 400;
		this.d = this.generar(this.dmin, this.dmax);
		this.siguiente = null;
		this.img.src = "{{ url_for('static', filename='Juegos/CovidRunner/static/virus.png') }}";
		this.techo = this.y;
		this.fondo = this.y+this.h;
		this.derecha = this.x+this.w;
		this.izquierda = this.x;
	}
	dibujar(){
		var tx = this.x;
		for(var i=0;i<this.n;i++){
			ctx.drawImage(this.img, tx, this.y, this.w, this.h);
			tx+=this.w;
			this.derecha = tx;
		}
		if(this.siguiente != null){
			this.siguiente.dibujar();
		}
	}
	mover(){
		this.x-=desplazamiento;
		this.izquierda = this.x;
		if(this.siguiente != null){
			this.siguiente.mover();
		}
	}
	agregar(){
		if(this.siguiente == null){
			this.siguiente = new Virus(this.x+this.d);
		} else{
			this.siguiente.agregar();
		}
	}
	generar(a,b){
		return Math.floor((Math.random() * b) + a);
	}
	verSiguiente(){
		return this.siguiente;
	}
}

class Nubes extends Objeto {
	constructor(x){
		super();
		this.x = x;
		this.hmin = 25;
		this.hmax = 40;
		this.h = this.generar(this.hmin, this.hmax);
		this.w = this.h*(1.51);
		this.y = 50;
		this.nmin = 1;
		this.nmax = 3;
		this.n = this.generar(this.nmin, this.nmax);
		this.dmin = 250;
		this.dmax = 400;
		this.d = this.generar(this.dmin, this.dmax);
		this.siguiente = null;
		this.img.src = "{{ url_for('static', filename='Juegos/CovidRunner/static/nube.png') }}";
		this.techo = this.y;
		this.fondo = this.y+this.h;
		this.derecha = this.x+this.w;
		this.izquierda = this.x;
	}
	dibujar(){
		var tx = this.x;
		for(var i=0;i<this.n;i++){
			ctx.drawImage(this.img, tx, this.y, this.w, this.h);
			tx+=this.w;
			this.derecha = tx;
		}
		if(this.siguiente != null){
			this.siguiente.dibujar();
		}
	}
	mover(){
		this.x-=2;
		this.izquierda = this.x;
		if(this.siguiente != null){
			this.siguiente.mover();
		}
	}
	agregar(){
		if(this.siguiente == null){
			this.siguiente = new Nubes(this.x+this.d);
		} else{
			this.siguiente.agregar();
		}
	}
	generar(a,b){
		return Math.floor((Math.random() * b) + a);
	}
	verSiguiente(){
		return this.siguiente;
	}
}
class Tiempo {
	constructor(){
		nivel = 0;
		this.tiempo = 0;
		this.limite = 10000;
		this.intervalo = 1000/velocidad;

		this.sonido = document.createElement("audio");
		this.sonido.src = "{{ url_for('static', filename='Juegos/CovidRunner/static/aviso.mp3') }}";
	}
	dibujar(){
		ctx.font = "25px Arial";
		ctx.fillText(nivel.toString(), 550, 40);
		nivelJuego.innerHTML = nivel;
	}

	tick(){
		this.tiempo+=this.intervalo;
		if(this.tiempo >= this.limite){
			this.tiempo = 0;
			nivel++;
			this.sonido.play();
			velocidad-=3;
			velocidadSalto-=2;
			this.intervalo = Math.floor(1000/velocidad);
			clearInterval(bucle);
			bucle = setInterval("frame()", velocidad);
		}
	}

}
//Objetos
var mundo = new Mundo();
var runner = new Corredor();
var virus = new Virus(600);
var nubes = new Nubes(200);
for(i=0;i<=nVirus;i++){
	virus.agregar();
	nubes.agregar();
}
var tiempo;
//funciones de control
var velocidadSalto = 25;
var desplazamientoSalto = 5;
var puedeSaltar = true;
var salto;
function subir(){
	runner.y-=desplazamientoSalto;
	runner.actualizarBordes();
	if(runner.y <= 2){
		clearInterval(salto);
		salto = setInterval("bajar()", velocidadSalto);
	}
}
function bajar(){
	runner.y+=desplazamientoSalto;
	runner.actualizarBordes();
	if(runner.y >= (superficie-runner.h)){
		clearInterval(salto);
		puedeSaltar = true;
		puntajeAux += 5;
		numVirusAux += 1;
	}
}
function iniciarSalto(){
	salto = setInterval("subir()", velocidadSalto);
	puedeSaltar = false;
}
function saltar(event){
	if(event.keyCode == 38){
		if(puedeSaltar){
			iniciarSalto();
		}
	}
}
function findeJuego(){
	clearInterval(bucle);
	if(puntajeAux>puntajeMax){
		puntajeMax = puntajeAux;
		punMax.innerHTML = puntajeMax;
	}
	modal.style.display = "block";
	document.getElementById("imgbtn").src = "{{ url_for('static', filename='Juegos/CovidRunner/static/otravez.png') }}";
	mundo = new Mundo();
	runner = new Corredor();
	velocidad = 50;
	velocidadSalto = 25;
	virus = new Virus(600);
	nubes = new Nubes(200);
	for(i=0;i<=nVirus;i++){
		virus.agregar();
		nubes.agregar();
	}
}
function choqueVirus(){
	var temp = virus;
	while(temp != null){
		if(temp.choque(runner)){
			//fin de juego
			findeJuego();
			break;
		} else {
			temp = temp.verSiguiente();
			puntaje.innerHTML = puntajeAux;
			numVirus.innerHTML = numVirusAux;
		}
	}
}
function destruirVirus(){
	if(virus.derecha < 0){
		virus = virus.verSiguiente();
	}
}

function destruirNubes(){
	if(nubes.derecha < 0){
		nubes = nubes.verSiguiente();
	}
}
//funciones globales
function dibujar(){
	ctx.clearRect(0,0,ancho, alto);
	mundo.dibujar();
	runner.dibujar();
	virus.dibujar();
	nubes.dibujar();
	tiempo.dibujar();
}
function frame(){
	dibujar();
	mundo.mover();
	virus.mover();
	nubes.mover();
	tiempo.tick();
	choqueVirus();
	destruirVirus();
	destruirNubes();
}

function iniciar(){
	puntajeAux = 0;
	numVirusAux = 0;
	puntaje.innerHTML = puntajeAux;
	numVirus.innerHTML = numVirusAux;
	modal.style.display = "none";
	bucle = setInterval("frame()", velocidad);
	tiempo = new Tiempo();
}

</script>
</body>
</html>