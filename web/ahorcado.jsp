<%@page import="java.sql.ResultSet"%>
<%@page import="DataBase.ScoreDataBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  ScoreDataBase db = new ScoreDataBase();
    ResultSet res = db.obtener_puntaje("Ahorcado");
    ResultSet res2 = db.obtener_puntaje_individual("Ahorcado", request.getParameter("user_login"));
    int contador = 0;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Juego del ahorcado</title>
        <link rel="stylesheet" href="Juegos/Ahorcado/css/master.css">
        </head>
    <body>
        <h1>-El juego del ahorcado-</h1>
        <canvas id="pantalla" width="960px" height="450px"></canvas>
        <!-- El boton que nos sirve para recargar la pagina y asi generar una nueva palabra y volver a jugar -->
        <button id="boton" type="reset" onclick="javascript:window.location.reload();">Volver a Jugar</button>
        <script src="Juegos/Ahorcado/Js/my.js" charset="utf-8"></script>
        
        <form action="GuardarPuntuacion" method="post">
            <input type="hidden" id="urlJuego" name="urlJuego" value="ahorcado.jsp"></input>
            <input type="hidden" id="user_login" name="user_login"  value=<%=request.getParameter("user_login")%>></input>
            <input type="hidden" id="pass_login" name="pass_login" value=<%=request.getParameter("pass_login")%>></input>
            <input type="hidden" id="puntaje" name="puntaje"></input>
            <input type="hidden" id="juego" name="juego" value="Ahorcado"></input>
            </form>
            <%String url = "Juegos.jsp?user_login=" + request.getParameter("user_login") + "&pass_login=" + request.getParameter("pass_login") + "";%>
        <a href=<%=url%>><button>Volver</button></a>
    </body>
</html>
