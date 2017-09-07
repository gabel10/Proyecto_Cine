/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import com.mongodb.client.model.UpdateOptions;
import java.util.ArrayList;
import java.util.List;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.bson.Document;
import org.bson.conversions.Bson;

/**
 *
 * @author Usuario
 */
public class Funcion extends Conexion{
    
    private final MongoClient cliente = crearConexion();
    private final MongoDatabase database = cliente.getDatabase("dbcinerama");
    protected final MongoCollection<Document> collection = database.getCollection("funciones");
    
    private String id;
    private String horario;
    private String id_pelicula;
    private String id_sala;

    public Funcion() {
    }

    public Funcion(String horario, String id_pelicula, String id_sala) {
        this.horario = horario;
        this.id_pelicula = id_pelicula;
        this.id_sala = id_sala;
    }
    
    public void Insertar(){
        
        Document datos = new Document();
        Object id_funcion = getNextSequence("funcionid");
        this.setId(id_funcion.toString());       
        
        datos.append("_id", this.getId());
        datos.append("horario", this.getHorario());
        datos.append("id_pelicula", this.getId_pelicula());
        datos.append("id_sala", this.getId_sala());
        
        
        try{
            collection.insertOne(datos);
        }
        catch(Exception e){            
        }
    }  
    
    public void Actualizar(){
        Document datos = new Document();              
        datos.append("_id", this.getId());
        datos.append("horario", this.getHorario());
        datos.append("id_pelicula", this.getId_pelicula());
        datos.append("id_sala", this.getId_sala());

        
        BasicDBObject query = new BasicDBObject();
        query.append("_id", this.getId());
        Bson newDocument = new Document("$set", datos);
        try {
            collection.updateOne(query, newDocument,(new UpdateOptions()).upsert(true));
        } catch (Exception e) {
        }     
    }
    
    public Document getFuncion(String id){
        Document funcion = null;
        List<Document> documentos= this.getListaFunciones();
        //pelicula = documentos.get(0);
        for(int i = 0;i<documentos.size();i++){
            Document p = documentos.get(i);
            if(p.get("_id").toString().equals(id)){
                return p;
            }
            
        }
        return funcion;
    }
    
    public List<Document> getListaFunciones(){
        List<Document> documentos = (List<Document>) collection.find().into(
				new ArrayList<Document>());
        return documentos;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getHorario() {
        return horario;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public String getId_pelicula() {
        return id_pelicula;
    }

    public void setId_pelicula(String id_pelicula) {
        this.id_pelicula = id_pelicula;
    }

    public String getId_sala() {
        return id_sala;
    }

    public void setId_sala(String id_sala) {
        this.id_sala = id_sala;
    }
  
    
   
    
    
    
}
