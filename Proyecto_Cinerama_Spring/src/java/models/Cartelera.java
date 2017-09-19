/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import java.util.ArrayList;
import java.util.List;
import org.bson.Document;

/**
 *
 * @author Usuario
 */
public class Cartelera extends Conexion{
    private final MongoClient cliente = crearConexion();
    private final MongoDatabase database = cliente.getDatabase("dbcinerama");
    protected final MongoCollection<Document> collection = database.getCollection("cartelera");
    
    private String id_cartelera;
    private String id_pelicula;
    private String fecha_cartelera;
    
    public Cartelera(){
    }

    public Cartelera(String id_cartelera,String id_pelicula, String fecha_cartelera) {
        this.id_pelicula = id_pelicula;
        this.fecha_cartelera = fecha_cartelera;
        this.id_cartelera = id_cartelera;
    }

    
    public void Insertar(){
        Document datos = new Document();
        Object id_cartelara= getNextSequence("cont_cartelera");
        this.setId_cartelera(id_cartelara.toString());  
        datos.append("_id", id_cartelara);
        datos.append("id_pelicula", this.getId_pelicula());
        datos.append("fecha_cartelera", this.getFecha_cartelera());
        
        try{
            collection.insertOne(datos);
        }
        catch(Exception e){            
        }
    }
    
    public List<Document> getListaCarteleras(){
        List<Document> documentos = (List<Document>) collection.find().into(
				new ArrayList<Document>());
        return documentos;
    }
    
    public List<Document> getListaCarteleraFecha(String fecha){
        List <Document> lista = this.getListaCarteleras();
        List <Document> r =  new ArrayList<Document>();
        for(int i = 0;i<lista.size();i++){
            Document doc = lista.get(i);
            if(doc.get("fecha_cartelera").toString().equals(fecha)){
                r.add(doc);
            }
        }
        return r;
    }
    public String getId_pelicula() {
        return id_pelicula;
    }

    public String getFecha_cartelera() {
        return fecha_cartelera;
    }    

    public String getId_cartelera() {
        return id_cartelera;
    }

    public void setId_cartelera(String id_cartelera) {
        this.id_cartelera = id_cartelera;
    }    
    
    public void setId_pelicula(String id_pelicula) {
        this.id_pelicula = id_pelicula;
    }

    public void setFecha_cartelera(String fecha_cartelera) {
        this.fecha_cartelera = fecha_cartelera;
    }

    
}
