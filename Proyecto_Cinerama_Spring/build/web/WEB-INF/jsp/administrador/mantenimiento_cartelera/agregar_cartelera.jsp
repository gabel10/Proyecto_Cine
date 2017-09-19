<%-- 
    Document   : agregar_pelicula
    Created on : 29/08/2017, 02:24:11 AM
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
        <!-- Custom CSS -->
        <link href="${pageContext.request.contextPath}/recursos/css/sb-admin.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/recursos/css/input_file.css" rel="stylesheet">
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
    <body onload="cargar_lista_peliculas()">
        <div id="wrapper">
            <jsp:include page="../header_menu.jsp"/>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <h1 class="page-header">
                        <small>Mantenimiento Cartelera</small>
                    </h1>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i></i> Agregar Nueva Cartelera</h3>
                        </div>
                        <div class="panel-body">                            
                            <div class="row">   
                                <form action="guardar_datos_cartelera.htm" method="POST">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Pelicula</label>
                                            <select id="id_pelicula" class="form-control" title="Elija la pelicula." name="id_pelicula" >
                                                <option>Seleccion una pelicula.</option>                                                  
                                                <c:forEach items="${peliculas}" var="dato">
                                                        <option value="${dato.get("_id")}"  >${dato.get("titulo")}</option>      
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group"> 
                                             <label>Fecha de la Cartelera</label><br>
                                             <input type="date" name="fecha_cartelera" class="form-control">  
                                        </div>
                                        <div class="form-group">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h3 class="panel-title"><i></i> Agregar Funciones 
                                                        <button class="btn btn-default btn-md" onclick="agregar_funcion()"> + </button>
                                                    </h3>
                                                    
                                                </div>
                                                <div class="panel-body">  
                                                    <div id="funciones" >
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                       
                                                                       
                                    </div>
                                    
                                    <div class="col-lg-6">
                                                         
                                    </div>    
                                    <div class="col-lg-12">
                                        <input id="horarios" type="text" name="horarios">
                                        <input id="salas" type="text" name ="salas">
                                        <br>
                                        <div class="form-group"> 
                                            <button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#myModal"  onclick="cargar_inputs_funciones()">Guardar</button>
                                            <button type="button" class="btn btn-warning btn-md" onclick="limpiar()">Limpiar</button>    
                                            <button type="button" class="btn btn-danger btn-md" onclick="cancelar()">Cancelar</button> 
                                             <!-- Modal -->
                                             <div id="myModal" class="modal fade" role="dialog" >
                                              <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                  <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">VENTANA DE CONFIRMACION</h4>
                                                  </div>
                                                  <div class="modal-body">
                                                    <p>¿Esta seguro que desea guardar los datos de la cartelera?.</p>
                                                  </div>
                                                  <div class="modal-footer">
                                                     <div class="form-group"> 
                                                        <input  class="btn btn-success btn-md" type="submit" value="Guardar" ></input> 
                                                        <button type="button" class="btn btn-danger btn-md" data-dismiss="modal">Cancelar</button>
                                                     </div>
                                                  </div>
                                                </div>

                                              </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        

        <script>
           var cont_funciones = 0;
           
           
           
           function agregar_funcion(){
               event.preventDefault();
                $.ajax({
                  url: "agregar_funcion.htm",
                  contentType: false,
                  cache: false,
                  processData: false,
                  success: function (result) {
                    var funciones = document.getElementById("funciones");
                    var div_funcion = document.createElement("div");
                    var id_funcion = cont_funciones;
                    div_funcion.setAttribute("id",id_funcion);
                    div_funcion.innerHTML = result;
                    var boton = div_funcion.getElementsByTagName("button")[0];
                    boton.name = cont_funciones;
                    funciones.appendChild(div_funcion);
                    cont_funciones = cont_funciones + 1;
                    //cargar_inputs_funciones();
                  }
                }); 
           }
           
           function eliminar_funcion(btn){
               event.preventDefault();
               var f = document.getElementById(btn.name);
               document.getElementById("funciones").removeChild(f);
               alert(btn.name);
           }
           function cargar_inputs_funciones(){
               var f = document.getElementById("funciones");
               var salas = f.getElementsByTagName("select");
               var horarios = f.getElementsByTagName("input");
               var s = "";
               var h = "";
               for(var i = 0;i<salas.length;i++){
                   s = s + salas[i].value;
                   h = h + horarios[i].value;
                   if(i < salas.length-1){
                      s = s +","; 
                      h = h + ",";
                   }
               }
               document.getElementById("salas").value = s;
               
               document.getElementById("horarios").value = h;
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
    </body>
</html>
