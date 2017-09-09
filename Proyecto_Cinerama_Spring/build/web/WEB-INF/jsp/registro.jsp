<%@page import="java.util.Calendar"%>
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
                    <form name="Registrar" method="post" action="confirmacion_registro.htm">
                        <h3>Información Personal</h3>
                        <div class="col-md-6 col-xs-12 login-left">
                            <div>
                                <span>Tipo de Documento<label>*</label></span>
                                <select name="tipo_documento" required>
                                    <option value="DNI">DNI</option>
                                    <option value="Pasaporte">Pasaporte</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-right">
                            <div>
                                <span>Número de Documento<label>*</label></span>
                                <input title="Cadena de 8 números" type="text" name="id" pattern="[0-9]{8,}" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-left">
                            <div>
                                <span>Nombres<label>*</label></span>
                                <input type="text" name="nombres" pattern="[A-Za-z ]{2,}" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-right">
                            <div>
                                <span>Apellido Paterno<label>*</label></span>
                                <input type="text" name="apellido_paterno" pattern="[A-Za-z ]{2,}" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-left">
                            <div>
                                <span>Apellido Materno<label>*</label></span>
                                <input type="text" name="apellido_materno" pattern="[A-Za-z ]{2,}" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-right">
                            <div>
                                <span>Fecha de Nacimiento<label>*</label></span>
                                <%
                                Calendar fechaActual = Calendar.getInstance();
                                String cadenaFecha = String.format("%04d-%02d-%02d",
                                  fechaActual.get(Calendar.YEAR)-18,
                                  fechaActual.get(Calendar.MONTH)+1,
                                  fechaActual.get(Calendar.DAY_OF_MONTH));
                                %>
                                <input title="Usted debe ser mayor de edad" type="date" name="fecha_nacimiento" min="1920-01-01" max="<%=cadenaFecha%>" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-left">
                            <div>
                                <span>Correo Electrónico<label>*</label></span>
                                <input type="email" name="correo_electronico" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-right">
                            <div>
                                <span>Teléfono<label>*</label></span>
                                <input type="tel" name="telefono" pattern="[0-9]{6,}"required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-left">
                            <div>
                                <span>Estado Civil<label>*</label></span>
                                <select name="estado_civil" required>
                                    <option value="soltero">Soltero(a)</option>
                                    <option value="casado">Casado(a)</option>
                                    <option value="divorciado">Divorciado(a)</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-right">
                            <div>
                                <span>Ocupación<label>*</label></span>
                                <input type="text" name="ocupacion" pattern="[A-Za-z ]{6,}" required>
                            </div>
                        </div>
                        <br>
                        <h3>Información de Ubicación</h3>
                        <div class="col-md-6 col-xs-12 login-left">
                            <div>
                                <span>Departamento<label>*</label></span>
                                <select name="departamento" required>
                                    <option value="Amazonas">Amazonas</option>
                                    <option value="Áncash">Áncash</option>
                                    <option value="Apurímac">Apurímac</option>
                                    <option value="Arequipa" >Arequipa</option>
                                    <option value="Ayacucho" >Ayacucho</option>
                                    <option value="Cajamarca" >Cajamarca</option>
                                    <option value="Callao" >Callao</option>
                                    <option value="Cusco" >Cusco</option>
                                    <option value="Huancavelica" >Huancavelica</option>
                                    <option value="Huánuco" >Huánuco</option>
                                    <option value="Ica" >Ica</option>
                                    <option value="Junín" >Junín</option>
                                    <option value="La Libertad" >La Libertad</option>
                                    <option value="Lambayeque" >Lambayeque</option>
                                    <option value="Lima" >Lima</option>
                                    <option value="Loreto" >Loreto</option>
                                    <option value="Madre de Dios" >Madre de Dios</option>
                                    <option value="Moquegua" >Moquegua</option>
                                    <option value="Pasco" >Pasco</option>
                                    <option value="Piura" >Piura</option>
                                    <option value="Puno" >Puno</option>
                                    <option value="San Martín" >San Martín</option>
                                    <option value="Tacna" >Tacna</option>
                                    <option value="Tumbes" >Tumbes</option>
                                    <option value="Ucayali" >Ucayali</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-right">
                            <div>
                                <span>Provincia<label>*</label></span>
                                <input type="text" name="provincia" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-left">
                            <div>
                                <span>Distrito<label>*</label></span>
                                <input type="text" name="distrito" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-right">
                            <div>
                                <span>Dirección<label>*</label></span>
                                <input type="text" name="direccion" pattern="[A-Za-z ]{6,}" required>
                            </div>
                        </div>    
                        <h3>Información de Inicio de Sesión</h3>
                        <div class="col-md-6 col-xs-12 login-left">
                            <div>
                                <span>Contraseña<label>*</label></span>
                                <input title="Contraseña debe contener 8 caracteres, incluyendo un numero, una letra en mayúscula y una en minúscula"type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                            </div>
                        </div>
                        <div class="col-md-6 col-xs-12 login-left">
                            <div>
                                <span>Confirmar Contraseña<label>*</label></span>
                                <input title="Contraseña debe contener 8 caracteres, incluyendo un numero, una letra en mayúscula y una en minúscula" type="password" name="confirmar_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                            </div>
                        </div> 
                        <div class="clearfix"> </div>
                        <br>
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