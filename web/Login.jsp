<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuario</title>
        <meta charset="utf-8">
        <title>MODELGAMES UD</title>
        <link rel = "stylesheet" href="Styles/bootstrap.min.css">
        <link href = "https://fonts.googleapis.com/css?family=Lato:300,400|Work+Sans:300,400,700" rel="stylesheet">
        <link rel = "stylesheet" href="Styles/estiloPagina.css">
    </head>
    <body>
        <nav id = "header-navbar" >
            <div class = "container">
                <a class = "navbar-brand d-flex align-items-center text-white" >
                    <h4 class = "font-weight-bolder mb-0"><br>MODELGAMES UD</h4>
                </a>
            </div>
        </nav>

        <div class = "jumbotron d-flex align-items-center" style="background-image: url(Miniaturas/fondoPag.jpg)">
            <div class = "container text-center">
                <h1 class = "display-1 mb-4">
                    <form action="Juegos.jsp" method="post">
                        <table align="center" border="0">

                            <thead>

                            <h3 <th colspan="2"><b>Iniciar sesión</b></th>
                            </h3>
                            </thead>
                            <tbody align="left">
                                <tr>
                                    <td>Usuario:</td>
                                    <td><input type="text" id="user" name="user_login" required></td>
                                </tr>
                                <tr>
                                    <td>Contraseña:</td>
                                    <td><input type="password" id="pass" name="pass_login" required></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2"><input type="submit" value="Ingresar"></td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">¿No tienes cuenta? <a href="Registro.jsp">Crea una</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </h1>
            </div>
            <div class = "rectangle-3"></div>
            <div class = "rectangle-1"></div>
        </div>
    </body>
</html>