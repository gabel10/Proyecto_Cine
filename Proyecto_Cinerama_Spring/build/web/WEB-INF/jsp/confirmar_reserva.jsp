<%-- 
    Document   : home
    Created on : 27/08/2017, 03:11:19 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Cinerama</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="keywords" content="cinerama, cine, peliculas, estrenos, peru">
        <link type="image/x-icon" rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/images/favicon.png">
        <link href="${pageContext.request.contextPath}/recursos/css/sb-admin.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="${pageContext.request.contextPath}/recursos/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

        function hideURLbar() { window.scrollTo(0, 1); }
        </script>
        <link href="<c:url value="/recursos/css/bootstrap.css"/>" rel='stylesheet' type='text/css'>
        <link href="<c:url value="/recursos/css/style.css"/>" rel="stylesheet" type="text/css" media="all">
        
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
                <div class="content">
                    <div class="row">
                        <label>Se reservo con exito sus entradas</label><br>
                        <a href="cartelera.htm" class="btn btn-success">Aceptar</a>
                    </div>

                </div>
            </div>  
        </div>
        <jsp:include page="footer_home.jsp"/>   
    </body>
    <script>
        function prueba(id){
            alert("hola mundo");
        }
    </script>
</html>
