/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import com.mongodb.BasicDBObject;
import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import com.mongodb.client.model.UpdateOptions;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.codec.digest.DigestUtils;
import org.bson.Document;
import org.bson.conversions.Bson;

/**
 *
 * @author gabri
 */
public class Usuario extends Conexion{
    private final MongoClient cliente = crearConexion();
    private final MongoDatabase database = cliente.getDatabase("dbcinerama");
    protected final MongoCollection<Document> collection = database.getCollection("usuarios");
    private String id;
    private String contraseña;
    private String nivel_acceso;
    private String nombres;
    private String apellido_paterno;
    private String apellido_materno;
    private String fecha_nacimiento;
    private String email;
    private String telefono;
    private String departamento;
    private String provincia;
    private String distrito;
    private String direccion;
    private String estado_civil;
    private String ocupacion;
    private String fecha_afiliacion;
    private String tipo_documento;

    public Usuario() {
    }

    public Usuario(String id, String contraseña, String nivel_acceso, String nombres, String apellido_paterno, String apellido_materno, String fecha_nacimiento, String email, String telefono, String departamento, String provincia, String distrito, String direccion, String estado_civil, String ocupacion, String fecha_afiliacion,String tipo_documento) {
        this.id = id;
        this.contraseña = contraseña;
        this.nivel_acceso = nivel_acceso;
        this.nombres = nombres;
        this.apellido_paterno = apellido_paterno;
        this.apellido_materno = apellido_materno;
        this.fecha_nacimiento = fecha_nacimiento;
        this.email = email;
        this.telefono = telefono;
        this.departamento = departamento;
        this.provincia = provincia;
        this.distrito = distrito;
        this.direccion = direccion;
        this.estado_civil = estado_civil;
        this.ocupacion = ocupacion;
        this.fecha_afiliacion = fecha_afiliacion;
        this.tipo_documento = tipo_documento;
    }

    public String getTipo_documento() {
        return tipo_documento;
    }

    public void setTipo_documento(String tipo_documento) {
        this.tipo_documento = tipo_documento;
    }
    
    public void insertar(){
        Document datos = new Document();
        datos.append("_id", this.getId());
        datos.append("tipo_documento",this.getTipo_documento());
        datos.append("contraseña", this.getContraseña());
        datos.append("nivel_acceso", this.getNivel_acceso());
        datos.append("nombres", this.getNombres());
        datos.append("apellido_paterno", this.getApellido_paterno());
        datos.append("apellido_materno", this.getApellido_materno());
        datos.append("fecha_nacimiento", this.getFecha_nacimiento());
        datos.append("email", this.getEmail());
        datos.append("telefono", this.getTelefono());
        datos.append("departamento", this.getDepartamento());
        datos.append("provincia", this.getProvincia());
        datos.append("distrito", this.getDistrito());
        datos.append("direccion", this.getDireccion());
        datos.append("estado_civil", this.getEstado_civil());
        datos.append("ocupacion", this.getOcupacion());
        datos.append("fecha_afiliacion", this.getFecha_afiliacion());
        try{
            collection.insertOne(datos);
        }
        catch(Exception e){            
        }
    }
    public void actualizar(){
        Document datos = new Document();              
        datos.append("_id", this.getId());
        datos.append("email", this.getEmail());
        datos.append("telefono", this.getTelefono());
        datos.append("departamento", this.getDepartamento());
        datos.append("provincia", this.getProvincia());
        datos.append("distrito", this.getDistrito());
        datos.append("direccion", this.getDireccion());
        datos.append("estado_civil", this.getEstado_civil());
        datos.append("ocupacion", this.getOcupacion());
        BasicDBObject query = new BasicDBObject();
        query.append("_id", this.getId());
        Bson newDocument = new Document("$set", datos);
        try {
            collection.updateOne(query, newDocument,(new UpdateOptions()).upsert(true));
        } 
        catch (Exception e) {
        }
    }
    public void actualizar_contraseña(){
        Document datos = new Document();              
        datos.append("_id", this.getId());
        datos.append("contraseña", this.getContraseña());
        BasicDBObject query = new BasicDBObject();
        query.append("_id", this.getId());
        Bson newDocument = new Document("$set", datos);
        try {
            collection.updateOne(query, newDocument,(new UpdateOptions()).upsert(true));
        } 
        catch (Exception e) {
        }
    }
    
    public Document Iniciar_Sesion(){
        //Document myDoc = collection.find(eq("_id", getId())).first();
        Document myDoc = collection.find(and(eq("_id", getId()),eq("contraseña",getContraseña()))).first();
        return myDoc;
    }
    public Document Obtener_Datos(){
        Document myDoc = collection.find(eq("_id",getId())).first();
        return myDoc;
    }
    
    public List<Document> getListaUsuarios(){
        List<Document> documentos = (List<Document>) collection.find().into(new ArrayList<>());
        return documentos;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContraseña() {
        
        return contraseña;
    }

    public void setContraseña(String contraseña) {
        this.contraseña = DigestUtils.sha256Hex(contraseña);
    }

    public String getNivel_acceso() {
        return nivel_acceso;
    }

    public void setNivel_acceso(String nivel_acceso) {
        this.nivel_acceso = nivel_acceso;
    }

    public String getNombres() {
        return nombres;
    }

    public void setNombres(String nombres) {
        this.nombres = nombres.toUpperCase();
    }

    public String getApellido_paterno() {
        return apellido_paterno;
    }

    public void setApellido_paterno(String apellido_paterno) {
        this.apellido_paterno = apellido_paterno.toUpperCase();
    }

    public String getApellido_materno() {
        return apellido_materno;
    }

    public void setApellido_materno(String apellido_materno) {
        this.apellido_materno = apellido_materno.toUpperCase();
    }

    public String getFecha_nacimiento() {
        return fecha_nacimiento;
    }

    public void setFecha_nacimiento(String fecha_nacimiento) {
        this.fecha_nacimiento = fecha_nacimiento;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getDepartamento() {
        return departamento;
    }

    public void setDepartamento(String departamento) {
        this.departamento = departamento.toUpperCase();
    }

    public String getProvincia() {
        return provincia;
    }

    public void setProvincia(String provincia) {
        this.provincia = provincia.toUpperCase();
    }

    public String getDistrito() {
        return distrito;
    }

    public void setDistrito(String distrito) {
        this.distrito = distrito.toUpperCase();
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion.toUpperCase();
    }

    public String getEstado_civil() {
        return estado_civil;
    }

    public void setEstado_civil(String estado_civil) {
        this.estado_civil = estado_civil;
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion.toUpperCase();
    }

    public String getFecha_afiliacion() {
        return fecha_afiliacion;
    }

    public void setFecha_afiliacion() {
         SimpleDateFormat sdf = new SimpleDateFormat("dd/M/yyyy");
        this.fecha_afiliacion = sdf.format(new Date());
    }
    
}
