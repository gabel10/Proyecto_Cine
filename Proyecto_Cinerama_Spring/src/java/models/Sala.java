
package models;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.UpdateOptions;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;
import org.bson.conversions.Bson;


public class Sala extends Conexion {
    private final MongoClient cliente = crearConexion();
    private final MongoDatabase database = cliente.getDatabase("dbcinerama");
    protected final MongoCollection<Document> collection = database.getCollection("salas");
    
    private String id;
    private String filas;
    private String columnas;
    private String butacas;
    private String cant_butacas;

    public Sala(String id, String filas, String columnas, String butacas, String cant_butacas) {
        this.id = id;
        this.filas = filas;
        this.columnas = columnas;
        this.butacas = butacas;
        this.cant_butacas = cant_butacas;
    }

    public Sala() {
    } 
    public void Insertar(){
        
        Document datos = new Document(); 
        datos.append("_id", this.getId());
        datos.append("filas", this.getFilas());
        datos.append("columnas", this.getColumnas());
        datos.append("butacas", this.getButacas());      
        datos.append("cant_butacas", this.getCant_butacas());      
        try{
            collection.insertOne(datos);
        }
        catch(Exception e){            
        }
    }  
    
    public void Actualizar(){
        Document datos = new Document();              
        datos.append("_id", this.getId());
        datos.append("filas", this.getFilas());
        datos.append("columnas", this.getColumnas());
        datos.append("butacas", this.getButacas());   
        datos.append("cant_butacas", this.getCant_butacas());     
        
        BasicDBObject query = new BasicDBObject();
        query.append("_id", this.getId());
        Bson newDocument = new Document("$set", datos);
        try {
            collection.updateOne(query, newDocument,(new UpdateOptions()).upsert(true));
        } catch (Exception e) {
        }     
    }
    
    public Document getSala(String id){
        Document pelicula = null;
        List<Document> documentos= this.getListaSalas();
        //pelicula = documentos.get(0);
        for(int i = 0;i<documentos.size();i++){
            Document p = documentos.get(i);
            if(p.get("_id").toString().equals(id)){
                return p;
            }
            
        }
        return pelicula;
    }
    
    public List<Document> getListaSalas(){
        List<Document> documentos = (List<Document>) collection.find().into(
				new ArrayList<Document>());
        return documentos;
    }

    public String getId() {
        return id;
    }

    public String getFilas() {
        return filas;
    }

    public String getColumnas() {
        return columnas;
    }

    public String getButacas() {
        return butacas;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setFilas(String filas) {
        this.filas = filas;
    }

    public void setColumnas(String columnas) {
        this.columnas = columnas;
    }

    public void setButacas(String butacas) {
        this.butacas = butacas;
    }
    public int getNroButacas(){
        return Integer.valueOf(getFilas())*Integer.valueOf(getColumnas());
    }

    public String getCant_butacas() {
        return cant_butacas;
    }

    public void setCant_butacas(String cant_butacas) {
        this.cant_butacas = cant_butacas;
    }
    
    
}
