<%-- 
    Document   : editarUsuario
    Created on : 25-abr-2016, 19:46:00
    Author     : Gabriel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="py.una.pol.par.models.Usuario"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar cuenta</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../js/validacion.js"></script>
        <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="../css/style.css"/>
    </head>
    <body>
        <%if (request.getSession().getAttribute("usuario")!=null){%>
            <%@ include file="../mainL.jsp" %>
        <%}else {%>
            <%@ include file="../main.jsp" %>    
        <%}%>
        <header>
            <h1>Editar cuenta</h1>
        </header>
        <section>
            <%
                String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <div>
                <%
                    out.print(error);
                %>
            </div>
            <%
                }
            %>
            <br/>
            <% Usuario u = (Usuario) request.getSession().getAttribute("usuario");
            %>
            <form id="formEditarRegistro" action="/paronline/Usuarios" method="POST">
              <fieldset>
                <legend>Editar cuenta</legend>
                Nombre *:
                <input id="nombreRegistro" name="nombre" type="text" onfocusout="validarNombreE()" onkeyup="activarEditarRegistro()" value="<%=u.getNombre()%>"><p id="nombreMsg" class="warningMsg"></p><br>
                Apellido *:
                <input id="apellidoRegistro" name="apellido" type="text" onfocusout="validarApellidoE()" onkeyup="activarEditarRegistro()" value="<%=u.getApellido()%>"><p id="apellidoMsg" class="warningMsg"></p><br>
                E-mail *:
                <input id="emailRegistro" name="email" type="email" onfocusout="validarEmailE()" onkeyup="activarEditarRegistro()" value="<%=u.getEmail()%>"><p id="emailMsg" class="warningMsg"></p><br>
                <input type="hidden" name="login_name" value="<%=u.getLoginName()%>">
                <input type="hidden" name="passwd" value="<%=u.getPasswd()%>">
                <input type="hidden" name="tipoUsuario" value="<%=u.getTipoUsuario()%>">
                <input type="hidden" name="id" value="<%=u.getId()%>">
                <input type="hidden" name="modo" value="G">
                <input type="hidden" name="tipo" value="E">
                <input type="hidden" name="tipoUsuario" value="1">
                <input id="submitEditarRegistro" type="submit" value="Guardar cambios" disabled="true">
                <button type="button" style="display: inline" name="Cancelar" onclick="location.href = '/paronline/index.jsp'">Cancelar</button>
              </fieldset>
            </form>
        </section>
    </body>
</html>
