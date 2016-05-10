<%-- 
    Document   : login
    Created on : 25-abr-2016, 15:10:31
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@page import="py.una.pol.par.models.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script type="text/javascript" src="js/validacion.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body onload="activarLogIn()">
        <%if (request.getSession().getAttribute("usuario")!=null){%>
            <%@ include file="../mainL.jsp" %>
        <%}else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Login</h1>
        </header>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <section>
            <%
                out.print(error);
            %>
        </section>
        <%
            }
        %>
        <br/>
        <% Usuario u = (Usuario) request.getSession().getAttribute("usuario");
            if (u == null) {
        %>
        <nav>
            <!-- add menu here -->
        </nav>
        <section>
            <form id="formLogin" action="Login" method="POST">
              <fieldset>
                <legend>Credenciales de usuario</legend>
                Usuario:<br/>
                <input id="login_nameLogin" name="login_name" type="text" onfocusout="validarLogin_nameLogin()" onkeyup="activarLogIn()"><p id="login_nameLoginMsg"></p><br>
                Contraseña:<br/>
                <input id="passwdLogin" name="passwd" type="password" onfocusout="validarPasswdLogin()" onkeyup="activarLogIn()"><p id="passwdLoginMsg"></p><br>
                <input type="hidden" name="modo" value="login">
                <input id="submitLogin" type="submit" value="LogIn" disabled="true">
              </fieldset>
            </form>

            <h1>Registro</h1>
            <form action="/paronline/usuarios/crearUsuario.jsp" method="POST" >
                <input id="submit" type="submit" value="Registrarme">
            </form>
            <%
                } else {
                    RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
                    if (rd != null) {
                        rd.forward(request, response);
                    }
                }
            %>
        </section>
    </body>
</html>
