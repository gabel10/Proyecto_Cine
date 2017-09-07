
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
    private String nro_asientos;
    private String asientos;

    public Sala() {
    }

    public Sala(String nro_asientos, String asientos) {
        this.nro_asientos = nro_asientos;
        this.asientos = asientos;
    }
    
    public void Insertar(){
        
        Document datos = new Document();
        Object id_pelicula = getNextSequence("salaid");
        this.setId(id_pelicula.toString());       
        
        datos.append("_id", this.getId());
        datos.append("nro_asientos", this.getNro_asientos());
        datos.append("asientos", this.getAsientos());
       
        
        try{
            collection.insertOne(datos);
        }
        catch(Exception e){            
        }
    }  
    
    public void Actualizar(){
        Document datos = new Document();              
        datos.append("_id", this.getId());
        datos.append("nro_asientos", this.getNro_asientos());
        datos.append("asientos", this.getAsientos());   
        
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

    public void setId(String id) {
        this.id = id;
    }

    public String getNro_asientos() {
        return nro_asientos;
    }

    public void setNro_asientos(String nro_asientos) {
        this.nro_asientos = nro_asientos;
    }

    public String getAsientos() {
        return asientos;
    }

    public void setAsientos(String asientos) {
        this.asientos = asientos;
    }
    
    
}
