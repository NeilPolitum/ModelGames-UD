<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="Juegos/Buscaflores/estilos.css">
    <link href="https://fonts.googleapis.com/css?family=Bellota+Text&display=swap" rel="stylesheet">
    <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
            crossorigin="anonymous"></script>
    <script type="text/javascript" src="Juegos/Buscaflores/buscaflores.js"></script>
    
    <link rel="icon" href="Juegos/Buscaflores/Imagenes/IconoCabecera.png" />
    <title>BUSCAFLORECITAS</title>
</head>
<body>	
    <div class="wrapper">
        <div class="sidebar">
            <h1>BUSCAFLORECITAS</h1>
            <h2>Menú</h2>
            <img class="imagenTitulo1" src="Juegos/Buscaflores/Imagenes/IconoTitulo.png" width="20px" height="20px">
            <img class="imagenTitulo2" src="Juegos/Buscaflores/Imagenes/IconoTitulo.png" width="20px" height="20px">
            <img class="imagenMenu" src="Juegos/Buscaflores/Imagenes/IconoMenu.png" width="70px" height="70px">
            <img class="imagenJuego" src="Juegos/Buscaflores/Imagenes/iconoJuego.png" width="20px" height="20px">
            <img class="imagenPartidas" src="Juegos/Buscaflores/Imagenes/IconoPartidas.png" width="20px" height="20px">
            <img class="imagenRecord" src="Juegos/Buscaflores/Imagenes/IconoRecord.png" width="20px" height="20px">
            <img class="imagenReglas" src="Juegos/Buscaflores/Imagenes/IconoReglas.png" width="20px" height="20px">
            <img class="imagenInfo" src="Juegos/Buscaflores/Imagenes/IconoInfo.png" width="20px" height="20px">
            
            
            <ul>
                <li onclick="iniciarBotones()"><a href="#tablero"><i class="fas juegoNuevo"></i>Juego nuevo</a></li>
                <li><a href="#partidas"><i class="fas partidasJugadas"></i>Partidas jugadas</a></li>
                <li><a href="#record"><i class="fas records"></i>Récords</a></li>
                <li><a href="#reglas"><i class="fas regla"></i>Reglas</a></li>
                <li><a href="#info"><i class="fas informacion"></i>Informacion de contacto</a></li>
            </ul> 
        </div>
        <div class="main_content">
            
            <img class="imagenNinos" src="Juegos/Buscaflores/Imagenes/ninos.png" width="350px" height="200px">
            <img class="imagenFlor1" src="Juegos/Buscaflores/Imagenes/flor.png" width="40px" height="40px">
            <img class="imagenFlor2" src="Juegos/Buscaflores/Imagenes/flor.png" width="40px" height="40px">
            <img class="imagenFlor3" src="Juegos/Buscaflores/Imagenes/flor.png" width="40px" height="40px">
            <img class="imagenFlor4" src="Juegos/Buscaflores/Imagenes/flor.png" width="40px" height="40px">
            <img class="imagenFlor5" src="Juegos/Buscaflores/Imagenes/flor.png" width="40px" height="40px">
            <img class="imagenFlor6" src="Juegos/Buscaflores/Imagenes/flor.png" width="40px" height="40px">
            
            <a name="tablero"> </a>
            <div class="tablero">          
            </div>
            <a name="partidas">
                <div class="partidas">
                    <div class="partidasTotales">
                        <h1>Partidas jugadas</h1><br>

                    </div>
                    <div class="partidasGanadas">
                        <h1>Partidas ganadas</h1><br>
                    </div>
                    <div class="partidasPerdidas">
                        <h1>Partidas perdidas</h1><br>
                    </div>
                </div>
            </a>
            <a name="record">
                <div class="record">
                    <h1>Récord</h1>
                </div>
            </a>
            <a name="reglas">
                <div class="reglas">
                    <h1>Reglas</h1>
                    <div>El juego consiste en despejar todas las casillas de una pantalla que no oculten una flor. con el fin de encontrarlas todas al final.</div>
                    <div>Algunas casillas tienen un número, el cual indica la cantidad de flores que hay en las casillas circundantes. Así, si una casilla tiene el número 3, significa que de las ocho casillas que hay alrededor (si no es en una esquina o borde) hay 3 con flores y 5 sin flores. Si se descubre una casilla sin número indica que ninguna de las casillas vecinas tiene flor y éstas se descubren automáticamente.</div>
                    <div>Si se descubre una casilla con una flor se pierde la partida.</div>
                    <div>Se puede poner una marca en las casillas que el jugador piensa que hay flores para ayudar a descubrir las que están cerca.</div>
                </div>
            </a>
            <a name="info">
                <div class="info">
                    <h1>Informacion de contacto</h1>
                    <div>Leonardo Daza Ibarra <b>Código:</b> 20162020011</div>
                    <div>Ana María Garcia <b>Código:</b> 20171020153</div>
                    <div>Liliana Herrera Polo <b>Código:</b> 20171020019</div>
                    <div class="correo"><b>Correo de contacto:</b></div>
                    <div>luzly.5079@gmail.com</div>
                </div>
            </a>
        </div>
    </div>
    <script>
        iniciarBotones();
        puntos();
    </script>   
</body>
</html>