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
    </head>
    <body>
        <h1>Login</h1>
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
        <form id="formLogin" action="Login" method="POST">
          <fieldset>
            <legend>Credenciales de usuario</legend>
            Usuario:
            <input id="userLogin" name="login_name" onfocusout="validarUserLogin()" onkeyup="activarLogIn()"><p id="userLoginMsg"></p><br>
            Contraseña:
            <input id="passLogin" name="passwd" type="password" onfocusout="validarPassLogin()" onkeyup="activarLogIn()"><p id="passLoginMsg"></p><br>
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
    </body>
</html>
