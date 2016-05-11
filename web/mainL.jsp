<%-- 
    Document   : mainL
    Created on : 10-may-2016, 14:51:55
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="py.una.pol.par.models.Usuario" %>
<!DOCTYPE html>
<html>
    <head>
        <title>PAR On Line</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="/paronline/css/menu.css">
        <link rel="stylesheet" href="/paronline/css/style.css">
    </head>
    <body>
        <nav>
            <ul class="ul-navbar">
                <li class="li-navbar"><a href="/paronline/index.jsp">Inicio</a></li>
                <%
                    Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");
                    if (usuario.getTipoUsuario() == 0) {
                %>
                <li class="li-navbar"><a href="/paronline/Usuarios">ABM Usuarios</a></li>
                <li class="li-navbar"><a href="/paronline/Categorias">ABM Categorias</a></li>
                <li class="li-navbar"><a href="/paronline/Unidades">ABM Unidades</a></li>
                <li class="li-navbar"><a href="/paronline/Productos">ABM Productos</a></li>
                <li class="li-navbar"><a href="/paronline/StockController">ABM Stock</a></li>
                <%
                    }
                %>
                <li class="li-navbar"><a href="/paronline/Compras">Consultar compras</a></li>
                <li class="li-navbar"><a href="/paronline/usuarios/cambiarPass.jsp">Cambiar contraseña</a></li>
                <li class="li-navbar"><a href="#">Bienvenido, <%=usuario.getNombre()%></a></li>
                <li class="li-navbar" style="float: right"><a href="/paronline/Sesion">Cerrar Sesión</a></li>
            </ul>
        </nav>
    </body>
</html>
