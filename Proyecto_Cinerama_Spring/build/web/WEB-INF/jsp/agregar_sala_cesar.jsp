<%-- 
    Document   : menu
    Created on : 16/08/2017, 07:37:59 PM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
         <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cinerama | Administrador</title>
        
        <!-- Bootstrap Core CSS -->
        
         <link href="${pageContext.request.contextPath}/recursos/css/bootstrap.min.css" rel="stylesheet">
       
        <link href="${pageContext.request.contextPath}/recursos/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link type="image/x-icon" rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/images/favicon.png">
        
        
        <link href="<c:url value="/recursos/css/bootstrap.css"/>" rel='stylesheet' type='text/css'>
        <link href="<c:url value="/recursos/css/style.css"/>" rel="stylesheet" type="text/css" media="all">
        <!-- Custom CSS -->
       <link href="${pageContext.request.contextPath}/recursos/css/sb-admin.css" rel="stylesheet">
        <link href="../../css/mapa_sala.css" rel="stylesheet">
        <!-- Morris Charts CSS -->
        <link href="${pageContext.request.contextPath}/recursos/css/plugins/morris.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="../../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link type="image/x-icon" rel="shortcut icon" href="../images/favicon.png">
        <script language="javascript" src="../../js/motor.js"></script>
        <script language="javascript" src="../../js/cargaimagen.js"></script>
        
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
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="">Cinerama Administrador</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Cesar Achahui<b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="../../Vistas/bienvenido.html"><i class="fa fa-fw fa-user"></i> Perfil</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Opciones</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="../index.html"><i class="fa fa-fw fa-power-off"></i> Salir</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="../index.html"><i class="fa fa-fw fa-dashboard"></i> Panel</a>
                    </li>
                    <li>
                        <a href=""><i class="fa fa-fw fa-bar-chart-o"></i> Estadísticas</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Mantenimiento <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Usuarios</a>
                            </li>
                            <li>
                                <a href="#">Clientes</a>
                            </li>
                            <li>
                                <a href="">Productos de Dulcería</a>
                            </li>
                            <li>
                                <a href="index_salas.jsp">Salas</a>
                            </li>
                            <li>
                                <a href="../MantenimientoPeliculas/index_peliculas.jsp">Peliculas</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>
        <div id="page-wrapper">
            <div class="container-fluid">
                <div id="contenido">
                    <h1 class="page-header">
                    <small>Mantenimiento Salas</small>
                </h1>

        
                    <ol class="breadcrumb">
                        Agregar Nueva Sala
                   </ol>
                    <div class="row">                    
                        <br>
                        <form action="guardar_datos_pelicula.jsp" method="POST">
                            <div class="col-lg-8">
                            <div class="form-group">
                                <label>Numero de Sala</label>
                                <input class="form-control" placeholder="Ingrese el titulo de la pelicula" name="numero">
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
                                <img src="${pageContext.request.contextPath}/recursos/images/butaca_1.png" width="50" height="50">
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
            <!-- /.container-fluid -->
               <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
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
                var imagen = document.createElement("img");
                imagen.setAttribute("width","35px");
                imagen.setAttribute("height","35px");
                imagen.setAttribute("align","center");
                imagen.setAttribute("src","${pageContext.request.contextPath}/recursos/images/butaca1.png")
                btnImagen.appendChild(imagen);
                btnImagen.setAttribute("href","nose.jsp");
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
    
    <script src="../../js/jquery.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="../../js/bootstrap.min.js"></script>
    <!-- Morris Charts JavaScript -->
    <script src="../../js/plugins/morris/raphael.min.js"></script>
    <script src="../../js/plugins/morris/morris.min.js"></script>
    <script src="../../js/plugins/morris/morris-data.js"></script>
    </body>
</html>
