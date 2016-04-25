<%-- 
    Document   : editarUsuario
    Created on : 25-abr-2016, 19:46:00
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="py.una.pol.par.models.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/validacion.js"></script>
        <title>Editar cuenta</title>
    </head>
    <body>
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
        <form id="formRegistro" action="/paronline/Usuarios" method="POST">
          <fieldset>
            <legend>Editar cuenta</legend>
            Nombre *:
            <input id="nombreRegistro" name="nombre" onfocusout="validarNombre()" onkeyup="activarRegistro()"><p id="nombreMsg"></p><br>
            Apellido *:
            <input id="apellidoRegistro" name="apellido" onfocusout="validarApellido()" onkeyup="activarRegistro()"><p id="apellidoMsg"></p><br>
            Nombre de usuario *:
            <input id="userRegistro" name="login_name" onfocusout="validarUser()" onkeyup="activarRegistro()"><p id="userMsg"></p><br>
            E-mail *:
            <input id="emailRegistro" name="email" type="email" onfocusout="validarEmail()" onkeyup="activarRegistro()"><p id="emailMsg"></p><br>
            Contraseña *:
            <input id="passRegistro" name="passwd" type="password" onfocusout="validarPass()" onkeyup="activarRegistro()"><p id="passMsg"></p><br>
            Contraseña (verificación) *:
            <input id="pass_verRegistro" name="pass_ver" type="password" onfocusout="validarPass_ver()" onkeyup="activarRegistro()"><p id="pass_verMsg"></p><br>
            <input type="hidden" name="modo" value="G">
            <input type="hidden" name="tipo" value="E">
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
