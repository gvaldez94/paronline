<%-- 
    Document   : productos
    Created on : 28-abr-2016, 23:34:35
    Author     : Gabriel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="py.una.pol.par.models.Producto"%>
<%@page import="py.una.pol.par.models.Categoria"%>
<%@page import="py.una.pol.par.dao.ProductoDao"%>
<%@page import="py.una.pol.par.dao.CategoriaDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>ABM de Productos</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/paronline/css/style.css">
    </head>
    <body>
        <%
            String modo = (String) request.getAttribute("modo");
            if ("L".equals(modo)) {
                ArrayList<Producto> productos = (ArrayList<Producto>) request.getAttribute("productos");
                if (productos.size() > 0) {
        %>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Productos</h1>
        </header>
        <section>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Descripcion</th>
                    <th>Categoria</th>
                    <th>Precio Unitario</th>
                    <th colspan="2">Accion</th>
                </tr>
                <%
                    for (Producto prod : productos) {
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
                        <form method="POST" action="/paronline/Productos">
                            <input type="hidden" name="id" value="<%=prod.getId()%>"/>
                            <input type="hidden" name="modo" value="ED"/>
                            <input type="submit" value="Editar"/>
                        </form>
                    </td>
                    <td>
                        <form method="POST" action="/paronline/Productos">
                            <input type="hidden" name="id" value="<%=prod.getId()%>"/>
                            <input type="hidden" name="modo" value="EL"/>
                            <input type="submit" onclick="return confirm('Está seguro?')" value="Eliminar"/>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <form method="POST" action="/paronline/Productos">
                <input type="hidden" name="modo" value="NW"/>
                <br/>
                <input type="submit" value="Agregar"/>
                <button type="button" name="Volver" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button>    
            </form>
        </section>
        <%
        } else {
        %>  
        <header>
            <h1>Productos</h1>
        </header>
        <section>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Descripcion</th>
                    <th>Categoria</th>
                    <th>Precio Unitario</th>
                    <th colspan="2">Accion</th>
                </tr>
                <tr>
                    <td colspan="7">No hay productos</td>
                </tr>
            </table>
            <form method="POST" action="/paronline/Productos">
                <input type="hidden" name="modo" value="NW"/>
                <br/>
                <input type="submit" value="Agregar"/>
            </form>
        </section>
        <% }
            }
        %>
    </body>
</html>
