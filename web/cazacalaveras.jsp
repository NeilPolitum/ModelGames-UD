<%@page import="java.sql.ResultSet"%>
<%@page import="DataBase.ScoreDataBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  ScoreDataBase db = new ScoreDataBase();
    ResultSet res = db.obtener_puntaje("Caza Calaveras");
    ResultSet res2 = db.obtener_puntaje_individual("Caza Calaveras",request.getParameter("user_login"));
    int contador = 0;
%>
<!DOCTYPE html>
<html lang="es">

<head>
	
	<title>Caza Craneos</title>
	
	<link rel="stylesheet" type="text/css" href="Juegos/Cazacalaveras/estilo/estilo.css" media="screen">

</head>

<body>

		
<script src="Juegos/Cazacalaveras/js/juego.js"></script>
<form action="GuardarPuntuacion" method="post">
    <input type="hidden" id="urlJuego" name="urlJuego" value="cazacalaveras.jsp"></input>
    <input type="hidden" id="user_login" name="user_login"  value=<%=request.getParameter("user_login")%>></input>
    <input type="hidden" id="pass_login" name="pass_login" value=<%=request.getParameter("pass_login")%>></input>
    <input type="hidden" id="puntaje" name="puntaje"></input>
    <input type="hidden" id="juego" name="juego" value="Caza Calaveras"></input>
    <div id="botonGuardarPuntuacion">
        <input type="submit" value="Guardar Puntuacion"></input>
    </div>
    <table>
        <td>
        <table border ="1" bordercolor ="white" style="font-family : arial; color : White;">
            <tr>
                <td colspan="2">Tus 5 Mejores Puntuaciones</td>
            </tr>
            <tr>
                <td><center>Puntaje</center></td>
            </tr>
            <%contador=0;%>
            <%while(res2.next() && contador<5){%>
            <tr>
                <td><center><%=res2.getString("puntaje")%></center></td>
            </tr>
            <%contador++; }%>
        </table>
        </td>
        <td>
            <table border ="1" bordercolor ="white" style="font-family : arial; color : White;">
                <tr>
                    <td colspan="2">Top 5 Puntuaciones</td>
                </tr>  
                <tr>
                    <td>Usuario</td><td>Puntaje</td>
                </tr>
                <%while(res.next() && contador<5){%>
                <tr>
                    <td><%=res.getString("usuario")%></td>
                    <td><%=res.getString("puntaje")%></td>
                </tr>
                <%contador++; }%>
            </table>
        </td>
    </table>
</form>
<%String url="Juegos.jsp?user_login=" + request.getParameter("user_login") + "&pass_login=" + request.getParameter("pass_login")+"";%>
<a href=<%=url%>><button>Volver</button></a>
	
</body>

</html>
