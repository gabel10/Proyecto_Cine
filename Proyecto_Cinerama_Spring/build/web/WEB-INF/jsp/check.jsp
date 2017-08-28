<%-- 
    Document   : check
    Created on : 23-ago-2017, 23:34:01
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.codec.digest.DigestUtils;" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cinerama</title>
    </head>
    <body>
        <%
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            //String password = DigestUtils.md5Hex(request.getParameter("password"));
        %>
        <jsp:useBean id="miSesion" class="controllers.UsuarioController" scope="session">
            <jsp:setProperty name="miSesion" property="id" value="<%=usuario%>"/>
            <jsp:setProperty name="miSesion" property="password" value="<%=password%>"/>
        </jsp:useBean>
        <%
            if(miSesion.log_in()){
                HttpSession sesionOk = request.getSession();
                sesionOk.setAttribute("usuario", usuario);
                sesionOk.setAttribute("setLogin", "true");
                sesionOk.setMaxInactiveInterval(60);
        %>
        
        <% response.sendRedirect("menu_administrador.htm"); %>
        <% 
            }else{
        %>
        <% response.sendRedirect("login.htm"); %>
        <%
            }
        %>
    </body>
</html>
