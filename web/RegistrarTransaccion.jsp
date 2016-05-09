<%-- 
    Document   : RegistrarTransaccion
    Created on : 09-may-2016, 15:10:21
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="/paronline/js/transaccion.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Transaccion</title>
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) { %>
        <form id="formTransaccion" action="/paronline/Compras/Comprar" >
            Direccion:<input type="text" id="direccion" name="direccion" onfocusout="validarDireccion()" onkeyup="activarRegistro()"><p id="direccionMsg" class="warningMsg"></p><br>
            Efectivo<input type="radio" name="tipo" value="0" onchange="document.getElementById('tarjeta').disabled = true">
            Tarjeta<input type="radio" name="tipo" value="1" onchange="document.getElementById('tarjeta').disabled = false"><br/>
            <br/>
            Nro Tarjeta: <input type="text" name="nroTarjeta" id="tarjeta" disabled="true"><br/>
            <br/>
            <input id="submitRegistro" type="submit" style="width:49%; display: inline" value="Registrar" disabled="true">
            <button type="button" style="width:49%; display: inline" name="Cancelar" onclick="location.href = '/paronline/index.jsp'">Cancelar</button>
        </form>
        <%} else {
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                if (rd != null) {
                    request.getSession().setAttribute("url", "/RegistrarTransaccion.jsp");
                    rd.forward(request, response);
                }
            }
        %>
    </body>
</html>
