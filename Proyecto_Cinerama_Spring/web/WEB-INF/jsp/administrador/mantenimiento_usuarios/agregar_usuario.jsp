<%-- 
    Document   : agregar_usuario
    Created on : 13-sep-2017, 23:26:30
    Author     : gabri
--%>

<%@page import="java.util.Calendar"%>
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
    <body onload="cargar_formulario_imagenes()">
        <div id="wrapper">
            <jsp:include page="../header_menu.jsp"/>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <h1 class="page-header">
                        <small>Mantenimiento Usuarios</small>
                    </h1>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i></i> Crear Nuevo Usuario</h3>
                        </div>
                        <div class="panel-body">                            
                            <div class="row">   
                                <form action="guardar_datos_usuario.htm" method="POST">
                                    <h3>Información Personal</h3>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Tipo Documento</label>
                                        <select class="form-control" name="tipo_documento" required>
                                            <option value="DNI">DNI</option>
                                            <option value="Pasaporte">Pasaporte</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Número de Documento</label>
                                        <input class="form-control" title="Cadena de 8 números" type="text" name="id" pattern="[0-9]{8,}" required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Nombres</label>
                                        <input class="form-control" type="text" name="nombres" pattern="[A-Za-z ]{2,}" required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Apellido Paterno</label>
                                        <input class="form-control" type="text" name="apellido_paterno" pattern="[A-Za-z ]{2,}" required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Apellido Materno</label>
                                        <input class="form-control" type="text" name="apellido_materno" pattern="[A-Za-z ]{2,}" required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Fecha de Nacimiento</label>
                                        <%
                                        Calendar fechaActual = Calendar.getInstance();
                                        String cadenaFecha = String.format("%04d-%02d-%02d",
                                          fechaActual.get(Calendar.YEAR)-18,
                                          fechaActual.get(Calendar.MONTH)+1,
                                          fechaActual.get(Calendar.DAY_OF_MONTH));
                                        %>
                                        <input class="form-control" title="Usted debe ser mayor de edad" type="date" name="fecha_nacimiento" min="1920-01-01" max="<%=cadenaFecha%>" required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Correo Electrónico</label>
                                        <input class="form-control" type="email" name="correo_electronico" required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Teléfono</label>
                                        <input class="form-control" type="tel" name="telefono" pattern="[0-9]{6,}"required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Estado Civil</label>
                                        <select class="form-control" name="estado_civil" required>
                                            <option value="soltero">Soltero(a)</option>
                                            <option value="casado">Casado(a)</option>
                                            <option value="divorciado">Divorciado(a)</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Ocupación</label>
                                        <input class="form-control" type="text" name="ocupacion" pattern="[A-Za-z ]{6,}" required>
                                    </div>
                                    <br>
                                    <h3>Información de Ubicación</h3>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Departamento</label>
                                        <select class="form-control" name="departamento" required>
                                            <option value="Amazonas">Amazonas</option>
                                            <option value="Áncash">Áncash</option>
                                            <option value="Apurímac">Apurímac</option>
                                            <option value="Arequipa" >Arequipa</option>
                                            <option value="Ayacucho" >Ayacucho</option>
                                            <option value="Cajamarca" >Cajamarca</option>
                                            <option value="Callao" >Callao</option>
                                            <option value="Cusco" >Cusco</option>
                                            <option value="Huancavelica" >Huancavelica</option>
                                            <option value="Huánuco" >Huánuco</option>
                                            <option value="Ica" >Ica</option>
                                            <option value="Junín" >Junín</option>
                                            <option value="La Libertad" >La Libertad</option>
                                            <option value="Lambayeque" >Lambayeque</option>
                                            <option value="Lima" >Lima</option>
                                            <option value="Loreto" >Loreto</option>
                                            <option value="Madre de Dios" >Madre de Dios</option>
                                            <option value="Moquegua" >Moquegua</option>
                                            <option value="Pasco" >Pasco</option>
                                            <option value="Piura" >Piura</option>
                                            <option value="Puno" >Puno</option>
                                            <option value="San Martín" >San Martín</option>
                                            <option value="Tacna" >Tacna</option>
                                            <option value="Tumbes" >Tumbes</option>
                                            <option value="Ucayali" >Ucayali</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Provincia</label>
                                        <input class="form-control" type="text" name="provincia" required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Distrito</label>
                                        <input class="form-control" type="text" name="distrito" required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Dirección</label>
                                        <input class="form-control" type="text" name="direccion" pattern="[A-Za-z0-9.- ]{6,}" required>
                                    </div>    
                                    <h3>Información de Inicio de Sesión</h3>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Contraseña</label>
                                        <input class="form-control" placeholder="Cinerama2017" title="Contraseña debe contener 8 caracteres, incluyendo un numero, una letra en mayúscula y una en minúscula" type="text" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" value="Cinerama2017" required>
                                    </div>
                                    <div class="col-md-6 col-xs-12 form-group">
                                        <label>Nivel de Acceso</label>
                                        <select class="form-control" name="nivel_acceso" required>
                                            <option value="usuario">Usuario</option>
                                            <option value="vendedor">Vendedor</option>
                                            <option value="administrador">Administrador</option>
                                        </select>
                                    </div>
                                    <div class="clearfix"> </div>
                                    <br>
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
                                                    <h4 class="modal-title">VENTANA DE CONFIRMACIÓN</h4>
                                                  </div>
                                                  <div class="modal-body">
                                                    <p>¿Esta seguro que desea guardar los datos del nuevo usuario?.</p>
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
            function cancelar(){
                location.href="index_peliculas.htm";
            }
            function limpiar(){
                var inputs = document.getElementsByTagName("input");                
                for(var i=0;i<inputs.length;i++){
                    if(inputs[i].value != "Guardar")
                        inputs[i].value = "";                      
                }
                var generos = document.getElementById("generos").getElementsByTagName("input");
                for(var i=0;i<inputs.length;i++){
                    inputs[i].checked = false;                  
                }
                document.getElementById("sinopsis").innerHTML = "";
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

