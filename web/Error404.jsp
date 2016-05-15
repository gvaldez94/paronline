<%-- 
    Document   : Error404
    Created on : 15-may-2016, 18:31:30
    Author     : Gabriel
--%>

<%@page import="py.una.pol.par.models.Usuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>PAR On Line</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="/paronline/css/style.css">
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario") != null) {%>
            <%@ include file="mainL.jsp" %>
        <%} else {%>
            <%@ include file="main.jsp" %>    
        <%}%>
        <br/>
        <header>
            <h1>La página o recurso solicitado no existe.</h1>
        </header>
    </body>
</html>