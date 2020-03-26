<%@page import="java.sql.ResultSet"%>
<%@page import="DataBase.ScoreDataBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  ScoreDataBase db = new ScoreDataBase();
    ResultSet res = db.obtener_puntaje("2048");
    ResultSet res2 = db.obtener_puntaje_individual("2048", request.getParameter("user_login"));
    int contador = 0;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>2048</title>
        <link href="Juegos/2048/estilo2048.css" rel ="stylesheet" type ="text/css">
        <script src="Juegos/2048/Modelo/Admin.js"></script>
        <script src="Juegos/2048/Modelo/Plantilla.js"></script>
        <script src="Juegos/2048/Modelo/Ficha.js"></script>
        <script src="Juegos/2048/Controlador/Teclado.js"></script>
        <script src="Juegos/2048/Vista/Manejo.js"></script>
        <script src="Juegos/2048/launcher.js"></script>
    </head>
    <body>
        <div class="cuadro-general">
            <div class="cabecera">
                <p>
                    <strong>Instrucciones:</strong> Mueve las fichas con las flechas para unir los mismos números e intenta llegar a 2048. ¡Buena suerte!
                </p>
                <div class="cuadro-puntajes">
                    <div class="puntaje-actual">0</div>
                </div>
            </div>
        </div>
        <div class="acerca-del-juego">
            <a class="reiniciar">Juego nuevo</a>
        </div>
        <div class="cuadro-general">
            <div class="cuadro-tablero">
                <div class="mensaje-final">
                    <p></p>
                    <div class="cuadro-botones">
                        <a class="boton-seguir-jugando">Seguir jugando</a>
                        <a class="boton-reintentar">Reiniciar juego</a>
                    </div>
                </div>
                <div class="cuadro-cuadricula">
                    <div class="cuadro-filas">
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                    </div>
                    <div class="cuadro-filas">
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                    </div>
                    <div class="cuadro-filas">
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                    </div>
                    <div class="cuadro-filas">
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                        <div class="cuadro-celda"></div>
                    </div>
                </div>
                <div class="cuadro-ficha"></div>
            </div>
        </div>

        <form action="GuardarPuntuacion" method="post">
            <input type="hidden" id="urlJuego" name="urlJuego" value="2048.jsp"></input>
            <input type="hidden" id="user_login" name="user_login"  value=<%=request.getParameter("user_login")%>></input>
            <input type="hidden" id="pass_login" name="pass_login" value=<%=request.getParameter("pass_login")%>></input>
            <input type="hidden" id="puntaje" name="puntaje"></input>
            <input type="hidden" id="juego" name="juego" value="2048"></input>
            <div id="botonGuardarPuntuacion" style="display: none">
                <input type="submit" value="Guardar Puntuacion"></input>
            </div>
            <table>
                <td>
                    <table border="1">
                        <tr>
                            <td colspan="2">Tus 5 Mejores Puntuaciones</td>
                        </tr>
                        <tr>
                            <td><center>Puntaje</center></td>
                </tr>
                <%contador = 0;%>
                <%while (res2.next() && contador < 5) {%>
                <tr>
                    <td><center><%=res2.getString("puntaje")%></center></td>
                </tr>
                <%contador++;
                    }%>
            </table>
        </td>
        <td>
            <table border="1"> 
                <tr>
                    <td colspan="2">Top 5 Puntuaciones</td>
                </tr>  
                <tr>
                    <td>Usuario</td><td>Puntaje</td>
                </tr>
                <%while (res.next() && contador < 5) {%>
                <tr>
                    <td><%=res.getString("usuario")%></td>
                    <td><%=res.getString("puntaje")%></td>
                </tr>
                <%contador++;
                    }%>
            </table>
            </table>
    </form>
    <%String url = "Juegos.jsp?user_login=" + request.getParameter("user_login") + "&pass_login=" + request.getParameter("pass_login") + "";%>
    <a href=<%=url%>><button>Volver</button></a>
</body>
</html>
