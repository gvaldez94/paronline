<%-- 
    Document   : cambiarPass
    Created on : 25-abr-2016, 16:47:43
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cambiar password</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="/paronline/css/style.css"/>
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Cambiar contraseña</h1>
        </header>
        <section>
            <%
                String cambio = (String) request.getAttribute("cambio");
                if (cambio != null) {
            %>

                <p class="alertMsg">
                    <%
                        out.print(cambio);
                    %>
                </p>
            <%
                }
            %>
            <form id="changePasswd" action="/paronline/Sesion" method="POST">
                <fieldset>
                    Contraseña Actual:<br/>
                    <input type="password" name="actual" onfocusout="validarPasswdChange()" oninput="activarCambio()" autofocus><br/><br/>
                    Contraseña Nueva:<br/>
                    <input type="password" name="nueva" onfocusout="validarPasswdChange()" oninput="activarCambio()"><p id="passwdMsg" class="warningMsg"></p><br>
                    <input type="hidden" name="modo" value="C">
                    <input id="submitChangePasswd" type="submit" value="Cambiar" name="cambiar" disabled="true">
                </fieldset>
            </form>
        </section>
    </body>
</html>
