<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
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
                <div class="register">
                    <form name="Registrar" method="post" action="registro.htm">
                        <div class="register-top-grid">
                            <h3>Información Personal</h3>
                            <div>
                                <span>Tipo de Documento<label>*</label></span>
                                <select>
                                    <option value="DNI">DNI</option>
                                    <option value="Pasaporte">Pasaporte</option>
                                </select>
                            </div>
                            <div>
                                <span>Número de Documento<label>*</label></span>
                                <input type="text" name="id">
                            </div>
                            <div>
                                <span>Nombres<label>*</label></span>
                                <input type="text" name="nombres">
                            </div>
                            <div>
                                <span>Apellido Paterno<label>*</label></span>
                                <input type="text" name="apellido_paterno">
                            </div>
                            <div>
                                <span>Apellido Materno<label>*</label></span>
                                <input type="text" name="apellido_materno">
                            </div>
                            <div>
                                <span>Fecha de Nacimiento<label>*</label></span>
                                <input type="date" name="fecha_nacimiento">
                            </div>
                            <div>
                                <span>Correo Electrónico<label>*</label></span>
                                <input type="email" name="correo_electronico">
                            </div>
                            <div>
                                <span>Teléfono<label>*</label></span>
                                <input type="tel" name="telefono">
                            </div>
                            
                            <div>
                                <span>Estado Civil<label>*</label></span>
                                <select name="estado_civil">
                                    <option value="soltero">Soltero(a)</option>
                                    <option value="casado">Casado(a)</option>
                                    <option value="divorciado">Divorciado(a)</option>
                                </select>
                            </div>
                            <div>
                                <span>Ocupación<label>*</label></span>
                                <input type="text" name="ocupacion">
                            </div>
                            
                        </div>
                        <div class="register-top-grid">
                            <h3>Información de Ubicación</h3>
                            <div>
                                <span>Departamento<label>*</label></span>
                                <select name="departamento">
                                    <option value="Arequipa">Arequipa</option>
                                    <option value="Cusco">Cusco</option>
                                    <option value="Lima" >Lima</option>
                                </select>
                            </div>
                            <div>
                                <span>Provincia<label>*</label></span>
                                <input type="text" name="provincia">
                            </div>
                            <div>
                                <span>Distrito<label>*</label></span>
                                <input type="text" name="distrito">
                            </div>
                            <div>
                                <span>Dirección<label>*</label></span>
                                <input type="text" name="direccion">
                            </div>
                     
                        </div>
                        <div class="register-bottom-grid">
                            <h3>Información de Inicio de Sesión</h3>
                            <div>
                                <span>Contraseña<label>*</label></span>
                                <input type="password" name="password">
                            </div>
                            <div>
                                <span>Confirmar Contraseña<label>*</label></span>
                                <input type="password" name="confirmar_password">
                            </div>
                            <div class="clearfix"> </div>
                            <a class="news-letter" href="#">
                                <label class="checkbox">
                                <input type="checkbox" name="checkbox" checked=""><i> </i>Acepto recibir notificaciones.</label>
                            </a>
                        </div>
                    
                    <div class="clearfix"> </div>
                    <div class="register-but">
                       
                            <input type="submit" value="Registrar">
                            <div class="clearfix"> </div>
                        
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="footer_home.jsp"/>  
</body>

</html>