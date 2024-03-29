<%-- 
    Document   : crearCategoria
    Created on : 27-abr-2016, 20:40:41
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <link rel="stylesheet" href="/paronline/css/style.css">
        <title>Creación de Categoría</title>
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Nueva categoría</h1>
        </header>
        <section>
            <form id="formCategoria" method="POST" action="/paronline/Categorias">            
                <input type="hidden" name="modo" value="G"/>
                <input type="hidden" name="tipo" value="N"/>
                Descripcion
                <input id="descripcion" name="descripcion" type="text" onfocusout="validarCategoria()" onkeyup="activarCatGuardar()"><p id="categoriaDescMsg" class="warningMsg"></p><br>
                <input id="submitCategoria" type="submit" value="Guardar" disabled="true"/>
                <button type="button" name="Cancelar" onclick="location.href = '/paronline/Categorias'">Cancelar</button>
            </form>
        </section>
    </body>
</html>