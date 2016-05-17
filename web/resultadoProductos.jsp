<%-- 
    Document   : resultadoProductos
    Created on : 26-abr-2016, 1:21:13
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="py.una.pol.par.models.Producto"%>
<%@page import="py.una.pol.par.models.Stock" %>
<%@page import="py.una.pol.par.dao.StockDao" %>
<%@page import="py.una.pol.par.models.Unidad" %>
<%@page import="py.una.pol.par.dao.UnidadDao" %>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Resultados de la búsqueda</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="/paronline/css/style.css"/>
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
        <%}%>
        <%
            ArrayList<Stock> stockList = (ArrayList<Stock>) request.getSession().getAttribute("stockList");
            ArrayList<Producto> productos = (ArrayList<Producto>) request.getSession().getAttribute("productos");
        %>
        <div>
            <%if (request.getSession().getAttribute("usuario")!=null){%>
                <%@ include file="mainL.jsp" %>
            <%}else {%>
                <%@ include file="main.jsp" %>    
            <%}%>
            <header>
                <h1>Resultados</h1>
            </header>
            <%if ((productos.size() > 0) && (stockList.size() > 0)) {%>
            <section>
                <table>
                    <tr>
                        <th>Id</th>
                        <th>Descripcion</th>
                        <th>Categoria</th>
                        <th>Precio Unitario</th>
                        <th>Stock</th>
                        <th colspan="2">Accion</th>
                    </tr>
                    <%
                        int cont = 0;

                        Producto prod = new Producto();
                        for (Stock stock : stockList) {
                            cont++;
                            for (Producto producto : productos) {
                                if (producto.getId() == stock.getProductoId()) {
                                    prod = producto;
                                }
                            }
                    %>
                    <tr>
                        <td>
                            <%=prod.getId()%>
                        </td>
                        <td>
                            <%=prod.getDescripcion()%>
                        </td>
                        <td>
                            <%=prod.getCategorias().getDescripcion()%>
                        </td>
                        <td>
                            <%=prod.getPrecioUnit()%>
                        </td>
                        <td>
                            <%
                                if (prod.getId() == stock.getProductoId()) {
                                    Unidad unidad = new UnidadDao().consultar(prod.getUnidadMedida());
                            %>
                            <%=stock.getCantidad() + " " + unidad.getDescripcion()%>
                            <%
                                    }
                            %>
                        </td>
                        <td>
                            <form method="POST" action="/paronline/Buscar">
                                <input type="hidden" name="id" value="<%=prod.getId()%>"/>
                                <input type="hidden" name="stock" value="<%=stock.getId()%>">
                                <input type="hidden" id="cant<%=cont%>" value="<%=stock.getCantidad()%>"/>
                                Cantidad:<input type="number" name="cantidad" style="width: 35%" id="cantidad<%=cont%>" min="1" max="<%=stock.getCantidad()%>">
                                <input type="hidden" name="modo" value="C"/>
                                <input type="submit" style="display: inline" value="Agregar al carrito"/>
                            </form>
                        </td>
                        <%
                            }
                        %>
                    </tr>
                </table>
                <br/>
                <button type="button" name="Ir a la pantalla principal" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button>
            </section>
        </div>
        <%} else {%>
        <section>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Descripcion</th>
                    <th>Categoria</th>
                    <th>Precio Unitario</th>
                    <th>Stock</th>
                    <th colspan="2">Accion</th>
                </tr>
                <th colspan="6" style="background-color:#FFFFFF">No se encontraron productos</th>

            </table>
            <br/>
            <button type="button" name="Ir a la pantalla principal" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button>    
        </section>
        <%
            }
        %>
    </body>
</html>
