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
    <style type="text/css">
        a:hover {
         cursor:pointer;
        }
    </style>
    <title>Cinerama | Registrar  </title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="cinerama, cine, peliculas, estrenos, peru">
    <link type="image/x-icon" rel="shortcut icon" href="images/favicon.png">
    <script type="application/x-javascript">
    addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

    function hideURLbar() { window.scrollTo(0, 1); }
     </script>
      <script type="application/x-javascript">
      addEventListener("load", function() { fnGenerarButacas(); }, false);

    //function hideURLbar() { window.scrollTo(0, 1); }
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
                  <form action="confirmacion_reserva.htm" method="POST">
                      <div class="col-xs-16 col-md-3" ali>
                          <div class="movie__info">
                              <strong>Seleccionaste <li id="count" >0</li> sillas</strong>
                              <div>
                                <ul class="list_6">
                                    <a href="single.html" class="movie__title">Guardianes(2017) </a><br>
                                  
                                    <div class="movie__images">
                                       <a class="movie-beta__link">
                                         <br>
                                           <img alt="" src="recursos/images/single.jpg" class="img-responsive" width="200" height="200"/>
                                       </a>
                                   </div>

                                   <div class="form-group">
                                       <label>ID SALA</label>
                                         <input id ="sala" class="form-control"  name="id_sala" value="${funcion.get("id_sala")}" readonly>
                                        <label>Asientos</label>
                                         <input id ="asientos" class="form-control"  name="asientos" value="${asientos_sala}" readonly>
                                         <label>Asientos</label>
                                         <input id ="asientos_nuevos" class="form-control"  name="asientos_nuevos" value="${asientos_sala}" readonly>
                                      </div>

                                   <br>
                                   
                                   <p class="movie__option"><a href="single.html">Contray</a> | <a href="single.html">Dolor sit</a> | <a href="single.html">Drama</a></p>
                                  <p class="movie__time">Duracion: 130 min</p>
                                  
                                   
                                  <li><i class="icon1"> </i><p>2,548</p></li>
                                  <li><i class="icon3"> </i><p>546</p></li>
                                  <li>Rating : &nbsp;&nbsp;<p><img src="recursos/images/rating1.png" alt=""></p></li>
                                  <!---<li><i>Funcion: 13:20</li>-->
                                  <div class="clearfix"></div>  
                                  
                                </ul>
                               </div>
                          </div>
                          
                        </div>
                                      
                                      <div class="col-xs-12 col-md-9 login-left">
                    
                                        <div id="map-container" >

                                            <div class="screen" ><img  src="recursos/images/pantalla.png" alt=""></div>

                                            <div class="canvas" style="height: 550px">
                                                <div id="contenedor_butacas">

                                                </div>
                                            </div>
                                        </div>

                                        <a href="cantbutacas.htm" class="btn btn-warning" role="button">Regresar</a>
                                        <button type="submit" class="btn btn-danger btn-md" >Continuar</button> 
                                    </div>
                  </form>
                  
                
                                      
                
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
            
            
           
     <script>
         
        function goto() {
            var asientos_nuevos = document.getElementById("asientos_nuevos").value;
            
        }
        
        function fnGenerarButacas(){
            var filas = 14//document.getElementById("filas").value;
            var columnas = 21//document.getElementById("columnas").value;
            
            var body = document.getElementById("contenedor_butacas");
            
         
            var asientos = document.getElementById("asientos").value;
            
            var M = []
            
            var idx = 0
            for(var row = 0; row < filas-1; row++) {
                var hil = "";
                for(var col = idx; col < idx + 21; col++) {
                    hil = hil + asientos[col];
                   
                }
                
                idx = idx + 21;
                M.push(hil);
            }
            
            function setCharAt(str,index,chr) {
                if(index > str.length-1) return str;
                return str.substr(0,index) + chr + str.substr(index+1);
            }
            //Demo
            //var str = 'Hello World';
            //str = setCharAt(str,4,',');
            //alert(str);
            
            //M[1] = setCharAt(M[1], 2, '1');
            //M[3] = setCharAt(M[2], 5, '1');
          
 
            // Crea un elemento <table> y un elemento <tbody>
            var tabla   = document.createElement("table");
            var tblBody = document.createElement("tbody");
            //tabla.setAttribute("width","50");
           // tabla.setAttribute("height","50");
            // Crea las celdas
            
            for(var i = 0; i < 1; i++) {
                var hilera = document.createElement("tr");
                for (var j = 0; j < columnas+1; j++) {
                // Crea un elemento <td> y un nodo de texto, haz que el nodo de
                // texto sea el contenido de <td>, 0ubica el elemento <td> al final
                // de la hilera de la tabla
                var celda = document.createElement("td");
                celda.setAttribute("width","35");
                celda.setAttribute("height","35");
                var btnImagen = document.createElement("strong");
                
                var imagen = document.createElement("img");
                imagen.setAttribute("width","35px");
                imagen.setAttribute("height","35px");
                imagen.setAttribute("align","center");
                imagen.textContent = j;
                
              //  imagen.setAttribute("name",j)
                btnImagen.appendChild(imagen);
                //btnImagen.setAttribute("href","nose.jsp");
                celda.appendChild(btnImagen);
                hilera.appendChild(celda);
              }
              tblBody.appendChild(hilera);
              
            }
            
            var c = 0;
            var gg = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P'];
            
            for (var i = 1; i < filas; i++) {
              // Crea las hileras de la tabla
              var hilera = document.createElement("tr");

              for (var j = 0; j < columnas+1; j++) {
                // Crea un elemento <td> y un nodo de texto, haz que el nodo de
                // texto sea el contenido de <td>, 0ubica el elemento <td> al final
                // de la hilera de la tabla
               
                if(j == 0) {
                        
                    var celda = document.createElement("td");
                    celda.setAttribute("width","50");
                    celda.setAttribute("height","35");
                    var btnImagen = document.createElement("strong");
                    var imagen = document.createElement("img");
                    imagen.setAttribute("width","35px");
                    imagen.setAttribute("height","35px");
                    imagen.setAttribute("align","center");
                    imagen.textContent = gg[i-1] + "_"; 
                    
                    //imagen.setAttribute("name",j)
                    btnImagen.appendChild(imagen);
                    //btnImagen.setAttribute("href","nose.jsp");
                    celda.appendChild(btnImagen);
                    hilera.appendChild(celda);
                } else {
                    var celda = document.createElement("td");
                    celda.setAttribute("width","35");
                    celda.setAttribute("height","35");
                    var btnImagen = document.createElement("a");
                    var imagen = document.createElement("img");
                    imagen.setAttribute("width","35px");
                    imagen.setAttribute("height","35px");
                    imagen.setAttribute("align","center");
                    
                    if(M[i-1][j-1] == '1') {
                       imagen.setAttribute("src","${pageContext.request.contextPath}/recursos/images/butaca.png")
                    } else {
                       imagen.setAttribute("src","${pageContext.request.contextPath}/recursos/images/butaca1.png")
                    }
                    
                    //imagen.setAttribute("src","${pageContext.request.contextPath}/recursos/images/butaca1.png")
                    imagen.setAttribute("id", i+","+j);
                    imagen.setAttribute("onclick","selectSilla(this.id)");
                    btnImagen.appendChild(imagen);
                    
                    
                    //btnImagen.setAttribute("href","#");
                    celda.appendChild(btnImagen);
                    hilera.appendChild(celda);
                }
              }

              // agrega la hilera al final de la tabla (al final del elemento tblbody)
              tblBody.appendChild(hilera);
            }

            // posiciona el <tbody> debajo del elemento <table>
            tabla.appendChild(tblBody);
            // appends <table> into <body>
            body.appendChild(tabla);
            // modifica el atributo "border" de la tabla y lo fija a "2";
            tabla.setAttribute("border", "2");
        }   
        
        
        function selectSilla(clicked_id) {
            
            var filas = 14//document.getElementById("filas").value;
            var columnas = 21//document.getElementById("columnas").value;
            
            var count = document.getElementById("count").value;
            var asientos = document.getElementById("asientos").value;
            var asientos_nuevos = document.getElementById("asientos_nuevos").value;
            
            
            function toMatriz(asi) {
                var M = []    
                var idx = 0
                for(var row = 0; row < filas-1; row++) {
                    var hil = "";
                    for(var col = idx; col < idx + 21; col++) {
                        hil = hil + asi[col];

                    }

                    idx = idx + 21;
                    M.push(hil);
                }
                
                return M
            }
            
            
            
             function setCharAt(str,index,chr) {
                if(index > str.length-1) return str;
                return str.substr(0,index) + chr + str.substr(index+1);
            }
            
            M = toMatriz(asientos)
            MN = toMatriz(asientos_nuevos);
            
            
            
            
            //M[1] = setCharAt(M[1], 2, '1');
            //M[3] = setCharAt(M[2], 5, '1');
            
            
            
            /*console.log(gg);
            if(gg <= ${cnt}) {
                console.log("yes");
            } else {
                console.log("no");
            }*/
            
            var id = clicked_id;
            
          
            var str_id = id;
            var idx = str_id.indexOf(",");
            var row = parseInt(str_id.substr(0, idx));
            var col = parseInt(str_id.substr(idx+1,str_id.length - idx - 1));        
            
            
        
            var silla = document.getElementById(id);
            
            
            
            
            if(M[row-1][col-1] != '1') {
                //si la silla esta libre (verde)
                if(silla.src == "http://localhost:8084/Proyecto_Cinerama_Spring/recursos/images/butaca1.png") {

                    if(parseInt(count) + 1 <= ${cnt}) { 
                        var gg = document.getElementById("count").value = parseInt(count) + 1;
                        document.getElementById("count").innerHTML = gg;
                        silla.src = "${pageContext.request.contextPath}/recursos/images/butaca.png";
                        console.log("silla verde");
                        
                        MN[row-1] = setCharAt(MN[row-1], col-1, '1');
     
                    }

                } else {
                    var gg = document.getElementById("count").value = parseInt(count) - 1;
                    document.getElementById("count").innerHTML = gg;
                    silla.src = "${pageContext.request.contextPath}/recursos/images/butaca1.png";
                    console.log("silla roja");
                    MN[row-1] = setCharAt(MN[row-1], col-1, '0');
                }
            }
            
             function toString(Ma) {
                var tot_asi = ""
                for(var i = 0; i < Ma.length; i++) {
                    tot_asi = tot_asi + Ma[i]
                }
                
                return tot_asi
            }
            
            var asie_nuevos = toString(MN);
            document.getElementById("asientos_nuevos").value = asie_nuevos;
           
        }
    </script>
</body>

</html>
