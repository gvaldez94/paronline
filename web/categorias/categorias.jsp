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
        <title>Categorías</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/paronline/css/style.css">
    </head>
    <body>
        <%
            String modo = (String) request.getAttribute("modo");
            if ("L".equals(modo)) {
                ArrayList<Categoria> categ = (ArrayList<Categoria>) request.getAttribute("categorias");
                if (categ.size() > 0) {
        %>
        <%if (request.getSession().getAttribute("usuario")!=null){%>
            <%@ include file="../mainL.jsp" %>
        <%}else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Categorías</h1>
        </header>
        <section>
            <table>
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
                            <input type="submit" value="Editar"/>
                        </form>
                    </td>
                    <td>
                        <form method="POST" action="/paronline/Categorias">
                            <input type="hidden" name="id" value="<%=cat.getId()%>"/>
                            <input type="hidden" name="modo" value="EL"/>
                            <input type="submit" onclick="return confirm('Está seguro?')" value="Eliminar"/>
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
                <input type="submit" value="Agregar"/>
                <button type="button" name="Volver" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button>    
            </form>
        </section>
        <%
            } else {
        %>    
        <header>
            <h1>Categorías</h1>
        </header>
        <section>
            <table>
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
                <input type="submit" value="Agregar"/>
            </form>
        </section>
        <%
                }
            }
        %>
    </body>
</html>