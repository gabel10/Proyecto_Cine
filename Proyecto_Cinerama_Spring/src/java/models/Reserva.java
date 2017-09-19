/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;

/**
 *
 * @author Usuario
 */
public class Reserva extends Conexion{
     private final MongoClient cliente = crearConexion();
    private final MongoDatabase database = cliente.getDatabase("dbcinerama");
    protected final MongoCollection<Document> collection = database.getCollection("reservas");
    
    private String id;
    private String id_funcion;
    private String id_pelicula;
    private String butacas;
    private String cant_butacas;
    private String suma_total;
    private String id_cliente;
    
    public Reserva(){
        
    }

    
    public void Insertar(){
        
        Document datos = new Document();
        Object id_pelicula = getNextSequence("cont_reservas");
        this.setId(id_pelicula.toString());                
        datos.append("_id", id_pelicula.toString());
        datos.append("id_funcion", this.getId_funcion());
        datos.append("id_pelicula", this.getId_pelicula());
        datos.append("butacas", this.getButacas());
        datos.append("cant_butacas", this.getCant_butacas());
        datos.append("suma_total", this.getSuma_total());
        datos.append("id_cliente", this.getId_cliente());
        
        try{
            collection.insertOne(datos);
        }
        catch(Exception e){            
        }
    }  
    
    public String getId() {
        return id;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getId_cliente() {
        return id_cliente;
    }

    public String getId_funcion() {
        return id_funcion;
    }

    public String getId_pelicula() {
        return id_pelicula;
    }

    public String getButacas() {
        return butacas;
    }

    public String getCant_butacas() {
        return cant_butacas;
    }

    public String getSuma_total() {
        return suma_total;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void setId_funcion(String id_funcion) {
        this.id_funcion = id_funcion;
    }

    public void setId_pelicula(String id_pelicula) {
        this.id_pelicula = id_pelicula;
    }

    public void setButacas(String butacas) {
        this.butacas = butacas;
    }

    public void setCant_butacas(String cant_butacas) {
        this.cant_butacas = cant_butacas;
    }

    public void setSuma_total(String suma_total) {
        this.suma_total = suma_total;
    }
    
    
}
