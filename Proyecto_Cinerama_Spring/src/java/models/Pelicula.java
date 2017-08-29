/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;

/**
 *
 * @author Usuario
 */
public class Pelicula extends Conexion{
    
    private final MongoClient cliente = crearConexion();
    private final MongoDatabase database = cliente.getDatabase("dbcinerama");
    protected final MongoCollection<Document> collection = database.getCollection("peliculas");
    
    
    public List<Document> getListaPeliculas(){
        List<Document> documentos = (List<Document>) collection.find().into(
				new ArrayList<Document>());
        System.out.println(documentos.get(0).getString("titulo"));
        return documentos;
    }
}
