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
                                    </div>
                                    
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                              <label>Abrir Imagen de la Pelicula</label>
                                               <input type="file" id="imagen" name="files[]"/>
                                                <br />
                                                <output id="list"></output>                                                                       
                                        </div>                       
                                    </div>    
                                    <div class="col-lg-12">
                                        <br>
                                        <div class="form-group">
                                            <input  class="btn btn-success btn-md" type="submit" value="Guardar"></input>           
                                            <button type="button" class="btn btn-warning btn-md" onclick="limpiar()">Limpiar</button>    
                                            <button type="button" class="btn btn-danger btn-md" onclick=cancelar()"">Cancelar</button>   
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
