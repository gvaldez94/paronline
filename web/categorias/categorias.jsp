<%-- 
    Document   : categorias
    Created on : 27-abr-2016, 20:31:28
    Author     : Gabriel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="py.una.pol.par.models.Categoria"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categorías</title>
    </head>
    <body>
        <%
            String modo = (String) request.getAttribute("modo");
            if ("L".equals(modo)) {
                ArrayList<Categoria> categ = (ArrayList<Categoria>) request.getAttribute("categorias");
                if (categ.size() > 0) {
        %>
        <header>
            <h1>Categorías</h1>
        </header>
        <nav>
            <!-- add menu here -->
        </nav>
        <section>
            <table style="margin: 0 auto">
                <tr>
                    <th>Id</th>
                    <th>Descripcion</th>
                    <th colspan="2">Accion</th>
                </tr>
                <%
                    for (Categoria cat : categ) {
                %>
                <tr>
                    <td>
                        <%=cat.getId()%>
                    </td>
                    <td>
                        <%=cat.getDescripcion()%>
                    </td>
                    <td>
                        <form method="POST" action="/paronline/Categorias">
                            <input type="hidden" name="id" value="<%=cat.getId()%>"/>
                            <input type="hidden" name="modo" value="ED"/>
                            <input type="submit" style="border-radius: 0px" value="Editar"/>
                        </form>
                    </td>
                    <td>
                        <form method="POST" action="/paronline/Categorias">
                            <input type="hidden" name="id" value="<%=cat.getId()%>"/>
                            <input type="hidden" name="modo" value="EL"/>
                            <input type="submit" style="border-radius: 0px" onclick="return confirm('Está seguro?')" value="Eliminar"/>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <form method="POST" action="/paronline/Categorias">
                <input type="hidden" name="modo" value="NW"/>
                <br/>
                <input style="width:49%; display: inline" type="submit" value="Agregar"/>
                <button style="width:49%; display: inline" type="button" name="Volver" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button>    
            </form>
        </section>
        <%
            } else {
        %>    
        <header>
            <h1>Categorías</h1>
        </header>
        <nav>
            <!-- add menu here -->
        </nav>
        <section>
            <table style="margin: 0 auto">
                <tr>
                    <th>Id</th>
                    <th>Descripcion</th>
                    <th colspan="2">Accion</th>
                </tr>
                <tr>
                    <td colspan="4">No hay categorías</td>
                </tr>
            </table>
            <form method="POST" action="/paronline/Categorias">
                <input type="hidden" name="modo" value="NW"/>
                <br/>
                <input style="width:49%; display: inline" type="submit" value="Agregar"/>
            </form>
        </section>
        <%
                }
            }
        %>
    </body>
</html>