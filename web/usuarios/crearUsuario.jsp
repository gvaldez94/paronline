<%-- 
    Document   : crearUsuario
    Created on : 25-abr-2016, 19:46:24
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="py.una.pol.par.models.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Crear cuenta</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="/paronline/css/style.css"/>
    </head>
    <body onload="activarRegistro()">
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Registro</h1>
        </header>
        <br/>
        <% Usuario u = (Usuario) request.getSession().getAttribute("usuario");
            if (u == null) {
        %>
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
            <form id="formRegistro" action="/paronline/Usuarios" method="POST">
              <fieldset>
                <legend>Nuevo usuario</legend>
                Nombre *:<br/>
                <input id="nombreRegistro" name="nombre" type="text" onfocusout="validarNombre()" oninput="activarRegistro()" autofocus><p id="nombreMsg" class="warningMsg"></p><br>
                Apellido *:<br/>
                <input id="apellidoRegistro" name="apellido" type="text" onfocusout="validarApellido()" oninput="activarRegistro()"><p id="apellidoMsg" class="warningMsg"></p><br>
                Nombre de usuario *:<br/>
                <input id="login_nameRegistro" name="login_name" type="text" onfocusout="validarLogin_name()" oninput="login_nameUnico(); activarRegistro()"><p id="login_nameMsg" class="warningMsg"></p><br>
                E-mail *:<br/>
                <input id="emailRegistro" name="email" type="email" onfocusout="validarEmail()" oninput="activarRegistro()"><p id="emailMsg" class="warningMsg"></p><br>
                Contraseña *:<br/>
                <input id="passwdRegistro" name="passwd" type="password" oninput="validarPasswd(); activarRegistro()"><p id="passwdMsg" class="warningMsg"></p><br>
                Contraseña (verificación) *:<br/>
                <input id="passwd_verRegistro" name="passwd_ver" type="password" oninput="validarPasswd_ver(); activarRegistro()"><p id="passwd_verMsg" class="warningMsg"></p><br>
                <input type="hidden" name="modo" value="G">
                <input type="hidden" name="tipo" value="N">
                <input type="hidden" name="tipoUsuario" value="1">
                <input id="submitRegistro" type="submit" value="Regístrame" disabled="true">
              </fieldset>
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
