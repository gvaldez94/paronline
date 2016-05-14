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
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <link rel="stylesheet" type="text/css" href="/paronline/css/style.css"/>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
    </head>
    <body onload="activarLogIn()">
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Login</h1>
        </header>
        <section>
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <p class="alertMsg">
            <%
                out.print(error);
            %>
        </p>
        <%
            }
        %>
        <br/>
        <% Usuario u = (Usuario) request.getSession().getAttribute("usuario");
            if (u == null) {
        %>
            <form id="formLogin" action="Login" method="POST">
                <fieldset>
                    <legend>Credenciales de usuario</legend>
                    Usuario:<br/>
                    <input id="login_nameLogin" name="login_name" type="text" onfocusout="validarLogin_nameLogin()" oninput="activarLogIn()" autofocus><p id="login_nameLoginMsg"></p><br>
                    Contraseña:<br/>
                    <input id="passwdLogin" name="passwd" type="password" onfocusout="validarPasswdLogin()" oninput="activarLogIn()"><p id="passwdLoginMsg"></p><br>
                    <input type="hidden" name="modo" value="login">
                    <input id="submitLogin" type="submit" value="LogIn" disabled="true">
                </fieldset>
            </form>

            <h2>Registro</h2>
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
