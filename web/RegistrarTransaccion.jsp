<%-- 
    Document   : RegistrarTransaccion
    Created on : 09-may-2016, 15:10:21
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrar Transaccion</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/transaccion.js"></script>
        <link rel="stylesheet" href="/paronline/css/style.css">
        
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="mainL.jsp" %>
        <%} else {%>
            <%@ include file="main.jsp" %>    
        <%}%>
        <header>
            <h1>Registrar Transacción</h1>
        </header>
        <section>
            <%if (request.getSession().getAttribute("usuario") != null) { %>
            <form id="formTransaccion" action="/paronline/Compras/Comprar" method="POST">
                Direccion:
                <input type="text" id="direccion" name="direccion" onfocusout="validarDireccion()" oninput="activarRegistro()" autofocus><p id="direccionMsg" class="warningMsg"></p><br>
                Efectivo
                <input type="radio" name="tipo" value="0" onchange="document.getElementById('tarjeta').disabled = true; activarRegistro()" checked="true">
                Tarjeta
                <input type="radio" name="tipo" value="1" onchange="document.getElementById('tarjeta').disabled = false; activarRegistro()"><br/>
                <br/>
                Nro Tarjeta:
                <input type="text" name="nroTarjeta" id="tarjeta" disabled="true" oninput="activarRegistro()"><br/>
                <br/>
                <input id="submitRegistro" type="submit" value="Registrar" disabled="true">
                <button type="button" name="Cancelar" onclick="location.href = '/paronline/index.jsp'">Cancelar</button>
            </form>
            <%} else {
                    RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                    if (rd != null) {
                        request.getSession().setAttribute("url", "/RegistrarTransaccion.jsp");
                        rd.forward(request, response);
                    }
                }
            %>
        </section>
    </body>
</html>
