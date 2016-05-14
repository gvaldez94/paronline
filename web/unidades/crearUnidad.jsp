<%-- 
    Document   : crearUnidad
    Created on : 03-may-2016, 20:47:12
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Creación de Unidad</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <link rel="stylesheet" href="/paronline/css/style.css">
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Nueva unidad de medida</h1>
        </header>
        <section>
            <form id="formUnidad" method="POST" action="/paronline/Unidades">
                <input type="hidden" name="modo" value="G"/>
                <input type="hidden" name="tipo" value="N"/>
                Descripcion
                <input id="descripcion" type="text" name="descripcion" onfocusout="validarUnidad()" onkeyup="activarUniGuardar()"><p id="unidadDescMsg" class="warningMsg"></p><br>
                <input id="submitUnidad" type="submit" value="Guardar" disabled="true"/>
                <button type="button" name="Cancelar" onclick="location.href = '/paronline/Unidades'">Cancelar</button>
            </form>
        </section>
    </body>
</html>