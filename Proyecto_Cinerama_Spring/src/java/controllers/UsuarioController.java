/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import static com.mongodb.client.model.Filters.and;
import static com.mongodb.client.model.Filters.eq;
import javax.servlet.http.HttpServletRequest;
import org.bson.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author gabri
 */
@Controller
public class UsuarioController extends Conexion{
    private final MongoClient cliente = crearConexion();
    private final MongoDatabase database = cliente.getDatabase("dbcinerama");
    protected final MongoCollection<Document> collection = database.getCollection("usuarios");
    private String id;
    private String password;
    
    @RequestMapping("login.htm")
    public ModelAndView login(HttpServletRequest request){
        ModelAndView v = new ModelAndView();
        v.setViewName("login");
        id = request.getParameter("id");
        password = request.getParameter("password");
        if(log_in()){
            
        }
        return v;
    }
    
    public boolean log_in(){
        Document myDoc = collection.find(and(eq("_id", getId()),eq("contraseña",getPassword()))).first();
        return myDoc != null;
    }

    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
}
