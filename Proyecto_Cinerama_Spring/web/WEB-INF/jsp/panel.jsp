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
                        <div id="contraseña" style="display:none;">
                            <h3>Hola esta es la contrasña</h3>
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