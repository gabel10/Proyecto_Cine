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
                
                <label class=" btn btn-default"width="170" >
                    <input type="radio" name="nombre_imagen" id="1" value="<%=imagen%>" onclick="obtener_nombre_imagen(this)"><%=imagen%><br>
                    <img  src="mostrar_imagen.htm?imagen=<%=imagen%>" class="img-thumbnail img-check" height="250" width="170" alt="..." >                    
                </label><br><br>
        </div>
        <%
            cont++;
            }
        %>
    </body>
</html>
