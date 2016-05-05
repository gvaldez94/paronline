<%-- 
    Document   : index
    Created on : Apr 9, 2016, 12:53:19 AM
    Author     : Gabriel
--%>

<%@page import="py.una.pol.par.models.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="/paronline/css/style.css" />
        <title>PAR On Line</title>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
    </head>
    <body>
        <%
            if (request.getSession().getAttribute("usuario") != null) {
        %>
        <div>
            <h1> ParOnline </h1>
                <a href="/paronline/buscar.jsp">Buscador de Productos</a>
                <%
                    Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                    if (usuario.getTipoUsuario() == 0) {%>
                <a href="/paronline/Usuarios">ABM Usuario</a>
                <a href="/paronline/Categorias">ABM Categorías</a>
                <a href="/paronline/Productos">ABM Productos</a>
                <a href="/paronline/StockController">ABM Stock</a>
                <a href="/paronline/Unidades">ABM Unidades</a>
                <%}%>
                <a href="/paronline/usuarios/cambiarPass.jsp">Cambiar Contraseña</a>
                <a href="/paronline/Sesion">Cerrar Sesión</a>
        </div>
        <%
        } else {
        %>
        <div>
            <h1> ParOnline </h1>
                <a href="/paronline/buscar.jsp">Buscador de Productos</a>
                <a href="/paronline/login.jsp">Login</a>
        </div>
        <% }%>
    </body>
</html>
