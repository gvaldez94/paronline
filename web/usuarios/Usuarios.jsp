<%-- 
    Document   : Usuarios
    Created on : 25-abr-2016, 19:45:34
    Author     : Gabriel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="py.una.pol.par.models.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ABM de usuarios</title>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario")!=null){%>
            <%@ include file="../mainL.jsp" %>
        <%}else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Usuarios</h1>
        </header>
        <%
            String modo = (String) request.getAttribute("modo");
            if ("L".equals(modo)) {
                ArrayList<Usuario> users = (ArrayList<Usuario>) request.getAttribute("usuarios");
        %>
        <section>
            <table>
                <tr>
                    <th>Id</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Login name</th>
                    <th colspan="2">Accion</th>
                </tr>
                <%
                    for (Usuario usr : users) {
                %>
                <tr>
                    <td>
                        <%=usr.getId()%>
                    </td>
                    <td>
                        <%=usr.getNombre()%>
                    </td>
                    <td>
                        <%=usr.getApellido()%>
                    </td>
                    <td>
                        <%=usr.getLoginName()%>
                    </td>
                    <td>
                        <form method="POST" action="/paronline/Usuarios">
                            <input type="hidden" name="id" value="<%=usr.getId()%>"/>
                            <input type="hidden" name="modo" value="EL"/>
                            <input type="submit" style="border-radius: 0px" onclick="return confirm('Está seguro?')" value="Eliminar"/>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <form method="POST" action="/paronline/Usuarios">
                <button type="button" style="width:49%; margin: 0 auto; display: inline" name="Volver" onclick="location.href = '/paronline/index.jsp'">Pantalla Principal</button>
            </form>
            <%
                }
            %>
            <br/>
        </section>
    </body>
</html>
