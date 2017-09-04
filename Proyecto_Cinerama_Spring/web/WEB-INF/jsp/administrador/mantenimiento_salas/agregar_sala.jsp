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
                                <form action="guardar_datos_pelicula.htm" method="POST">
                                    <div class="col-lg-8">
                                    <div class="form-group">
                                        <label>Numero de Sala</label>
                                        <input class="form-control" placeholder="Ingrese elnumer de sala" name="numero">
                                    </div>
                                    </div>                        
                                    <div class="col-lg-8">
                                        <br>
                                        <div class="form-group">
                                        <label>Mapa de la Sala</label>
                                          <div class="form-group">
                                                <label>Filas</label>
                                                <input class="" placeholder="" id="filas"><br>
                                                <label>Columnas</label>
                                                <input class="" placeholder="" id="columnas">
                                                <button type="button" class="btn btn-warning btn-md" id="btnConstruir" onclick="fnGenerarButacas()">Generar</button>  
                                            </div>
                                        <div id="map-container">
                                            <div class="screen">PANTALLA</div>
                                            <div class="canvas" style="height: 550px">
                                                <div id="contenedor_butacas">

                                                </div>
                                            </div>
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
                                            <input  class="btn btn-success btn-md" type="submit" value="Guardar"></input>           
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
            function fnGenerarButacas(){
                var filas = document.getElementById("filas").value;
                var columnas = document.getElementById("columnas").value;

                var body = document.getElementById("contenedor_butacas");

                // Crea un elemento <table> y un elemento <tbody>
                var tabla   = document.createElement("table");
                var tblBody = document.createElement("tbody");
                //tabla.setAttribute("width","50");
               // tabla.setAttribute("height","50");
                // Crea las celdas
                for (var i = 0; i < filas; i++) {
                  // Crea las hileras de la tabla
                  var hilera = document.createElement("tr");

                  for (var j = 0; j < columnas; j++) {
                    // Crea un elemento <td> y un nodo de texto, haz que el nodo de
                    // texto sea el contenido de <td>, ubica el elemento <td> al final
                    // de la hilera de la tabla
                    var celda = document.createElement("td");
                    celda.setAttribute("width","35");
                    celda.setAttribute("height","35");
                    var btnImagen = document.createElement("a");
                   // btnImagen.setAttribute("onclick","click_butaca(this)");
                    var id_butaca = "F"+i+"C"+j;
                    btnImagen.setAttribute("id",id_butaca);
                    var imagen = document.createElement("img");
                    imagen.setAttribute("width","35px");
                    imagen.setAttribute("height","35px");
                    imagen.setAttribute("src","${pageContext.request.contextPath}/recursos/images/butaca.png")
                    imagen.setAttribute("id",id_butaca);
                    btnImagen.appendChild(imagen);
                    btnImagen.setAttribute("href","javascript:click_butaca(this)");
                    celda.appendChild(btnImagen);
                    hilera.appendChild(celda);
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
            
        </script>
        <script>
            
            function click_butaca(b){
                b.id="holamundo";
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
