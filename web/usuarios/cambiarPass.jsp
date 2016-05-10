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
        <title>Cambiar pass</title>
        <script type="text/javascript" src="../js/validacion.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario")!=null){%>
            <%@ include file="../mainL.jsp" %>
        <%}else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
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
        <section>
            <form id="changePasswd" action="/paronline/Sesion" method="POST">
                Contraseña Actual:<br/>
                <input type="password" name="actual" onfocusout="validarPasswdLogin()" onkeyup="activarCambio()"><br>
                Contraseña Nueva:<br/>
                <input type="password" name="nueva"  onfocusout="validarPasswdLogin()" onkeyup="activarCambio()"><p id="passwdMsg"></p><br>
                <input type="hidden" name="modo" value="C">
                <input id="submitChangePasswd" type="submit" value="Cambiar" name="cambiar" disabled="true"> 
            </form>
        </section>
    </body>
</html>
