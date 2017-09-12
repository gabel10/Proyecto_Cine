<%-- 
    Document   : contactanos
    Created on : 11-sep-2017, 16:53:40
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cinerama | Contáctanos</title>
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
                        <div class="register">
                            <form action="iniciar_sesion.htm" method="POST" name="login">
                                <div class="col-md-12 col-xs-12 login-right">
                                    <h3>Envíenos su mensaje...</h3>
                                    <div class="col-md-6">
                                        <span>Nombre y Apellidos<label>*</label></span>
                                        <input type="text" name="nombres_apellid" placeholder="Nombres y Apellidos">
                                    </div>
                                    <div class="col-md-6">
                                        <span>Email<label>*</label></span>
                                        <input type="email" name="email" placeholder="Email">
                                    </div>
                                    <div class="col-md-6">
                                        <span>Tema<label>*</label></span>
                                        <input type="text" name="tema" placeholder="Tema">
                                    </div>
                                    <div class="col-md-6">
                                        <span>Teléfono<label>*</label></span>
                                        <input type="tel" name="telefono" placeholder="Teléfono">
                                    </div>
                                    <div class="col-md-6">
                                        <span>Mensaje<label>*</label></span>
                                        <textarea type="text" name="mensaje" placeholder="Mensaje" rows="4"></textarea>
                                    </div>
                                    <div class="clearfix"> </div>
                                    <input type="submit" value="Enviar Mensaje"><br>
                                </div>
                                <div class="clearfix"> </div>
                            </form>
                        </div>
                    </div>
                </div>    
            </div>
        </div>
        <jsp:include page="footer_home.jsp"/>  
    </body>
</html>
