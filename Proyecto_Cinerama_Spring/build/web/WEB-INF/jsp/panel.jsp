<%-- 
    Document   : panel
    Created on : 06-sep-2017, 18:52:46
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%HttpSession sesion = request.getSession(true); %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Cinerama | Panel</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="keywords" content="cinerama, cine, peliculas, estrenos, peru">
        <link type="image/x-icon" rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/images/favicon.png">
        <script type="application/x-javascript">
            addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
            function hideURLbar() { window.scrollTo(0, 1); }
        </script>
        <link href="${pageContext.request.contextPath}/recursos/css/bootstrap.css" rel='stylesheet' type='text/css'>
        <link href="${pageContext.request.contextPath}/recursos/css/style.css" rel="stylesheet" type="text/css" media="all">
        <!-- start plugins -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/recursos/js/jquery-1.11.1.min.js"></script>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
        <script src="${pageContext.request.contextPath}/recursos/js/responsiveslides.min.js"></script>
        <script>
        $(function() {
            $("#slider").responsiveSlides({
                auto: true,
                nav: true,
                speed: 500,
                namespace: "callbacks",
                pager: true,
            });
        });
        </script>
    </head>
    <body>
        <div class="container">
            <div class="container_wrap">
                <jsp:include page="header_home.jsp"/>       
                <div id="contenido">
                    <div class="content">
                        <h2 align="center">Bienvenido, <%=sesion.getAttribute("usuario").toString()%></h2>
                        <div class="register">
                            <h3>Información Personal</h3>
                            <div class="col-md-6 col-xs-12 login-left">
                                <div class="form-group">
                                    <label>Tipo de Documento</label>
                                    <input id ="id" class="form-control"  name="tipo_documento" value="${user.get("tipo_documento")}" readonly>
                                </div>
                            </div>
                            <div class="col-md-6 col-xs-12 login-right">
                                <div class="form-group">
                                    <label>DNI</label>
                                    <input id ="id" class="form-control"  name="id" value="${user.get("_id")}" readonly>
                                </div>
                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>    
            </div>
        </div>

        <jsp:include page="footer_home.jsp"/>
    </body>
</html>
