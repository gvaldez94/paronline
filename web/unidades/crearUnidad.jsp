<%-- 
    Document   : crearUnidad
    Created on : 03-may-2016, 20:47:12
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <title>Creación de Unidad</title>
    </head>
    <body>
        <form id="formUnidad" method="POST" action="/paronline/Unidades">
            <h1>Nueva Unidad</h1>
            <input type="hidden" name="modo" value="G"/>
            <input type="hidden" name="tipo" value="N"/>
                    Descripcion
                    <input id="descripcion" name="descripcion" onfocusout="validarUnidad()" onkeyup="activarUniGuardar()"><p id="unidadDescMsg"></p><br>
                    <input id="submitUnidad" type="submit" style="width:49%; display: inline" value="Guardar" disabled="true"/>
            <button type="button" style="width:49%; display: inline" name="Cancelar" onclick="location.href = '/paronline/Unidades'">Cancelar</button>
        </form>
    </body>
</html>