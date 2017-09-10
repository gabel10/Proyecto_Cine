<%-- 
    Document   : agregar_sala
    Created on : 04/09/2017, 12:08:31 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cinerama | Administrador</title>
        <link href="${pageContext.request.contextPath}/recursos/css/mapa_sala.css" rel="stylesheet">
        <!-- Bootstrap Core CSS -->
        <link href="${pageContext.request.contextPath}/recursos/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/recursos/css/sb-admin.css" rel="stylesheet">
        <!-- Morris Charts CSS -->
        <link href="${pageContext.request.contextPath}/recursos/css/plugins/morris.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="${pageContext.request.contextPath}/recursos/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link type="image/x-icon" rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/images/favicon.png">
        <style>
          .thumb {
            height: 300px;
            border: 1px solid #000;
            margin: 10px 5px 0 0;
          }
        </style>        
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="../header_menu.jsp"/>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <h1 class="page-header">
                        <small>Mantenimiento Salas</small>
                    </h1>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i></i> Agregar Nueva Sala</h3>
                        </div>
                        <div class="panel-body">                            
                            <div class="row">   
                                <form action="guardar_datos_sala.htm" method="POST" id="formulario">
                                    <div class="col-lg-8">
                                    <div class="form-group">
                                        <label>Numero de Sala</label>
                                        <input class="form-control" placeholder="Ingrese numero de sala" name="numero">
                                    </div>
                                    </div>                        
                                    <div class="col-lg-8">
                                        <br>
                                        <div class="form-group">
                                            <label>Mapa de la Sala</label>
                                              <div class="form-group">
                                                    <label>Filas</label>
                                                    <input class="" placeholder="" id="filas" name="filas"><br>
                                                    <label>Columnas</label>
                                                    <input class="" placeholder="" id="columnas" name="columnas">
                                                    <button type="button" class="btn btn-warning btn-md" id="btnConstruir" onclick="fnGenerarButacas()">Generar</button>  
                                                </div>
                                            <div id="map-container">
                                                <div class="screen">PANTALLA</div>
                                                <div class="canvas" style="height: 550px">
                                                    <br><br><br>
                                                    <div id="contenedor_butacas">

                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <input id="butacas" type="text" name="butacas"style="display:none;">                                                
                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-lg-4">
                                    <div class="form-group">
                                        <br><br><br><br>
                                        <h2>Elementos</h2>
                                        <label>butaca   </label>
                                        <img src="${pageContext.request.contextPath}/recursos/images/butaca.png" width="50" height="50">
                                    </div>
                                    </div> 
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <input  class="btn btn-success btn-md" type="button" value="Guardar" onclick="enviar_form()"></input>           
                                            <button type="button" class="btn btn-warning btn-md">Limpiar</button>    
                                            <button type="button" class="btn btn-danger btn-md">Cancelar</button>   
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
       
        <!-- jQuery -->
         <script>        
            var array_butacas = new Array(1);
            var filas=0;
            var columnas = 0;
            var letras = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];

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
                    cont_nombre.setAttribute("onclick","click_butaca(this.id)");                   
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
                        if(estado[0] == "1"){
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
        </script>
        
        <script src="${pageContext.request.contextPath}/recursos/js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/recursos/js/bootstrap.min.js"></script>
        <!-- Morris Charts JavaScript -->
        <script src="${pageContext.request.contextPath}/recursos/js/plugins/morris/raphael.min.js"></script>
        <script src="${pageContext.request.contextPath}/recursos/js/plugins/morris/morris.min.js"></script>
        <script src="${pageContext.request.contextPath}/recursos/js/plugins/morris/morris-data.js"></script>
    </body>
</html>
