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
                        <div class="col-lg-1">
                            <label>Seleccione fecha</label><br>
                        </div>
                        <div class="col-lg-3">
                            <input type="date" name="fecha_cartelera" class="form-control">  
                        </div>
                        
                        <c:forEach items="${datos1}" var="ca">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <div class="panel panel-default">                                        
                                        <div class="panel-heading" style="background-color: #AE5A5A; color: white">
                                            <c:forEach items="${peliculas}" var="peli">
                                                 <c:if test="${peli.get("_id") == ca.get("id_pelicula")}" >
                                                     <h3 class="panel-title"><i></i>${peli.get("titulo")}    </h3>
                                                 </c:if>
                                            </c:forEach>
                                            
                                        </div>
                                        <div class="panel-body" style="background-color: white">
                                            <div class="form-group"> 
                                                
                                                <div class="col-lg-3" >
                                                    <div class="form-group"> 
                                                        <img src="mostrar_imagen_por_id.htm?id_imagen=${ca.get("id_pelicula")}" width="200px" ><br>
                                                        <button class="btn btn-info" style="width: 200px">Ver Detalle de Pelicula</button>
                                                    </div>
                                                </div>
                                                
                                                <div class="col-lg-5">    
                                                    <div class="form-group"> 
                                                        <br>
                                                        <label style="font-size: 17px">Horarios</label><br>
                                                        <div class="row">
                                                             <c:forEach items="${horarios}" var="horario">
                                                                <c:if test="${ca.get("_id") == horario.get("id_cartelera")}" >
                                                                    <div class="col-lg-3"style="height: 60px">                                                                
                                                                        <a href="reservar_cantidad_butacas.htm?idpelicula=${ca.get("id_pelicula")}&idfuncion=${horario.get("_id")}&nro_sala=${horario.get("nro_sala")}" class="btn btn-warning btn-lg" >${horario.get("horario")}</a>                                                                
                                                                    </div>
                                                               </c:if>  
                                                            </c:forEach>
                                                        </div>
                                                   
                                                  </div>                                                          
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                             </div>
                        </c:forEach>
                        
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
