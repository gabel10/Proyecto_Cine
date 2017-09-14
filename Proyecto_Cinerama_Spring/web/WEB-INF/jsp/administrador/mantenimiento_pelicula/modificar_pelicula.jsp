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
        <link href="${pageContext.request.contextPath}/recursos/css/input_file.css" rel="stylesheet">
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
    <body onload="recuperar_genero(),cargar_formulario_imagenes()">
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
                                <form action="modificar_datos_pelicula.htm" method="POST">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Id Pelicula</label>
                                            <input id ="id" class="form-control"  name="id" value="${id}" readonly>
                                        </div>
                                        <div class="form-group">
                                            <label>Titulo de la Pelicula</label>
                                            <input class="form-control" placeholder="Ingrese el titulo de la pelicula" name="titulo" value="${dato.get("titulo")}">
                                        </div>
                                        <div id="generos" class="form-group">
                                            <label>Genero</label>
                                            <div class="checkbox">
                                                <label>
                                                    <input id="comedia" type="checkbox" onchange="actualizar_genero()">Comedia                                               
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input id="suspenso" type="checkbox" onchange="actualizar_genero()">Suspenso
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input id="terror" type="checkbox" onchange="actualizar_genero()">Terror
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input id="ciencia_ficcion" type="checkbox" onchange="actualizar_genero()">Ciencia Ficcion
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input id="animacion" type="checkbox" onchange="actualizar_genero()">Animación
                                                </label>
                                            </div>   
                                            <div class="checkbox">
                                                <label>
                                                    <input id="accion" type="checkbox" onchange="actualizar_genero()">Acción
                                                </label>
                                            </div> 
                                        </div>
                                        <div>
                                            <input id="genero" type="text" name="genero" style="display:none;" value="${dato.get("genero")}">                                                
                                        </div>
                                        <div class="form-group">
                                            <label>URL Trailer</label>
                                            <input class="form-control" placeholder="URL del trailer de la pelicula" name="trailer" value="${dato.get("url_trailer")}">

                                        </div> 
                                        <div class="form-group">
                                            <label>Pais</label>
                                            <select class="form-control" name="pais" value="${dato.get("pais")}">
                                                <option>Estados Unidos</option>
                                                <option>Francia</option>
                                                <option>España</option>
                                                <option>Peru</option>
                                                <option>Japon</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Duracion</label>
                                                <input id="horas" class="form-control" placeholder="Horas : Minutos" name="duracion" value="${dato.get("duracion")}">
                                        </div>
                                        <div class="form-group"> 
                                             <label>Fecha Estreno</label><br>
                                             <input type="date" name="fecha_estreno" value="${dato.get("fecha_estreno")}"> 
                                        </div>
                                        <div class="form-group">
                                            <label>Sinopsis</label>
                                            <textarea id="sinopsis" class="form-control" rows="3" name="sinopsis">${dato.get("sinopsis")}</textarea>
                                        </div>  
                                        <div class="form-group">
                                            <label>Actores</label>
                                            <textarea id="actores" class="form-control" rows="3" name="actores">${dato.get("actores")}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Directores</label>
                                            <textarea id="directores" class="form-control" rows="3" name="directores">${dato.get("directores")}</textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <a type="button" class="btn btn-warning btn-md" data-toggle="modal" data-target="#modal_index_imagenes" onclick="cargar_lista_imagenes()">Elegir Poster de Pelicula</a><br><br>   
                                              <div id="imagen" class="movie_image" height="">
                                                  <label id="nombre_imagen_label"></label><br>
                                                  <img id="poster_imagen" src="mostrar_imagen.htm?imagen=${dato.get("nombre_imagen")}" style ="width: 280px; height: 400px">                                          
                                              </div>    
                                              <input id="nombre_poster" type="text" name="nombre_poster" style="display:none;" value="${dato.get("nombre_imagen")}">       
                                        </div>                       
                                    </div>       
                                    <div class="col-lg-12">
                                        <br>
                                        <div class="form-group">
                                            <input  class="btn btn-success btn-md" type="submit" value="Guardar"></input>           
                                            <button type="button" class="btn btn-warning btn-md" onclick="limpiar()">Limpiar</button>    
                                            <button type="button" class="btn btn-danger btn-md" onclick=cancelar()"">Cancelar</button>  
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
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--MODALS-->
        <!-- Modal -->
        <div id="modal_index_imagenes" class="modal fade container-fluid" role="dialog" >
          <div class="modal-dialog modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Imagenes</h4>
                
              </div>
              <div class="modal-body">  
                  <div id ="contenedor">
                      
                  </div>
              </div>             
              <div class="modal-footer">
                 <div class="form-group">                    
                    <button type="button" class="btn btn-success btn-md" data-dismiss="modal">Cerrar</button>
                    
                 </div>
              </div>
            </div>

          </div>
        </div>
                                
        <script>
            
            
            function obtener_nombre_imagen(imagen){
                var nombre = document.getElementById("nombre_imagen_label");
                nombre.innerHTML = imagen.value;
                var img = document.getElementById("poster_imagen");
                img.src = "mostrar_imagen.htm?imagen="+imagen.value;
                var input_poster = document.getElementById("nombre_poster");
                input_poster.value = imagen.value;
            }
            function cargar_formulario_imagenes(){
                $.ajax({
                  url: "agregar_imagen.htm",
                  contentType: false,
                  cache: false,
                  processData: false,
                  success: function (result) {
                    $("#contenedor").html(result);
                  }
                });  
            }
            function cargar_lista_imagenes(){
                
                $(document).ready(function(e){
                    $(".img-check").click(function(){
                        $(this).toggleClass("check");
                    });
                });
                event.preventDefault();
                $.ajax({
                  url: "lista_imagenes.htm",
                  contentType: false,
                  cache: false,
                  processData: false,
                  success: function (result) {
                    $("#imagenes_tabla").html(result);                    
                  }
                });     
            }
            function subir_imagen(){    
                          
                $('#formulario_imagen').submit(function () {
                    event.preventDefault();
                    var formData = new FormData(this);
                    
                    $.ajax({
                      url: "procesar_subida_imagen.htm",
                      type: 'POST',
                      data: formData,
                      contentType: false,
                      cache: false,
                      processData: false,
                      success: function (result) {
                        var nombre = document.getElementById("nombre_imagen_previa");
                        if(result == 'EXITO'){
                            alert("Se guardo con exito");
                            cargar_lista_imagenes();
                            document.getElementById("contenedor").innerHTML="";
                            cargar_formulario_imagenes();
                        }else{
                            nombre.innerHTML = "No se guardo imagen.";
                        }
                        $("#btn_abrir_imagen_previa").value = "";  
                      }
                    });
                    return true;
                }); 
                 
                
            }
            function readImagen(input) {
                if (input.files && input.files[0]) {
                  var reader = new FileReader();
                  reader.onload = function (e) {
                    $('#imagen_previa')
                      .attr('src', e.target.result)
                      .width(200)
                      .height(250);
                  };
                  reader.readAsDataURL(input.files[0]);
                  var nombre = document.getElementById("nombre_imagen_previa");
                  nombre.innerHTML = document.getElementById('btn_abrir_imagen_previa').files[0].name;;
                }
            }
            
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
