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
                        <nav class="navbar navbar-default">
                          <div class="container-fluid">
                            <ul id="menu" class="nav navbar-nav">
                              <li id="uno" class="active"><a href="#historial">Mi Historial</a></li>
                              <li id="dos"><a href="#datos">Mis Datos</a></li>
                              <li id="tres"><a href="#contraseña">Mi Contraseña</a></li>
                              <%
                                  String nivel_acceso = sesion.getAttribute("nivel_acceso").toString();
                                  if("administrador".equals(nivel_acceso)){
                              %>
                              <li><a href="menu.htm">Menú Administrador</a></li>
                              <%
                                  }else if("vendedor".equals(nivel_acceso)){
                              %>
                              <li><a href="menu.htm">Menú Vendedor</a></li>
                              <%
                                  }
                              %>
                            </ul>
                          </div>
                        </nav>
                        <div id="historial">
                            <h3>hols este es el historial</h3>
                        </div>
                        <div id="datos" style="display:none;">
                            <div class="register">
                               <form name="Registrar" method="post" action="paneldatos.htm">
                                    <h3>Información Personal</h3>
                                    <div class="col-md-6 col-xs-12 login-left">
                                        <div>
                                            <span>Tipo de Documento<label>*</label></span>
                                            <input type="text" name="tipo_documento" value="${user.get("tipo_documento")}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-right">
                                        <div>
                                            <span>Número de Documento<label>*</label></span>
                                            <input type="text" name="id" value="${user.get("_id")}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-left">
                                        <div>
                                            <span>Nombres<label>*</label></span>
                                            <input type="text" name="nombres" value="${user.get("nombres")}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-right">
                                        <div>
                                            <span>Apellido Paterno<label>*</label></span>
                                            <input type="text" name="apellido_paterno" value="${user.get("apellido_paterno")}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-left">
                                        <div>
                                            <span>Apellido Materno<label>*</label></span>
                                            <input type="text" name="apellido_materno" value="${user.get("apellido_materno")}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-right">
                                        <div>
                                            <span>Fecha de Nacimiento<label>*</label></span>
                                            <input type="date" name="fecha_nacimiento" value="${user.get("fecha_nacimiento")}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-left">
                                        <div>
                                            <span>Correo Electrónico<label>*</label></span>
                                            <input type="email" name="correo_electronico" value="${user.get("email")}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-right">
                                        <div>
                                            <span>Teléfono<label>*</label></span>
                                            <input type="tel" name="telefono" pattern="[0-9]{6,}" value="${user.get("telefono")}" required>
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
                                            <input type="text" name="ocupacion" pattern="[A-Za-z ]{6,}"  value="${user.get("ocupacion")}" required>
                                        </div>
                                    </div>
                                    <br>
                                    <h3>Información de Ubicación</h3>
                                    <div class="col-md-6 col-xs-12 login-left">
                                        <div>
                                            <span>Departamento<label>*</label></span>
                                            <select name="departamento"  required>
                                                <option value="${user.get("departamento")}" selected>${user.get("departamento")}</option>
                                                <option value="AMAZONAS">AMAZONAS</option>
                                                <option value="ANCASH">ANCASH</option>
                                                <option value="APURIMAS">APURIMAS</option>
                                                <option value="AREQUIPA" >AREQUIPA</option>
                                                <option value="AYACUCHO" >AYACUCHO</option>
                                                <option value="CAJAMARCA" >CAJAMARCA</option>
                                                <option value="CALLAO" >CALLAO</option>
                                                <option value="CUSCO" >CUSCO</option>
                                                <option value="HUANCAVELICA" >HUANCAVELICA</option>
                                                <option value="HUACNUCO" >HUACNUCO</option>
                                                <option value="ICA" >ICA</option>
                                                <option value="JUNIN" >JUNIN</option>
                                                <option value="LA LIBERTAD" >LA LIBERTAD</option>
                                                <option value="LAMBAYEQUE" >LAMBAYEQUE</option>
                                                <option value="LIMA" >LIMA</option>
                                                <option value="LORETO" >LORETO</option>
                                                <option value="MADRE DE DIOS" >MADRE DE DIOS</option>
                                                <option value="MOQUEGUA" >MOQUEGUA</option>
                                                <option value="PASCO" >PASCO</option>
                                                <option value="PIURA" >PIURA</option>
                                                <option value="PUNO" >PUNO</option>
                                                <option value="SAN MARTIN" >SAN MARTIN</option>
                                                <option value="TACNA" >TACNA</option>
                                                <option value="TUMBES" >TUMBES</option>
                                                <option value="UCAYALI" >UCAYALI</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-right">
                                        <div>
                                            <span>Provincia<label>*</label></span>
                                            <input type="text" name="provincia" value="${user.get("provincia")}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-left">
                                        <div>
                                            <span>Distrito<label>*</label></span>
                                            <input type="text" name="distrito" value="${user.get("distrito")}" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-xs-12 login-right">
                                        <div>
                                            <span>Dirección<label>*</label></span>
                                            <input type="text" name="direccion" pattern="[A-Za-z0-9.- ]{6,}" value="${user.get("direccion")}" required>
                                        </div>
                                    </div>    
                                    <br>
                                    <div class="register-but">
                                        <input type="submit" value="Actualizar Datos">
                                        <div class="clearfix"> </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div id="contraseña" style="display:none;">
                            <form name="Registrar" method="post" action="panel_contraseña.htm">
                                <div class="col-md-4 col-xs-12 login-left">
                                    <div>
                                        <span>Contraseña Actual<label>*</label></span>
                                        <input title="Contraseña debe contener 8 caracteres, incluyendo un numero, una letra en mayúscula y una en minúscula" type="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-12 login-left">
                                    <div>
                                        <span>Nueva Contraseña<label>*</label></span>
                                        <input title="Contraseña debe contener 8 caracteres, incluyendo un numero, una letra en mayúscula y una en minúscula" type="password" name="new_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                    </div>
                                </div> 
                                <div class="col-md-4 col-xs-12 login-left">
                                    <div>
                                        <span>Confirmar Nueva Contraseña<label>*</label></span>
                                        <input title="Debe ser igual al campo Nueva Contraseña" type="password" name="confirm_new_password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" required>
                                    </div>
                                </div> 
                                <div class="clearfix"> </div>
                                <br>
                                <div class="register-but">
                                    <input type="submit" value="Cambiar Contraseña">
                                    <div class="clearfix"> </div>
                                </div>
                            </form>
                        </div>
                        
                    </div>
                </div>    
            </div>
        </div>
        <jsp:include page="footer_home.jsp"/>
        <script>
            $("#menu").click(function(e){
                var li = e.target.parentNode;
                var lis = "#"+li.id;
                $('#uno').removeClass('active');
                $('#dos').removeClass('active');
                $('#tres').removeClass('active');
                $(lis).addClass('active');
            });
            $("#uno").click(function(){
                document.getElementById('datos').style.display = 'none';
                document.getElementById('contraseña').style.display = 'none';
                document.getElementById('historial').style.display = 'block';
            });
            $("#dos").click(function(){
                document.getElementById('historial').style.display = 'none';
                document.getElementById('contraseña').style.display = 'none';
                document.getElementById('datos').style.display = 'block';
            });
            $("#tres").click(function(){
                document.getElementById('historial').style.display = 'none';
                document.getElementById('datos').style.display = 'none';
                document.getElementById('contraseña').style.display = 'block';
            });
        </script>
    </body>
</html>
