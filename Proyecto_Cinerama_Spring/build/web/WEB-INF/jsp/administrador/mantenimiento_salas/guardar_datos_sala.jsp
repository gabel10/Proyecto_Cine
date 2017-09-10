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
                        <small>Mantenimiento Salas</small>
                    </h1>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title"><i></i> </h3>
                        </div>
                        <h3>Se guardaron los datos correctamente</h3><br>                        
                        <label>Numero de Sala : ${datos.getId()}</label>   <br>                     
                        <label>Numero de butacas : ${datos.getCant_butacas()}</label><br>                       
                        <label>Butacas : ${datos.getButacas()}</label><br>    
                        <a type="button" class="btn btn-success btn-lg" href="index_salas.htm">Aceptar</a><br><br>

                    </div>
                </div>
            </div>
        </div>
        
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
