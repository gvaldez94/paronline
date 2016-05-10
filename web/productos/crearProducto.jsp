<%-- 
    Document   : crearProducto
    Created on : 28-abr-2016, 23:38:48
    Author     : Gabriel
--%>

<%@page import="java.util.List"%>
<%@page import="py.una.pol.par.models.Categoria"%>
<%@page import="py.una.pol.par.dao.CategoriaDao"%>
<%@page import="py.una.pol.par.models.Unidad"%>
<%@page import="py.una.pol.par.dao.UnidadDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="/paronline/js/validarProducto.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Creación de Producto</title>
    </head>
    <body>
        <header>
            <h1>Nuevo Producto</h1>
        </header>
        <nav>
            <!-- add menu here -->
        </nav>
        <section>
            <form id="formProducto" method="POST" action="/paronline/Productos">
                <input type="hidden" name="modo" value="G"/>
                <input type="hidden" name="tipo" value="N"/>
                        Descripcion
                        <input id="descripcion" type="text" name="descripcion" onfocusout="validarDescripcion()" onkeyup="activarProducto()"/><p id="descMsg"></p><br/>
                        Categoria
                        <select name="categoria">
                        <%
                            CategoriaDao c = new CategoriaDao();
                            List<Categoria> categorias= c.getAll();
                            for (Categoria cat : categorias){
                        %>    
                            <option value="<%=cat.getId()%>"><%=cat.getDescripcion()%></option>
                            <% } %>
                        </select>
                        Precio Unitario
                        <input id="precio_unit" type="number" name="precio_unit" onfocusout="validarPrecioUnit()" onkeyup="activarProducto()" /><p id="precioUnitMsg"></p><br/>
                        Unidad de Medida
                        <select name="unidad_medida">
                        <%
                            UnidadDao u = new UnidadDao();
                            List<Unidad> unidades= u.getAll();
                            for (Unidad unidad : unidades){
                        %>    
                            <option value="<%=unidad.getId()%>"><%=unidad.getDescripcion()%></option>
                            <% } %>
                        </select>
                <br/>
                <input id="submitProducto" type="submit" style="width:49%; display: inline" value="Guardar" disabled="true"/>
                <button type="button" style="width:49%; display: inline" name="Cancelar" onclick="location.href = '/paronline/Productos'">Cancelar</button>
            </form>
        </section>
    </body>
</html>