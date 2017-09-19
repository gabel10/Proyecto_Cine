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
    private String id_cartelera;
    private String horario;
    private String nro_sala;
    private String butacas_ocupadas;
    

    public Funcion() {
    }

    public Funcion(String id_cartelera, String horario, String nro_sala, String butacas_ocupadas) {
        this.id_cartelera = id_cartelera;
        this.horario = horario;
        this.nro_sala = nro_sala;
        this.butacas_ocupadas = butacas_ocupadas;
    }
   
    public void Insertar(){
        
        Document datos = new Document();
        Object id_funcion = getNextSequence("cont_funcion");
        this.setId(id_funcion.toString());       
        
        datos.append("_id", this.getId());
        datos.append("id_cartelera", this.getId_cartelera());
        datos.append("horario", this.getHorario());
        datos.append("nro_sala", this.getNro_sala());
        datos.append("butacas_ocupadas", this.getButacas_ocupadas());
        
        
        try{
            collection.insertOne(datos);
        }
        catch(Exception e){            
        }
    }  
    
    public void Actualizar(){
        Document datos = new Document();              
        datos.append("_id", this.getId());
        datos.append("id_cartelera", this.getId_cartelera());
        datos.append("horario", this.getHorario());
        datos.append("nro_sala", this.getNro_sala());
        datos.append("butacas_ocupadas", this.getButacas_ocupadas());
        
        BasicDBObject query = new BasicDBObject();
        query.append("_id", this.getId());
        Bson newDocument = new Document("$set", datos);
        try {
            collection.updateOne(query, newDocument,(new UpdateOptions()).upsert(true));
        } catch (Exception e) {
        }     
    }
    
    public Document getFuncion(String id_cartelera, String horario){
        Document funcion = null;
        List<Document> documentos= this.getListaFunciones();
        //pelicula = documentos.get(0);
        for(int i = 0;i<documentos.size();i++){
            Document p = documentos.get(i);
            if(p.get("id_cartelera").toString().equals(id_cartelera) && p.get("horario").equals(horario)){
                return p;
            }
            
        }
        return funcion;
    }
    
    public Document getFuncionId(String id_funcion){
        Document funcion = null;
        List<Document> documentos= this.getListaFunciones();
        //pelicula = documentos.get(0);
        for(int i = 0;i<documentos.size();i++){
            Document p = documentos.get(i);
            if(p.get("_id").toString().equals(id_funcion)){
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

    public MongoClient getCliente() {
        return cliente;
    }

    public MongoDatabase getDatabase() {
        return database;
    }

    public MongoCollection<Document> getCollection() {
        return collection;
    }

    public String getId() {
        return id;
    }

    public String getId_cartelera() {
        return id_cartelera;
    }

    public String getHorario() {
        return horario;
    }

    public String getNro_sala() {
        return nro_sala;
    }

    public String getButacas_ocupadas() {
        return butacas_ocupadas;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setId_cartelera(String id_cartelera) {
        this.id_cartelera = id_cartelera;
    }

    public void setHorario(String horario) {
        this.horario = horario;
    }

    public void setNro_sala(String nro_sala) {
        this.nro_sala = nro_sala;
    }

    public void setButacas_ocupadas(String butacas_ocupadas) {
        this.butacas_ocupadas = butacas_ocupadas;
    }
    
}
