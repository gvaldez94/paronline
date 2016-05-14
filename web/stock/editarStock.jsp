<%-- 
    Document   : editarStock
    Created on : 03-may-2016, 16:26:10
    Author     : Gabriel
--%>

<%@page import="java.util.List"%>
<%@page import="py.una.pol.par.models.Producto"%>
<%@page import="py.una.pol.par.models.Unidad"%>
<%@page import="py.una.pol.par.dao.UnidadDao"%>
<%@page import="py.una.pol.par.dao.ProductoDao" %>
<%@page import="py.una.pol.par.models.Stock" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Stock</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validarProducto.js"></script>
        <link rel="stylesheet" href="/paronline/css/style.css">
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Editar stock</h1>
        </header>
        <section>
            <form id="formStock" method="POST" action="/paronline/StockController">
                <input type="hidden" name="modo" value="G"/>
                <input type="hidden" name="tipo" value="E"/>
                <%
                    Stock stock = (Stock) request.getSession().getAttribute("stock");
                %>
                Producto
                <select name="producto_id" >
                <%
                    ProductoDao c = new ProductoDao();
                    List<Producto> productos= c.getAll();
                    for (Producto prod : productos){
                %>    
                    <option value="<%=prod.getId()%>" <%if (prod.getId()==stock.getProductoId()) {%> selected<% ; }%>><%=prod.getDescripcion()%></option>
                    <% } %>
                </select>
                Cantidad
                <input id="cantidad" type="number" name="cantidad" onfocusout="validarCantidad()" onkeyup="activarStock()" value="<%=stock.getCantidad()%>"/><p id="cantMsg" class="warningMsg"></p><br/><br/>
                <input id="submitStock" type="submit" value="Guardar" disabled="true"/>
                <button type="button" name="Cancelar" onclick="location.href = '/paronline/StockController'">Cancelar</button>
            </form>
        </section>
    </body>
</html>
