<%-- 
    Document   : confirmacion_registro
    Created on : 29-ago-2017, 0:24:00
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>

<head>
    <title>Cinerama | Registrar</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="cinerama, cine, peliculas, estrenos, peru">
    <link type="image/x-icon" rel="shortcut icon" href="<c:url value="/recursos/images/favicon.png"/>">
    <script type="application/x-javascript">
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

    function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <link href="<c:url value="/recursos/css/bootstrap.css"/>" rel='stylesheet' type='text/css' />
    <link href="<c:url value="/recursos/css/style.css"/>" rel="stylesheet" type="text/css" media="all" />
    <!-- start plugins -->
    <script type="text/javascript" src="<c:url value="/recursos/js/jquery-1.11.1.min.js"/>"></script>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
</head>

<body>
    <div class="container">
        <div class="container_wrap">
            <jsp:include page="header_home.jsp"/>  
            <div class="content">
                <h1>Felicitaciones. Su cuenta ha sido creada.</h1>
            </div>
        </div>
    </div>
    <jsp:include page="footer_home.jsp"/>  
</body>

</html>
