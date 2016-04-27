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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/validacion.js"></script>
        <title>Crear cuenta</title>
    </head>
    <body onload="activarRegistro()">
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
        <div>
            <%
                out.print(error);
            %>
        </div>
        <%
            }
        %>
        <br/>
        <% Usuario u = (Usuario) request.getSession().getAttribute("usuario");
            if (u == null) {
        %>
        <h1>Registro</h1>
        <form id="formRegistro" action="/paronline/Usuarios" method="POST">
          <fieldset>
            <legend>Nuevo usuario</legend>
            Nombre *:
            <input id="nombreRegistro" name="nombre" onfocusout="validarNombre()" onkeyup="activarRegistro()"><p id="nombreMsg"></p><br>
            Apellido *:
            <input id="apellidoRegistro" name="apellido" onfocusout="validarApellido()" onkeyup="activarRegistro()"><p id="apellidoMsg"></p><br>
            Nombre de usuario *:
            <input id="login_nameRegistro" name="login_name" onfocusout="validarLogin_name()" onkeyup="activarRegistro()"><p id="login_nameMsg"></p><br>
            E-mail *:
            <input id="emailRegistro" name="email" type="email" onfocusout="validarEmail()" onkeyup="activarRegistro()"><p id="emailMsg"></p><br>
            Contraseña *:
            <input id="passwdRegistro" name="passwd" type="password" onfocusout="validarPasswd()" onkeyup="activarRegistro()"><p id="passwdMsg"></p><br>
            Contraseña (verificación) *:
            <input id="passwd_verRegistro" name="passwd_ver" type="password" onfocusout="validarPasswd_ver()" onkeyup="activarRegistro()"><p id="passwd_verMsg"></p><br>
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
    </body>
</html>
