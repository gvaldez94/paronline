<%-- 
    Document   : editarUnidad
    Created on : 03-may-2016, 20:47:20
    Author     : Gabriel
--%>

<%@page import="py.una.pol.par.models.Unidad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <title>Modificación de Unidad</title>
    </head>
    <body>
        <form id="formUnidad" method="POST" action="/paronline/Unidades">
            <h1>Editar Unidad</h1>
            <%
                Unidad unidad =(Unidad)request.getSession().getAttribute("unidad");
            %>
            <input type="hidden" name="modo" value="G"/>
            <input type="hidden" name="tipo" value="E"/>
                    Descripción
                    <input id="descripcion" name="descripcion" onfocusout="validarUnidad()" onkeyup="activarUniGuardar()" type="text" style="width: 96%" value="<%=unidad.getDescripcion()%>" /><p id="unidadDescMsg"></p><br>
                
            <br/>
            <input id="submitUnidad" type="submit" style="width:49%; display: inline" value="Guardar" disabled="true"/>
            <button type="button" style="width:49%; display: inline" name="Cancelar" onclick="location.href = '/paronline/Unidades'">Cancelar</button>
        </form>
        
    </body>
</html>