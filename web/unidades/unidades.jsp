<%-- 
    Document   : unidades
    Created on : 03-may-2016, 20:46:48
    Author     : Gabriel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="py.una.pol.par.models.Unidad"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Categorías</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    </head>
    <body>
        <%
            String modo = (String) request.getAttribute("modo");
            if ("L".equals(modo)) {
                ArrayList<Unidad> unidades = (ArrayList<Unidad>) request.getAttribute("unidades");
                if (unidades.size() > 0) {
        %>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Unidades</h1>
        </header>
        <section>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Descripcion</th>
                    <th colspan="2">Accion</th>
                </tr>
                <%
                    for (Unidad uni : unidades) {
                %>
                <tr>
                    <td>
                        <%=uni.getId()%>
                    </td>
                    <td>
                        <%=uni.getDescripcion()%>
                    </td>
                    <td>
                        <form method="POST" action="/paronline/Unidades">
                            <input type="hidden" name="id" value="<%=uni.getId()%>"/>
                            <input type="hidden" name="modo" value="ED"/>
                            <input type="submit" value="Editar"/>
                        </form>
                    </td>
                    <td>
                        <form method="POST" action="/paronline/Unidades">
                            <input type="hidden" name="id" value="<%=uni.getId()%>"/>
                            <input type="hidden" name="modo" value="EL"/>
                            <input type="submit" onclick="return confirm('Está seguro?')" value="Eliminar"/>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <form method="POST" action="/paronline/Unidades">
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
            <form method="POST" action="/paronline/Unidades">
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