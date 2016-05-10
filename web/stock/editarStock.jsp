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
        <script type="text/javascript" src="/paronline/js/validarProducto.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Stock</title>
    </head>
    <body>
        <header>
            <h1>Editar Stock</h1>
        </header>
        <nav>
            <!-- add menu here -->
        </nav>
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
                        <input id="cantidad" type="number" name="cantidad" onfocusout="validarCantidad()" onkeyup="activarStock()" value="<%=stock.getCantidad()%>" /><p id="cantMsg"></p><br/>

                <br/>
                <input id="submitStock" type="submit" style="width:49%; display: inline" value="Guardar" disabled="true"/>
                <button type="button" style="width:49%; display: inline" name="Cancelar" onclick="location.href = '/paronline/StockController'">Cancelar</button>
            </form>
        </section>
    </body>
</html>
