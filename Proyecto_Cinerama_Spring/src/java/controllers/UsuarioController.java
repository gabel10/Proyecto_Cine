/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import models.Conexion;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import models.Usuario;
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

    private String id;
    private String password;
    
    @RequestMapping("login.htm")
    public ModelAndView login(HttpServletRequest request){
        ModelAndView v = new ModelAndView();
        v.setViewName("login");
        id = request.getParameter("id");
        password = request.getParameter("password");
        if(id!=null && password!=null){
            
        }
        return v;
    }
        
    @RequestMapping("menu.htm")
    public ModelAndView menu(HttpServletRequest request){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/menu");
        return v;
    }
    
    @RequestMapping("confirmacion_registro.htm")
    public ModelAndView confirmacion_registro(HttpServletRequest request) throws ParseException{
        String pass1 = request.getParameter("password");
        String pass2 = request.getParameter("confirmar_password");
        if(!"".equals(pass1) && pass1.equals(pass2)){
            Usuario usuario = new Usuario();
            usuario.setId(request.getParameter("id"));
            usuario.setContraseña(DigestUtils.sha256Hex(pass1));
            usuario.setNivel_acceso("cliente");
            usuario.setNombres(request.getParameter("nombres"));
            usuario.setApellido_paterno(request.getParameter("apellido_paterno"));
            usuario.setApellido_materno(request.getParameter("apellido_materno"));
            usuario.setFecha_nacimiento(request.getParameter("fecha_nacimiento"));
            usuario.setEmail(request.getParameter("correo_electronico"));
            usuario.setTelefono(request.getParameter("telefono"));
            usuario.setDepartamento(request.getParameter("departamento"));
            usuario.setProvincia(request.getParameter("provincia"));
            usuario.setDistrito(request.getParameter("distrito"));
            usuario.setDireccion(request.getParameter("direccion"));
            usuario.setEstado_civil(request.getParameter("estado_civil"));
            usuario.setOcupacion(request.getParameter("ocupacion"));
            usuario.setFecha_afiliacion("");
            usuario.insertar();
            return new ModelAndView("confirmacion_registro");
        }
        else{
            ModelAndView v = new ModelAndView();
            v.setViewName("registro");
            return v;
        }
    }
    
    @RequestMapping("registro.htm")
    public ModelAndView registro(){
        ModelAndView v = new ModelAndView();
        v.setViewName("registro");
        return v;
    }
//    
//    private boolean log_in(){
//        Document myDoc = collection.find(and(eq("_id", getId()),eq("contraseña",getPassword()))).first();
//        return myDoc != null;
//    }

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
