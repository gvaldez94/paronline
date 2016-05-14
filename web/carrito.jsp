<%-- 
    Document   : carrito
    Created on : 08-may-2016, 15:58:32
    Author     : Gabriel
--%>

<%@page import="java.util.List"%>
<%@page import="py.una.pol.par.models.Pedido"%>
<%@page import="py.una.pol.par.models.Carrito"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Consultar Carrito</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="/paronline/css/style.css">
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="mainL.jsp" %>
        <%} else {%>
            <%@ include file="main.jsp" %>    
        <%}%>
        <header>
            <h1>Carrito de Compras</h1>
        </header>
        <%
            Carrito c = (Carrito) request.getSession().getAttribute("carrito");
            if (c != null&&(c.getAll().size()>0)) {
                List<Pedido> pedidos = c.getAll();
        %>
        <section>
            <table>
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th colspan="2">Accion</th>
                </tr>
                <% for (Pedido p : pedidos) {
                %>
                <tr>
                    <td>
                        <%=p.getProducto().getDescripcion()%>
                    </td>
                    <td>
                        <%=p.getProducto().getPrecioUnit()%>
                    </td>
                    <td>
                        <%=p.getCantidad()%>
                    </td>
                    <td>
                        <form method="POST" action="/paronline/Carrito">
                            <input type="hidden" name="id" value="<%=p.getProducto().getId()%>"/>
                            <input type="submit" onclick="return confirm('Está seguro?')" value="Eliminar"/>
                        </form>
                    </td>
                </tr>
                <%
                    }%>    
            </table>
            <br/>
            <button type="button" onclick="location.href = '/paronline/RegistrarTransaccion.jsp'">Comprar</button>
            <button name="Volver" type="button" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button> 
            </section>
            <%} else { 
            %>
            <section>
            <table>
                <tr>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th colspan="2">Accion</th>
                </tr>
                <td colspan="4" style="background-color:#FFFFFF">
                    No tiene productos en su carrito
                </td>
            </table>
            <br/>

            <button type="button" name="Buscar Productos" onclick="location.href = '/paronline/index.jsp'">Buscar Productos</button>    
            </section>
            <% }
            %>
    </body>
</html>