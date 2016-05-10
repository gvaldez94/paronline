<%-- 
    Document   : crearCategoria
    Created on : 27-abr-2016, 20:40:41
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="/paronline/js/validacion.js"></script>
        <title>Creación de Categoría</title>
    </head>
    <body>
        <header>
            <h1>Nueva Categoría</h1>
        </header>
        <nav>
            <!-- add menu here -->
        </nav>
        <section>
            <form id="formCategoria" method="POST" action="/paronline/Categorias">            
                <input type="hidden" name="modo" value="G"/>
                <input type="hidden" name="tipo" value="N"/>
                        Descripcion
                        <input id="descripcion" name="descripcion" onfocusout="validarCategoria()" onkeyup="activarCatGuardar()"><p id="categoriaDescMsg"></p><br>
                        <input id="submitCategoria" type="submit" style="width:49%; display: inline" value="Guardar" disabled="true"/>
                <button type="button" style="width:49%; display: inline" name="Cancelar" onclick="location.href = '/paronline/Categorias'">Cancelar</button>
            </form>
        </section>
    </body>
</html>