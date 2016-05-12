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
        <%@ include file="buscar.jsp" %>
    </body>
</html>
