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
        <link href="${pageContext.request.contextPath}/recursos/css/mapa_sala.css" rel="stylesheet">
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
    <body onload="cargar_butacas()">
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
                            
                            <div class="form-group" style="display:none;">
                                <input class="" placeholder="" id="filas" name="filas" value="${sala.get("filas")}" style="display:none;"><br>
                                <input class="" placeholder="" id="columnas" name="columnas" value="${sala.get("columnas")}" style="display:none;">
                            </div>
                            <label>Elija  sus butacas.</label>
                            <div class="form-group">
                                <label>Mapa de la Sala</label>                                  
                                <div id="map-container">
                                    <div class="screen">PANTALLA</div>
                                    <div class="canvas" style="height: 550px">
                                        <br><br><br>
                                        <div id="contenedor_butacas">

                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <input id="butacas" type="text" name="butacas"style="display:none;" value="${sala.get("butacas")}">    
                                    <input id="butacas_ocupadas" type="text" name="butacas"style="display:none;" value="${funcion.get("butacas_ocupadas")}">
                                    
                                    <form id="formulario" method="GET" action="confirmar_reserva.htm" style="display:none;">
                                        <input id="id_funcion" name="id_funcion" type="text" name="butacas"style="" value="${funcion.get("_id")}" >  
                                        <input id="id_pelicula" name="id_pelicula" type="text" name="butacas"style="" value="${pelicula.get("_id")}" >  
                                        <input id="butacas_seleccionadas" name="butacas_seleccionadas" type="text" name="butacas"style="" >  
                                        <input id="cant_butacas" name="cant_butacas" type="text" name="butacas"style="" value="${cantbutacas}">  
                                        <input id="suma_total" name="suma_total" type="text" name="butacas"style="" value="${sumatotal}">  
                                    </form>
                                    
                                </div>
                            </div>
                              
                            <a href="single.htm" class="btn btn-warning" role="button">Regresar</a>
                            <a class="btn btn-danger" role="button" onclick="fnReservar()">Reservar</a>
                        </div>                        
                    </div>
                </div>
            </div>  
        </div>
        <jsp:include page="footer_home.jsp"/>   
    </body>
     <!-- jQuery -->
         <script>        
            var array_butacas = new Array(1);
            var filas=0;
            var columnas = 0;
            var letras = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

            
            function cargar_butacas(){
                
                
                filas = document.getElementById("filas").value;
                columnas = document.getElementById("columnas").value; 
                fnGenerarButacas();
                var butacas = document.getElementById("butacas").value
                var array_b = butacas.split("");                
                array_butacas = array_b;
                for(var i = 0;i<array_butacas.length;i++){
                    if(array_butacas[i] == "0"){
                        click_butaca(i);
                    }
                }
                //alert(cont);
                asignar_numero_butacas();
                marcar_butacas_ocupadas();
            }
            function marcar_butacas_ocupadas(){
                var ocupados = document.getElementById("butacas_ocupadas").value; 
                var arrays_ocupados= ocupados.split(",");
                //alert(arrays_ocupados.length);
                for(var i = 0;i<arrays_ocupados.length;i++){
                    if(arrays_ocupados[i] != ""){
                        var butaca = document.getElementById(arrays_ocupados[i].toString());
                        //alert(butaca.id);
                        butaca.onclick="";
                        butaca.style="text-align: center; vertical-align:middle;background-image:url('${pageContext.request.contextPath}/recursos/images/butaca_ocupada.png'); background-repeat: no-repeat;background-size: 40px 40px;color: #000;font-size: x-small;font-weight: bold; width: 40px; height:40px";
                    }
                }
                
            }
            function enviar_form(){
                llenar_input_butacas();
                document.getElementById("formulario").submit();
            }
            function llenar_input_butacas(){
                
                var cadena = "";
                for(var i = 0;i<array_butacas.length;i++){
                    var c = array_butacas[i].toString();
                    cadena = cadena +c;
                }                
                document.getElementById("butacas").value = cadena;
            }
            function fnGenerarButacas(){
                document.getElementById("contenedor_butacas").innerHTML="";
                filas = document.getElementById("filas").value;
                columnas = document.getElementById("columnas").value;
                array_butacas = new Array(filas*columnas);
                body = document.getElementById("contenedor_butacas");
                

                // Crea un elemento <table> y un elemento <tbody>
                var tabla   = document.createElement("table");
                var tblBody = document.createElement("tbody");
                tabla.setAttribute("id","sala_butacas");
               // tabla.setAttribute("height","50");
                // Crea las celdas
                var cont = 0;
                for (var i = 0; i < filas; i++) {
                  // Crea las hileras de la tabla
                  var hilera = document.createElement("tr");

                  for (var j = 0; j < columnas; j++) {
                    // Crea un elemento <td> y un nodo de texto, haz que el nodo de
                    // texto sea el contenido de <td>, ubica el elemento <td> al final
                    // de la hilera de la tabla
                    var celda = document.createElement("td");
                    celda.setAttribute("style",";background-size: 40px 40px;");
                    var btnImagen = document.createElement("a");     
                    var cont_nombre = document.createElement("div");
                    cont_nombre.setAttribute("lang","1,"+i+","+j);
                    cont_nombre.setAttribute("style","text-align: center; vertical-align:middle;background-image:url('${pageContext.request.contextPath}/recursos/images/butaca.png'); background-repeat: no-repeat;background-size: 40px 40px;color: #fff;font-size: x-small;font-weight: bold; width: 40px; height:40px")
                    cont_nombre.setAttribute("width","40");
                    cont_nombre.setAttribute("height","40");
                    var id_butaca = letras[i]+j; 
                    cont_nombre.setAttribute("id",cont);                    
                    cont_nombre.setAttribute("onclick","click_butaca_reservar(this.id)");                   
                    cont_nombre.innerHTML=""+id_butaca+"";  
                  
                    celda.appendChild(cont_nombre);
                    hilera.setAttribute("height","40");
                    hilera.appendChild(celda);
                    
                    array_butacas[cont] = "1";
                    cont++;
                  }

                  // agrega la hilera al final de la tabla (al final del elemento tblbody)
                  tblBody.appendChild(hilera);
                }

                // posiciona el <tbody> debajo del elemento <table>
                tabla.appendChild(tblBody);
                // appends <table> into <body>
                body.appendChild(tabla);
                // modifica el atributo "border" de la tabla y lo fija a "2";
               // tabla.setAttribute("border", "2");
            }
            
        </script>
        <script>
            var fila = 0;
            var columna = 0;
            
           
            
            function asignar_numero_butacas(){
                var butacas = document.getElementById("contenedor_butacas");
                var filas = butacas.getElementsByTagName("tr");
                for(var i = 0;i<filas.length;i++){
                    var btcas = filas[i].getElementsByTagName("div");
                    for(var j=0;j<btcas.length;j++){
                        var butaca = btcas[j];
                        var estado = butaca.lang.split(",");
                        if(estado[0] == "1" || estado[0] == "2"){
                            var id_butaca = letras[fila]+columna; 
                            butaca.innerHTML=""+id_butaca+"";   
                            columna++;
                        }                
                    }
                    fila++;
                    columna = 0;
                }
                fila = 0;
                
            }
            function click_butaca(b){
                var butaca = document.getElementById(b);
               
                var estado = butaca.lang.split(",");
                var i = estado[1].toString();
                var j = estado[2].toString();
               if(estado[0] == "1"){
                    butaca.lang = "0,"+i+","+j;
                    array_butacas[parseInt(b)] = "0";
                    butaca.style="text-align: center; vertical-align:middle;background-image:url('${pageContext.request.contextPath}/recursos/images/vacio.png'); background-repeat: no-repeat;background-size: 40px 40px;color: #fff;font-size: x-small;font-weight: bold; width: 40px; height:40px";
                }else{
                    butaca.lang = "1,"+i+","+j;
                    array_butacas[parseInt(b)] = "1";
                    butaca.style="text-align: center; vertical-align:middle;background-image:url('${pageContext.request.contextPath}/recursos/images/butaca.png'); background-repeat: no-repeat;background-size: 40px 40px;color: #fff;font-size: x-small;font-weight: bold; width: 40px; height:40px";
                }
               console.log(butaca.id);
               // alert(butaca.name);
               asignar_numero_butacas();

            }
            
            
            function click_butaca_reservar(b){
                var butaca = document.getElementById(b);
                var reservados= document.getElementById("butacas_seleccionadas").value;
                var lista_reservados = reservados.split(",");
                var long = 0;
                for(var i = 0;i<lista_reservados.length;i++){
                    if(lista_reservados[i] != ""){
                        long++;
                    }
                }
                //alert(long);
                var long2 = parseInt(document.getElementById("cant_butacas").value);
                
                
                    var estado = butaca.lang.split(",");
                    var i = estado[1].toString();
                    var j = estado[2].toString();
                   if(estado[0] == "1"){
                       //alert(long + " ," +long2);
                       if(parseInt(long) < parseInt(long2) ){
                            butaca.lang = "2,"+i+","+j;
                            array_butacas[parseInt(b)] = "2";
                            butaca.style="text-align: center; vertical-align:middle;background-image:url('${pageContext.request.contextPath}/recursos/images/butaca_s.png'); background-repeat: no-repeat;background-size: 40px 40px;color: #000;font-size: x-small;font-weight: bold; width: 40px; height:40px";
                        }
                        else{
                           alert("Ya selecciono todas sus Butacas");
                        }
                    }else{
                        butaca.lang = "1,"+i+","+j;
                        array_butacas[parseInt(b)] = "1";
                        butaca.style="text-align: center; vertical-align:middle;background-image:url('${pageContext.request.contextPath}/recursos/images/butaca.png'); background-repeat: no-repeat;background-size: 40px 40px;color: #fff;font-size: x-small;font-weight: bold; width: 40px; height:40px";
                    }
                    Obtener_Butacas_Seleccionadas();
                   console.log(butaca.id);
                   
               
               // alert(butaca.name);
              // asignar_numero_butacas();

            }
            function Obtener_Butacas_Seleccionadas(){
            var seleccionadas="";
            var cont = 0;
                for(var i = 0;i<array_butacas.length;i++){
                    if(array_butacas[i] == "2"){
                        if(cont == 0){
                            seleccionadas = seleccionadas +i.toString();    
                        }
                        else{
                            seleccionadas = seleccionadas + ","+i.toString();
                        }
                        cont++;
                    }
                }
                var bu = document.getElementById("butacas_seleccionadas");
                bu.value = seleccionadas;
                //alert(document.getElementById("butacas_seleccionadas").value.split(",").length);
            }
            
            function fnReservar(){
                var ocu = document.getElementById("butacas_ocupadas").value;
                var selec =document.getElementById("butacas_seleccionadas").value;
                if(ocu != ""){
                    document.getElementById("butacas_seleccionadas").value = ocu+","+selec;
                }
                $('#formulario').submit();


                
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
