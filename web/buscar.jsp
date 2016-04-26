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
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario")!=null){%>
        <%}%>
        <br/>
        <form action="/paronline/Buscar">
            <input type="hidden" name="modo" value="B">
            Producto:<input style="width: 35%;margin-right: 8px" type="search" name="descripcion">
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
            <button style="width: 48%;display: inline" type="button" name="Consultar Carrito" onclick="location.href = '/paronline/ConsultarCarrito.jsp'">Consultar Carrito</button>
        </form>
    </body>
</html>
