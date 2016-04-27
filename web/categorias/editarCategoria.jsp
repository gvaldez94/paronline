<%-- 
    Document   : editarCategoria
    Created on : 27-abr-2016, 23:14:26
    Author     : Gabriel
--%>

<%@page import="py.una.pol.par.models.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <title>Modificación de Categoría</title>
    </head>
    <body>
        <form id="formCategoria" method="POST" action="/paronline/Categorias">
            <h1>Editar Categoría</h1>
            <%
                Categoria cat =(Categoria)request.getSession().getAttribute("categoria");
            %>
            <input type="hidden" name="modo" value="G"/>
            <input type="hidden" name="tipo" value="E"/>
                    Descripción
                    <input id="descripcion" name="descripcion" onfocusout="validarCategoria()" onkeyup="activarCatGuardar()" type="text" style="width: 96%" value="<%=cat.getDescripcion()%>" /><p id="categoriaDescMsg"></p><br>
                
            <br/>
            <input id="submitCategoria" type="submit" style="width:49%; display: inline" value="Guardar" disabled="true"/>
            <button type="button" style="width:49%; display: inline" name="Cancelar" onclick="location.href = '/paronline/Categorias'">Cancelar</button>
        </form>
        
    </body>
</html>

