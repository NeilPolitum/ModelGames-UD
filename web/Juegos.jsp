<%@page import="User.Usuario"%>
<%@page import="DataBase.GamesDataBase"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DataBase.UsersDataBase"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String user = request.getParameter("user_login");
    String pass = request.getParameter("pass_login");

    UsersDataBase db = new UsersDataBase();
    boolean desicion = db.login(user, pass);
    ResultSet res = db.obtener_usuario(user);
    Usuario u = new Usuario();
    if (desicion && res.next()) {
        u.setNombre(res.getString("nombre"));
        u.setApellido(res.getString("apellido"));
        u.setUsername(res.getString("usuario"));
        u.setPass(res.getString("pass"));
    } else {
        response.sendRedirect("InicioSesionError.jsp");
    }
    String url = "?user_login=" + user + "&pass_login=" + pass + "";
    String prueba;
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home <%=u.getNombre()%></title>
        <link rel = "stylesheet" href="Styles/bootstrap.min.css">
        <link href = "https://fonts.googleapis.com/css?family=Lato:300,400|Work+Sans:300,400,700" rel="stylesheet">
        <link rel = "stylesheet" href="Styles/estiloPagina.css">
    </head>
    <body>
        <nav id = "header-navbar" class="navbar navbar-expand-lg py-4">
            <div class = "container">
                <a class = "navbar-brand d-flex align-items-center text-white">
                    <h4 class="font-weight-bolder mb-0"></h4>
                </a>
            </div>
        </nav>


        <div class = "jumbotron jumbotron-single d-flex align-items-center">
            <div class = "container text-center">
                <h2 class = "display-2 mb-4">
                    <p>MODELGAMES UD</p>
                    <br>
                    <table align="center" border="0">
                        <tr><td>2048</td><td>La Llorona</td><td>Busca Flores</td><td>Caza Calaveras</td></tr>
                        <tr><td><a1>_</a1></td></tr>
                        <tr>
                            <%prueba = "2048.jsp" + url;%>
                            <td><a href=<%=prueba%>><img src="Miniaturas/2048.png" height="300" width="300"></a></td>
                                    <%prueba = "LaLlorona.jsp" + url;%>
                            <td><a href=<%=prueba%>><img src="Miniaturas/llorona.png" height="300" width="300"></a></td>
                                    <%prueba = "buscaflores.jsp" + url;%>
                            <td><a href=<%=prueba%>><img src="Miniaturas/buscaflores.png" height="300" width="300"></a></td>
                                    <%prueba = "cazacalaveras.jsp" + url;%>
                            <td><a href=<%=prueba%>><img src="Miniaturas/cazacalaveras.jpg" height="300" width="300"></a></td>
                        </tr>
                        <tr><td><a1>_</a1></td></tr>
                        <tr><td>Covid 19</td><td>Palomas</td><td>Saltarin</td></tr>
                        <tr><td><a1>_</a1></td></tr>
                        <tr>
                            <%prueba = "covidrunner.jsp" + url;%>
                            <td><a href=<%=prueba%>><img src="Miniaturas/covid.png" height="300" width="300"></a></td>
                                    <%prueba = "palomas.jsp" + url;%>
                            <td><a href=<%=prueba%>><img src="Miniaturas/palomas.jpg" height="300" width="300"></a></td>
                                    <%prueba = "saltarin.jsp" + url;%>
                            <td><a href=<%=prueba%>><img src="Miniaturas/saltarin.png" height="300" width="300"></a></td>
                        </tr>
                    </table>
                </h2>
            </div>
            <div class = "rectangle-4"></div>
            <div class = "rectangle-2"></div>
            <div class = "rectangle-transparent-1"></div>
            <div class = "rectangle-transparent-2"></div>
            <div class = "rectangle-transparent-3"></div>
            <div class = "rectangle-transparent-4"></div>
            <table border ="3">
                <tr>
                    <td><h1 <div><a href="Login.jsp">Cerrar sesión</a></div></h1></td>
                </tr>
            </table>
        </div>
    </body>
</html>
