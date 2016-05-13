<%-- 
    Document   : editarProducto
    Created on : 29-abr-2016, 3:27:53
    Author     : Gabriel
--%>

<%@page import="java.util.List"%>
<%@page import="py.una.pol.par.models.Categoria"%>
<%@page import="py.una.pol.par.dao.CategoriaDao"%>
<%@page import="py.una.pol.par.models.Unidad"%>
<%@page import="py.una.pol.par.dao.UnidadDao"%>
<%@page import="py.una.pol.par.models.Producto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Producto</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validarProducto.js"></script>
        <link rel="stylesheet" href="/paronline/css/style.css">
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="../mainL.jsp" %>
        <%} else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Editar producto</h1>
        </header>
        <section>
            <form id="formProducto" method="POST" action="/paronline/Productos">
                <input type="hidden" name="modo" value="G"/>
                <input type="hidden" name="tipo" value="E"/>
                <%
                    Producto prod = (Producto) request.getSession().getAttribute("producto");
                %>
                        Descripcion
                        <input id="descripcion" type="text" name="descripcion" onfocusout="validarDescripcion()" onkeyup="activarProducto()" value="<%=prod.getDescripcion()%>"/><p id="descMsg"></p><br/>
                        Categoria
                        <select name="categoria">
                        <%
                            CategoriaDao c = new CategoriaDao();
                            List<Categoria> categorias= c.getAll();
                            for (Categoria cat : categorias){
                        %>    
                            <option value="<%=cat.getId()%>" <%if (cat.getId()==prod.getCategorias().getId()) {%> selected<% ; }%>><%=cat.getDescripcion()%></option>
                            <% } %>
                        </select>
                        Precio Unitario
                        <input id="precio_unit" type="number" name="precio_unit" onfocusout="validarPrecioUnit()" onkeyup="activarProducto()" value="<%=prod.getPrecioUnit()%>" /><p id="precioUnitMsg"></p><br/>
                        Unidad de Medida
                        <select name="unidad_medida">
                        <%
                            UnidadDao u = new UnidadDao();
                            List<Unidad> unidades= u.getAll();
                            for (Unidad unidad : unidades){
                        %>    
                            <option value="<%=unidad.getId()%>" <%if (unidad.getId()==prod.getCategorias().getId()) { %> selected <%; }%>><%=unidad.getDescripcion()%></option>
                            <% } %>
                        </select>
                        
                <br/><br/>
                <input id="submitProducto" type="submit" value="Guardar" disabled="true"/>
                <button type="button" name="Cancelar" onclick="location.href = '/paronline/Productos'">Cancelar</button>
            </form>
        </section>
    </body>
</html>
