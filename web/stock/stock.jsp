<%-- 
    Document   : stock
    Created on : 03-may-2016, 1:04:18
    Author     : Gabriel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="py.una.pol.par.models.Stock"%>
<%@page import="py.una.pol.par.dao.StockDao"%>
<%@page import="py.una.pol.par.models.Producto"%>
<%@page import="py.una.pol.par.dao.ProductoDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carga de Stock</title>
    </head>
    <body>
        <%
            String modo = (String) request.getAttribute("modo");
            if ("L".equals(modo)) {
                ArrayList<Stock> stocks = (ArrayList<Stock>) request.getAttribute("stocks");
                if (stocks.size() > 0) {
        %>
        <%-- <div > --%>
            <%if (request.getSession().getAttribute("usuario")!=null){%>
                <%@ include file="../mainL.jsp" %>
            <%}else {%>
                <%@ include file="../main.jsp" %>    
            <%}%>
            <section>
                <table>
                    <tr>
                        <th>Id</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th colspan="2">Accion</th>
                    </tr>
                    <%
                        for (Stock stock : stocks) {
                    %>
                    <tr>
                        <td>
                            <%=stock.getId()%>
                        </td>
                        <td>
                            <%=stock.getProducto().getDescripcion()%>
                        </td>
                        <td>
                            <%=stock.getCantidad()%>
                        </td>
                        <td>
                            <form method="POST" action="/paronline/StockController">
                                <input type="hidden" name="id" value="<%=stock.getId()%>"/>
                                <input type="hidden" name="modo" value="ED"/>
                                <input type="submit" style="border-radius: 0px" value="Editar"/>
                            </form>
                        </td>
                        <td>
                            <form method="POST" action="/paronline/StockController">
                                <input type="hidden" name="id" value="<%=stock.getId()%>"/>
                                <input type="hidden" name="modo" value="EL"/>
                                <input type="submit" style="border-radius: 0px" onclick="return confirm('Está seguro?')" value="Eliminar"/>
                            </form>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <form method="POST" action="/paronline/StockController">
                    <input type="hidden" name="modo" value="NW"/>
                    <br/>
                    <input type="submit" style="width:49%; display: inline" value="Agregar"/>
                    <button type="button" style="width:49%; display: inline" name="Volver" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button>    
                </form>
            </section>
            <%
            } else {
            %>            
            <header>
                <h1>Stock</h1>
            </header>
            <nav>
                <!-- add menu here -->
            </nav>
            <section>
                <table style="margin: 0 auto">
                    <tr>
                        <th>Id</th>
                        <th>Producto</th>
                        <th>Cantidad</th>
                        <th colspan="2">Accion</th>
                    </tr>
                    <tr>
                        <td colspan="7">No hay stock</td>
                    </tr>
                </table>
                <form method="POST" action="/paronline/StockController">
                    <input type="hidden" name="modo" value="NW"/>
                    <br/>
                    <input style="width:49%; display: inline" type="submit" value="Agregar"/>
                </form>
            </section>
            <% }
                }
            %>
        <%-- </div> --%>
    </body>
</html>