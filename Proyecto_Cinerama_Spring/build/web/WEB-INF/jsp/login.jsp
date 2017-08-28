<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>

<head>
    <title>Cinerama</title>
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
                    <div class="col-md-6 login-left">
                        <h3>Nuevo Usuario</h3>
                        <p>Creando una cuenta, usted podrá acceder a muchos beneficios del cine, como promociones, descuentos. Ademas usted podrá verificar sus visitas como comprar entradas a precios exclusivos.</p>
                        <a class="acount-btn" href="registro.jsp">Crear una Cuenta</a>
                    </div>
                    <div class="col-md-6 login-right">
                        <h3>Usuarios Registrados</h3>
                        <p>Si ya tienes una cuenta, inicia sesión.</p>
                        <form action="check.htm" method="POST" name="login">
                            <div>
                                <span>Usuario<label>*</label></span>
                                <input type="text" name="usuario">
                            </div>
                            <div>
                                <span>Contraseña<label>*</label></span>
                                <input type="password" name="password">
                            </div>
                            <input type="submit" value="Iniciar Sesión"><br>
                            <a class="forgot" href="#">¿Olvidaste tu contraseña?</a> 
                        </form>
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