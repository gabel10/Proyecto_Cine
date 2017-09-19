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
        
    </head>
    <body>   
        <div class="row">
            <div class="col-lg-4">
                <input class="form-control" placeholder="Horas:Minutos" id="horario" >
            </div>
            <div class="col-lg-4">
                <select id="sala" class="form-control" title="Elija la Sala">>                                                                                   
                        <c:forEach items="${salas}" var="dato">
                            <option value="${dato.get("_id")}">Sala ${dato.get("_id")}</option>      
                        </c:forEach>
                </select>   
            </div>  
            <div class="col-lg-4">
                <button class="btn btn-danger btn-md" onclick="eliminar_funcion(this)"> X </button>
            </div>  
        </div><br>
    </body>
</html>
