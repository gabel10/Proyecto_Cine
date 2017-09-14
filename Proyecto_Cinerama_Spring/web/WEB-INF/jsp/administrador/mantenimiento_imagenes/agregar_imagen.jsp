<%-- 
    Document   : agregar_imagen
    Created on : 12/09/2017, 08:27:50 AM
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form id="formulario_imagen" method="post" enctype="multipart/form-data" >
                    <div class="row">
                        <div class="col-lg-8" id="lista-imagenes" style="height: 370px; overflow: auto">
                            <label>Lista Imagenes</label>
                            <div id="imagenes_tabla" class="row">
                                 
                            </div>
                        </div>
                        <div class="col-lg-4" style="border-left: 1px; border-left-style: dotted; border-color: gray; height: 370px">
                            <div id="div_file" >
                                <p id="texto">Abrir Imagen</p>
                                <input type="file" id="btn_abrir_imagen_previa" name="archivo" onchange="readImagen(this)">
                            </div>
                            <br>
                            
                            <img id="imagen_previa" height="250"><br><br>
                            <label id="nombre_imagen_previa"></label><br>
                            <div id="resultado"></div>
                            <button class="btn btn-primary" onclick="subir_imagen()">Subir Imagen</button>
                        </div>
                    </div>
                    
                </form>
    </body>
</html>
