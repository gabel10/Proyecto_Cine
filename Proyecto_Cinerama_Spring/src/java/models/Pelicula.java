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
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.bson.Document;

/**
 *
 * @author Usuario
 */
public class Pelicula extends Conexion{
    
    private final MongoClient cliente = crearConexion();
    private final MongoDatabase database = cliente.getDatabase("dbcinerama");
    protected final MongoCollection<Document> collection = database.getCollection("peliculas");
    
    private String id;
    private String titulo;
    private String genero;
    private String url_trailer;
    private String pais;
    private String duracion;
    private String fecha_estreno;
    private String sinopsis;
    private String imagen;

    public Pelicula() {
    }   
    
    public Pelicula(String titulo, String genero, String url_trailer, String pais, String duracion, String fecha_estreno, String sinopsis) {
        this.titulo = titulo;
        this.genero = genero;
        this.url_trailer = url_trailer;
        this.pais = pais;
        this.duracion = duracion;
        this.fecha_estreno = fecha_estreno;
        this.sinopsis = sinopsis;
    }        
    
    public void Insertar(){
        
        Document datos = new Document();
        Object id_pelicula = getNextSequence("cont_peliculas");
        this.setId(id_pelicula.toString());                
        datos.append("_id", id_pelicula);
        datos.append("titulo", this.getTitulo());
        datos.append("genero", this.getGenero());
        datos.append("url_trailer", this.getUrl_trailer());
        datos.append("pais", this.getPais());
        datos.append("duracion", this.getDuracion());
        datos.append("fecha_estreno",this.getFecha_estreno());
        datos.append("sinopsis", this.getSinopsis());
        
        try{
            collection.insertOne(datos);
        }
        catch(Exception e){            
        }
    }    
    
    public List<Document> getListaPeliculas(){
        List<Document> documentos = (List<Document>) collection.find().into(
				new ArrayList<Document>());
        return documentos;
    }
    
  
    public String getId() {
        return id;
    }
    public String getTitulo() {
        return titulo;
    }

    public String getGenero() {
        return genero;
    }

    public String getUrl_trailer() {
        return url_trailer;
    }

    public String getPais() {
        return pais;
    }

    public String getDuracion() {
        return duracion;
    }

    public String getFecha_estreno() {
        return fecha_estreno;
    }

    public String getSinopsis() {
        return sinopsis;
    }  

    public void setId(String id) {
        this.id=id;
    }
    
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public void setUrl_trailer(String url_trailer) {
        this.url_trailer = url_trailer;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public void setFecha_estreno(String fecha_estreno) {
        this.fecha_estreno = fecha_estreno;
    }

    public void setSinopsis(String sinopsis) {
        this.sinopsis = sinopsis;
    }

   
    
    
    
}
