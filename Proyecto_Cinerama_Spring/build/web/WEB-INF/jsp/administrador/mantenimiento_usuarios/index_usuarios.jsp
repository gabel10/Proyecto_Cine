<%-- 
    Document   : index_usuarios
    Created on : 13-sep-2017, 23:08:03
    Author     : gabri
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
        
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="../header_menu.jsp"/>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <h1 class="page-header">
                        <small>Mantenimiento Usuarios</small>
                    </h1>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i></i> Lista de Usuarios</h3>
                        </div>
                        <div class="panel-body">
                            <a type="button" class="btn btn-success btn-lg" href="agregar_usuario.htm"> Crear Nuevo Usuario</a><br><br>
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                        <tr>
                                            <th>DNI o Pasaporte</th>
                                            <th>Nombres</th>
                                            <th>Apellido Paterno</th>
                                            <th>Apellido Materno</th>
                                            <th>Nivel de Acceso</th>
                                            <th>Operaciones</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${datos}" var="dato">
                                            <tr>
                                                <td>${dato.get("_id")}</td>
                                                <td>${dato.get("nombres")}</td>
                                                <td>${dato.get("apellido_paterno")}</td>
                                                <td>${dato.get("apellido_materno")}</td>
                                                <td>${dato.get("nivel_acceso")}</td>
                                                <td>
                                                    <a id="${dato.get("_id")}"type="button" class="btn btn-warning" onclick="fnEditar(this)">Editar</a>
                                                    <!--<a id="${dato.get("_id")}" type="button" class="btn btn-info" onclick="fnverDetalles(this)">Ver Detalles</a> -->
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
        
            function fnEditar(comp){
                 location.href="modificar_usuario.htm?id="+comp.id;
            }
            function fnverDetalles(comp){
                 location.href="detalle_usuario.htm?id="+comp.id;
            }
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

