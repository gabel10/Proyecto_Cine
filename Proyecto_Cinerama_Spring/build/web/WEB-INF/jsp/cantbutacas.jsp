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
    <link type="image/x-icon" rel="shortcut icon" href="images/favicon.png">
    <script type="application/x-javascript">
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

    function hideURLbar() { window.scrollTo(0, 1); }
    </script>
     <link href="<c:url value="/recursos/css/bootstrap.css"/>" rel='stylesheet' type='text/css'>
    <link href="<c:url value="/recursos/css/style.css"/>" rel="stylesheet" type="text/css" media="all">
    <!-- start plugins -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/recursos/js/jquery-1.11.1.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Roboto+Condensed:100,200,300,400,500,600,700,800,900' rel='stylesheet' type='text/css'>
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
                          <a href="single.html" class="movie__title">Guardianes(2017) ${funcion}  </a><br>
                          <div class="movie__images">
                               <a class="movie-beta__link">
                                 <br>
                                   <img alt="" src="recursos/images/single.jpg" class="img-responsive" width="200" height="200"/>
                               </a>
                           </div>
                           <br>
                           <p class="movie__option"><a href="single.html">Contray</a> | <a href="single.html">Dolor sit</a> | <a href="single.html">Drama</a></p>
                          <p class="movie__time">Duracion: 130 min</p>
                          <li><i class="icon1"> </i><p>2,548</p></li>
                          <li><i class="icon3"> </i><p>546</p></li>
                          <li>Rating : &nbsp;&nbsp;<p><img src="recursos/images/rating1.png" alt=""></p></li>
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
                              <select id="mySelect1" class="form-control" title="Elija Cant. entradas." onchange="myFunction()">
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
                          <td><select id="mySelect2" class="form-control" title="Elija Cant. entradas." onchange="myFunction()">>
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
                            
                            <td id="cant_total" value="0">
                                0
                            </td>
                            
                            <td id="suma_total" > 
                                 0
                            </td>
                        </tr>
                        
                      </tbody>
                    </table>
                    
                    <script>
                        function myFunction() {
                            var x = document.getElementById("mySelect1").value;
                            var y = document.getElementById("mySelect2").value;
                            document.getElementById("cant_total").innerHTML = parseInt(x) + parseInt(y);
                            var t = document.getElementById("demo").innerHTML = 10 * x;
                            var t2 = document.getElementById("demo2").innerHTML = 6 * y;
                     
                            var tot1 = t+t2;
                           
                           
                            
                            document.getElementById("suma_total").innerHTML = tot1;
                            
                        }
                       
                        
                        function goto() {
                            var x = document.getElementById("mySelect1").value;
                            var y = document.getElementById("mySelect2").value;
                            var tot = parseInt(x) + parseInt(y);
                            console.log(parseInt(x) + parseInt(y));
                            window.location.assign("http://localhost:8084/Proyecto_Cinerama_Spring/reservarbutacas.htm?cnt="+tot);
                        }
                        
                    </script>
                    

                    
                    
                    
                    <a href="single.htm" class="btn btn-warning" role="button">Regresar</a>
                    <a class="btn btn-danger" role="button" onclick="goto()">Continuar</a>
                </div>
              </div>
            </div>
        </div>
    </div>
    <div class="container">
        <footer id="footer">
            <div id="footer-3d">
                <div class="gp-container">
                    <span class="first-widget-bend"> </span>
                </div>
            </div>
            <div id="footer-widgets" class="gp-footer-larger-first-col">
                <div class="gp-container">
                    <div class="footer-widget footer-1">
                        <div class="wpb_wrapper">
                            <img src="recursos/images/logo.jpg" alt="" />
                        </div>
                        <br>
                        <p>La cadena de cines Cineramas ofrece el mejor servicio, para que disfrutes de la proyección de tu pelicula favorita.</p>
                        <p class="text">Contamos con pantallas 4K, en el que disfrutarás de la mejor experiencia posible</p>
                    </div>
                    <div class="footer_box">
                        <div class="col_1_of_3 span_1_of_3">
                            <h3>Géneros</h3>
                            <ul class="first">
                                <li><a href="#">Ciencia Ficción</a></li>
                                <li><a href="#">Aventura</a></li>
                                <li><a href="#">Romance</a></li>
                                <li><a href="#">Terror</a></li>
                                <li><a href="#">Thriller</a></li>
                            </ul>
                        </div>
                        <div class="col_1_of_3 span_1_of_3">
                            <h3>Información</h3>
                            <ul class="first">
                                <li><a href="#">Sobre Nosotros</a></li>
                                <li><a href="#">Ventas Corporativas</a></li>
                                <li><a href="#">Libro de Reclamaciones</a></li>
                                <li><a href="#">Contáctanos</a></li>
                            </ul>
                        </div>
                        <div class="col_1_of_3 span_1_of_3">
                            <h3>Síguenos</h3>
                            <ul class="first">
                                <li><a href="#">Facebook</a></li>
                                <li><a href="#">Twitter</a></li>
                                <li><a href="#">Youtube</a></li>
                            </ul>
                            <div class="copy">
                                <p>&copy; 2017 Template by Abel Zapata</p>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="clearfix"> </div>
                </div>
            </div>
        </footer>
    </div>
</body>

</html>
