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
                        <div class="col-xs-16 col-md-3" ali>
                            <div class="movie__info">
                                <ul class="list_6">
                                    <a href="" class="movie__title">${pelicula.get("titulo")}  </a><br>
                                    <div class="movie__images">
                                         <a class="movie-beta__link">
                                           <br>
                                             <img id="poster_imagen" src="mostrar_imagen.htm?imagen=${pelicula.get("nombre_imagen")}" style ="width: 200px">    
                                         </a>
                                     </div>
                                     <br>
                                    <p class="movie__option">Genero: <a href="">${pelicula.get("genero")}</a> </p>
                                    <p class="movie__time">Duracion: ${pelicula.get("duracion")}</p>                                   
                                    <li><i>Funcion: 13:20</li>
                                    <div class="clearfix"></div>

                                </ul>
                             </div>
                        </div>
                        <div class="col-xs-12 col-md-9 login-left">
                            <br><br>
                            <p>Elija el tipo de boleto y la cantidad de butacas que desea reservar.</p>
                              <br><br>
                              <table class="table table-striped">
                                <thead>
                                  <tr>
                                    <th >Tipo de Boleto</th>
                                    <th >Precio</th>
                                    <th>Cantidad</th>
                                    <th>Total</th>
                                  </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>General mayor a 12 años</td>
                                        <td>10</td>
                                        <td>
                                          <select id="general12" title="Elija Cant. entradas." onchange="myFunction()">
                                            <option> 0</option>
                                            <option >1</option>
                                            <option >2</option>
                                            <option >3</option>
                                            <option >4</option>
                                            <option >5</option>
                                            <option >6</option>
                                            <option >7</option>
                                            <option >8</option>
                                            <option >9</option>
                                            <option >10</option>
                                          </select>

                                        </td>
                                        <td id="demo" value="0"> 0 </td>
                                    </tr>
                                    <tr>
                                        <td>Niños hasta los 11 años</td>
                                        <td>6</td>
                                        <td><select id="ninios"  title="Elija Cant. entradas." onchange="myFunction()">>
                                          <option> 0</option>
                                          <option >1</option>
                                          <option >2</option>
                                          <option >3</option>
                                          <option >4</option>
                                          <option >5</option>
                                          <option >6</option>
                                          <option >7</option>
                                          <option >8</option>
                                          <option >9</option>
                                          <option >10</option>


                                        </select></td>
                                        <td id="demo2"> 0  </td>
                                    </tr>
                                    <tr>
                                        <td>Total</td>
                                        <td></td>

                                        <td >
                                            <div id="cant_total">0</div>
                                        </td>

                                        <td > 
                                            <div id="suma_total">0</div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <a href="single.htm" class="btn btn-warning" role="button">Regresar</a>
                            <a class="btn btn-danger" role="button" onclick="goto()">Continuar</a>
                        </div>                        
                    </div>
                </div>
            </div>  
        </div>
        <jsp:include page="footer_home.jsp"/>   
    </body>
    <script>
         function myFunction() {
            var x = document.getElementById("general12").value;
            var y = document.getElementById("ninios").value;
            document.getElementById("cant_total").innerHTML = parseInt(x) + parseInt(y);
            var t = document.getElementById("demo").innerHTML = 10 * x;
            var t2 = document.getElementById("demo2").innerHTML = 6 * y;

            var tot1 = t+t2;



            document.getElementById("suma_total").innerHTML = tot1;

        }


        function goto() {
            var x = document.getElementById("cant_total").innerHTML;
            var y = document.getElementById("suma_total").innerHTML;
            var tot = parseInt(x) + parseInt(y);
            console.log(parseInt(x) + parseInt(y));
            window.location.assign("http://localhost:8084/Proyecto_Cinerama_Spring/reservar_butacas.htm?idpelicula=${pelicula.get("_id")}&funcion=${funcion.get("_id")}&nrosala=${sala}&cant_total="+x+"&suma_total="+y);
        }
    </script>
    <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/recursos/js/jquery-1.11.3.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/recursos/js/bootstrap.min.js"></script>
        <!-- Morris Charts JavaScript -->
        <script src="${pageContext.request.contextPath}/recursos/js/plugins/morris/raphael.min.js"></script>
        <script src="${pageContext.request.contextPath}/recursos/js/plugins/morris/morris.min.js"></script>
        <script src="${pageContext.request.contextPath}/recursos/js/plugins/morris/morris-data.js"></script>
</html>
