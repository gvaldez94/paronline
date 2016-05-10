<%-- 
    Document   : buscar
    Created on : 25-abr-2016, 15:05:13
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="py.una.pol.par.models.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="py.una.pol.par.dao.CategoriaDao"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscador de productos</title>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/style.css"/>
        <link rel="stylesheet" href="css/search.css">
    </head>
    <body>
        <section>
            <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%}%>
            <form action="/paronline/Buscar">
                <input type="hidden" name="modo" value="B">
                Producto:<input type="search" name="descripcion">
                Categoria<select name="categoria">
                        <option value=0>----Seleccione----</option>

                        <%
                            CategoriaDao c = new CategoriaDao();
                            List<Categoria> categorias = c.getAll();
                            for (Categoria cat : categorias) {
                        %>    
                        <option value="<%=cat.getId()%>"><%=cat.getDescripcion()%></option>
                        <% }%>
                    </select>
                <br/>
                <input type="submit" value="Buscar" style="width:48%; display: inline"> 
                <button type="button" name="Consultar Carrito" onclick="location.href = '/paronline/carrito.jsp'">Consultar Carrito</button>
            </form>
        </section>
    </body>
</html>
