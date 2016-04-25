<%-- 
    Document   : cambiarPass
    Created on : 25-abr-2016, 16:47:43
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/validacion.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String cambio = (String) request.getAttribute("cambio");
            if (cambio != null) {
        %>
        <div>
            <%
                out.print(cambio);
            %>
        </div>
        <%
            }
        %>
        <div>
            <h1>ParOnline</h1>
            <form id="changePass" action="/paronline/Sesion" method="POST">
                Contraseña Actual:<input type="password" name="actual" onfocusout="validarPassLogin()" onkeyup="activarCambio()"><br>
                Contraseña Nueva:<input type="password" name="nueva"  onfocusout="validarPassLogin()" onkeyup="activarCambio()"><p id="passMsg"></p><br>
                <input type="hidden" name="modo" value="C">
                <input id="submitChangePass" type="submit" value="Cambiar" name="cambiar" disabled="true"> 
            </form>
        </div>
    </body>
</html>
