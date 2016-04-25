<%-- 
    Document   : buscar
    Created on : 25-abr-2016, 15:05:13
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buscador de productos</title>
    </head>
    <body>
        <form action="Buscar" class="search">
            <input id="submit" name="producto" value="" type="submit">
            <label for="submit" class="submit"></label>
	
            <input type="search" name="Search" id="search" placeholder="Buscar producto">
        </form>
    </body>
</html>
