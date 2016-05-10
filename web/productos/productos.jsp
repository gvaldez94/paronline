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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM de Productos</title>
    </head>
    <body style="max-width: 610px">
        <%
            String modo = (String) request.getAttribute("modo");
            if ("L".equals(modo)) {
                ArrayList<Producto> productos = (ArrayList<Producto>) request.getAttribute("productos");
                if (productos.size() > 0) {
        %>
        <header>
            <h1>Productos</h1>
        </header>
        <nav>
            <!-- add menu here -->
        </nav>
        <%-- <div > --%>
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
                            <input type="submit" style="border-radius: 0px" value="Editar"/>
                        </form>
                    </td>
                    <td>
                        <form method="POST" action="/paronline/Productos">
                            <input type="hidden" name="id" value="<%=prod.getId()%>"/>
                            <input type="hidden" name="modo" value="EL"/>
                            <input type="submit" style="border-radius: 0px" onclick="return confirm('Está seguro?')" value="Eliminar"/>
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
                <input type="submit" style="width:49%; display: inline" value="Agregar"/>
                <button type="button" style="width:49%; display: inline" name="Volver" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button>    
            </form>
        </section>
        <%
        } else {
        %>  
        <header>
            <h1>Productos</h1>
        </header>
        <nav>
            <!-- add menu here -->
        </nav>
        <section>
            <table style="margin: 0 auto">
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
                <input style="width:49%; display: inline" type="submit" value="Agregar"/>
            </form>
        </section>
        <% }
            }
        %>
        <%-- </div> --%>
    </body>
</html>
