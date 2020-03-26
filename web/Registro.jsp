<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MODELGAMES UD</title>
        <meta charset="utf-8">
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
                    <form action="Register" method="post">
                        <table align="right" border="0" width="400">
                            <thead>
                                <h3 <th colspan="2"><b>Registro</b></th>
                                </h3>
                            </thead>
                            <tbody align="left">
                                <tr>
                                    <td>Nombre:</td>
                                    <td><input type="text" id="nombre_user" name="nombre_user" required></td>
                                </tr>
                                <tr>
                                    <td>Apellido:</td>
                                    <td><input type="text" id="apellido_user" name="apellido_user" required></td>
                                </tr>
                                <tr>
                                    <td>Usuario:</td>
                                    <td><input type="text" id="user_register" name="user_register" required></td>
                                </tr>
                                <tr>
                                    <td>Contraseña:</td>
                                    <td><input type="password" id="user_pass" name="user_pass" required></td>
                                </tr>
                                <tr>
                                    <td align="center"><a href="Login.jsp">regresar</a></td>
                                    <td align="center"><input type="submit" value="Registrarse"></td>
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