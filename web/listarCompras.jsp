<%-- 
    Document   : listarCompras
    Created on : 09-may-2016, 15:18:21
    Author     : Gabriel
--%>

<%@page import="py.una.pol.par.models.Usuario"%>
<%@page import="py.una.pol.par.models.TransaccionesDet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="py.una.pol.par.models.Compra"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Compras</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/paronline/css/style.css">
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="mainL.jsp" %>
        <%} else {%>
            <%@ include file="main.jsp" %>    
        <%}%>
        <section>
            <% Usuario u = (Usuario)request.getSession().getAttribute("usuario"); 
               if (u==null){
                RequestDispatcher rd = request.getRequestDispatcher("/paronline/login.jsp");
                if (rd!= null){
                    rd.forward(request, response);
                }
               }
            %>
            <h1> Compras - <%  out.print(u.getNombre()+" "+u.getApellido());%></h1>
            <%
                List<Compra> compras = (ArrayList<Compra>) request.getSession().getAttribute("compras");
                if (compras.size() > 0) {
                    for (Compra c : compras) {

            %>
            <br/>
            <label>Fecha: <%=c.getCab().getFecha()%></label>
            <label>Total: <%=c.getCab().getTotal()%></label>
            <label>Medio Pago: <% if (c.getCab().getMedioPago()==0){%> Efectivo <%}else {%> Tarjeta <%}%></label>
            <%if (c.getCab().getMedioPago()==1){%><label>Nro Tarjeta: <%=c.getCab().getNroTarjeta()%></label><%}%><br/>
            <table>
                <tr>
                    <th>Item</th>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Subtotal</th>
                </tr>
                <%
                    for (TransaccionesDet det : c.getDetalles()) {
                %>
                <tr>
                    <td> <%=det.getItem()%></td>
                    <td> <%=det.getProductos().getDescripcion()%></td>
                    <td> <%=det.getPrecio()%></td>
                    <td> <%=det.getCantidad()%></td>
                    <td> <%=det.getSubtotal()%></td>
                </tr>    
                <%
                    }
                %>
            </table>
            <%
                }
            %>
            <br/>
            <button type="button" name="Volver" onclick="location.href = '/paronline/index.jsp'">Volver</button>    
        <%} else {
        %>
            <table>
                <tr>
                    <th>Item</th>
                    <th>Producto</th>
                    <th>Precio</th>
                    <th>Cantidad</th>
                    <th>Subtotal</th>
                </tr>
                <td colspan="5">No se encontró registro de compras</td>
            </table>
            <br/>
            <button type="button" name="Volver" onclick="location.href = '/paronline/index.jsp'">Volver</button>    
        <%
            }
        %>
        <br/><br/>
        </section>
    </body>
</html>
