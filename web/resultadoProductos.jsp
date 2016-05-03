<%-- 
    Document   : resultadoProductos
    Created on : 26-abr-2016, 1:21:13
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="py.una.pol.par.models.Producto"%>
<%@page import="py.una.pol.par.models.Stock" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resultados de la búsqueda</title>
        <script type="text/javascript" src="../js/validacion.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
        <%}%>
        <br/>
        <%
            ArrayList<Producto> productos = (ArrayList<Producto>) request.getSession().getAttribute("productos");
        %>
        <div style="max-width: 750px">
            <h1>Productos</h1>
            <%if (productos.size() > 0) {%>
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
                    for (Producto prod : productos) {
                        cont++;
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
                        <form method="POST" action="/paronline/Buscar">
                        </form>
                    </td>

                </tr>

                <%
                    }
                %>
            </table>        
            <br/>
            <button type="button" name="Ir a la pantalla principal" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button>    
        </div>
        <%} else {%>
        <div>
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
        </div>
        <%
            }
        %>
    </body>
</html>
