<%-- 
    Document   : nuevoStock
    Created on : 02-may-2016, 22:35:47
    Author     : Gabriel
--%>

<%@page import="java.util.List"%>
<%@page import="py.una.pol.par.models.Producto"%>
<%@page import="py.una.pol.par.models.Unidad"%>
<%@page import="py.una.pol.par.dao.UnidadDao"%>
<%@page import="py.una.pol.par.dao.ProductoDao" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Nuevo Stock</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validarProducto.js"></script>
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <section>
            <form id="formStock" method="POST" action="/paronline/StockController">
                <input type="hidden" name="modo" value="G"/>
                <input type="hidden" name="tipo" value="N"/>
                        Producto
                        <select name="producto_id">
                        <%
                            ProductoDao c = new ProductoDao();
                            List<Producto> productos= c.getAll();
                            for (Producto prod : productos){
                        %>    
                            <option value="<%=prod.getId()%>"><%=prod.getDescripcion()%></option>
                            <% } %>
                        </select>
                        Cantidad
                        <input id="cantidad" type="number" name="cantidad" onfocusout="validarCantidad()" onkeyup="activarStock()" /><p id="cantMsg"></p><br/>

                <br/>
                <input id="submitStock" type="submit" style="width:49%; display: inline" value="Guardar" disabled="true"/>
                <button type="button" style="width:49%; display: inline" name="Cancelar" onclick="location.href = '/paronline/StockController'">Cancelar</button>
            </form>
        </section>
    </body>
</html>