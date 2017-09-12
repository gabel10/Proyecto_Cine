<%-- 
    Document   : lista_imagenes
    Created on : 11/09/2017, 08:11:25 PM
    Author     : Usuario
--%>

<%@page import="com.mongodb.client.FindIterable"%>
<%@page import="org.bson.Document"%>
<%@page import="com.mongodb.client.MongoCollection"%>
<%@page import="com.mongodb.client.MongoDatabase"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
            <%
                MongoClient miCliente = new MongoClient("127.0.0.1", 27017);
                MongoDatabase baseDatos = miCliente.getDatabase("dbcinerama");
                MongoCollection<Document> coleccion = baseDatos.getCollection("imagenes.files");
                FindIterable<Document> miDocumento = coleccion.find();
                int cont = 0;
                for (Document d : miDocumento) {
                    String imagen = d.getString("filename");
            %>
            <div class="col-lg-4">
                <label class=" btn btn-default"width="170" ><%=imagen%><br>
                    <img  src="mostrar_imagen.htm?imagen=<%=imagen%>" class="img-thumbnail img-check" height="250" width="170" alt="...">
                    <input type="checkbox" name="name_pelicula" id="<%=imagen%>" value="<%=cont%>" class="hidden" autocomplete="off">
                </label><br><br>
        </div>
        <%
            cont++;
            }
        %>
    </body>
</html>
