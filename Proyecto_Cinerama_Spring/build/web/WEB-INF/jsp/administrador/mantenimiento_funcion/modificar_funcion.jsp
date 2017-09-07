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
    <body onload="recuperar_genero()">
        <div id="wrapper">
            <jsp:include page="../header_menu.jsp"/>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <h1 class="page-header">
                        <small>Mantenimiento Peliculas</small>
                    </h1>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i></i> Modificar Pelicula</h3>
                        </div>
                        <div class="panel-body">                            
                            <div class="row">   
                                <form action="modificar_datos_funcion.htm" method="POST">
                                      <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Id Funcion</label>
                                            <input id ="id" class="form-control"  name="id" value="${id}" readonly>
                                        </div>
                                          
                                        <div class="form-group">
                                            <label>Horario</label>
                                            <input class="form-control" placeholder="Horas : Minutos" name="horario"  value="${dato.get("horario")}">
                                        </div>
                                        
                                    <div class="col-xs-12 col-md-9 login-left">
                                        <br><br>    
                                       <table class="table table-striped">
                                        <thead>
                                          <tr>
                                            <th ></th>
                                            <th >Cargar</th>
                                            
                                          </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                              <td>Peliculas</td>
                                              <td>
                                                <select id="mySelect1" class="form-control" title="Elija la pelicula." name="id_pelicula" onchange="myFunction1()">
                                                  <option >Seleccion una pelicula.</option>
                                                  
                                                    <c:forEach items="${peliculas}" var="datop">
                                                        <c:choose>
                                                            <c:when test="${dato.get('id_pelicula').equals(datop.get('_id'))}">
                                                                <option value="${datop.get("_id")}" selected  >${datop.get("titulo")}</option>   
                                                            </c:when>
                                                            <c:otherwise>
                                                                <option value="${datop.get("_id")}"  >${datop.get("titulo")}</option> 
                                                            </c:otherwise>
                                                        </c:choose>
                                                        
                                                        
                                                    </c:forEach>
                                                  
                                                </select>

                                              </td>
                                              
                                          </tr>
                                          <tr>
                                            <td>Salas</td>
                                            
                                            <td><select id="mySelect2" class="form-control" title="Elija la Sala" name="id_sala" onchange="myFunction2()">>
                                                    <option>Seleccion una sala.</option>
                                                    
                                                    <c:forEach items="${salas}" var="datox">
                                                        <c:choose>
                                                        <c:when test="${dato.get('id_sala').equals(datox.get('_id'))}">
                                                                <option value="${datox.get("_id")}" selected  >${datox.get("_id")}</option>   
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${datox.get("_id")}"  >${datox.get("_id")}</option> 
                                                        </c:otherwise>
                                                            </c:choose>
                                                    </c:forEach>


                                            </select></td>
                                            
                                          </tr>


                                        </tbody>
                                      </table>
  
                                    </div>
                                    
                                   
                                    <div class="col-lg-12">
                                        <br>
                                        <div class="form-group"> 
                                            <button type="button" class="btn btn-success btn-md" data-toggle="modal" data-target="#myModal">Guardar</button>
                                            <button type="button" class="btn btn-warning btn-md" onclick="limpiar()">Limpiar</button>    
                                            <button type="button" class="btn btn-danger btn-md" onclick="cancelar()">Cancelar</button> 
                                             <!-- Modal -->
                                            <div id="myModal" class="modal fade" role="dialog">
                                              <div class="modal-dialog">

                                                <!-- Modal content-->
                                                <div class="modal-content">
                                                  <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                    <h4 class="modal-title">VENTANA DE CONFIRMACION</h4>
                                                  </div>
                                                  <div class="modal-body">
                                                    <p>¿Esta seguro que desea guardar los datos de la pelicula?.</p>
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
                                </div>
                                    
                                   
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function cancelar(){
                location.href="index_peliculas.htm";
            }
            function limpiar(){
                var inputs = document.getElementsByTagName("input");
                document.getElementById("sinopsis").innerHTML = "";
                for(var i=0;i<inputs.length;i++){
                    if(inputs[i].value != "Guardar" && inputs[i].id != "id")
                        inputs[i].value = "";                      
                }
                var generos = document.getElementById("generos").getElementsByTagName("input");
                for(var i=0;i<inputs.length;i++){
                    inputs[i].checked = false;                  
                }
            }
            function recuperar_genero(){
                var generos = document.getElementById("genero").value;
                var g = generos.split(",");                
                for(var i = 0;i<g.length;i++){
                    document.getElementById(g[i]).checked = true;
                }
            }
            function actualizar_genero(){
                var generos = document.getElementById("generos").getElementsByTagName("input");
                var lista_generos = "";
                for(var i=0;i<generos.length;i++){
                    if(generos[i].checked){
                        if(lista_generos != "")
                            lista_generos = lista_generos + ",";
                        lista_generos = lista_generos + generos[i].getAttribute("id");
                        
                    }                
                }
                document.getElementById("genero").value = lista_generos;
                
            }
            function archivo(evt) {
                var files = evt.target.files; // FileList object
                // Obtenemos la imagen del campo "file".
                for (var i = 0, f; f = files[i]; i++) {
                  //Solo admitimos imágenes.
                  if (!f.type.match('image.*')) {
                      continue;
                  }
                  var reader = new FileReader();
                  reader.onload = (function(theFile) {
                      return function(e) {
                        // Insertamos la imagen
                       document.getElementById("list").innerHTML = ['<img class="thumb" src="', e.target.result,'" title="', escape(theFile.name), '"/>'].join('');
                      };
                  })(f);
                  reader.readAsDataURL(f);
                }
            }
            document.getElementById('imagen').addEventListener('change', archivo, false);
        </script>   
        <!-- jQuery -->
        <script src="${pageContext.request.contextPath}/recursos/js/jquery.js"></script>
        <!-- Bootstrap Core JavaScript -->
        <script src="${pageContext.request.contextPath}/recursos/js/bootstrap.min.js"></script>
        <!-- Morris Charts JavaScript -->
        <script src="${pageContext.request.contextPath}/recursos/js/plugins/morris/raphael.min.js"></script>
        <script src="${pageContext.request.contextPath}/recursos/js/plugins/morris/morris.min.js"></script>
        <script src="${pageContext.request.contextPath}/recursos/js/plugins/morris/morris-data.js"></script>
    </body>
</html>
