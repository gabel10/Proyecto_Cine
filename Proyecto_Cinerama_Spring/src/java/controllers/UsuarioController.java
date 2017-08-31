/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import models.Conexion;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    
    @RequestMapping("login.htm")
    public ModelAndView login(HttpServletRequest request){
        if(request.getParameter("id") != null && request.getParameter("password") != null){
            Usuario usuario = new Usuario();
            usuario.setId(request.getParameter("id")); 
            usuario.setContraseña(request.getParameter("password"));
        }
        return new ModelAndView("login");
    }
        
    @RequestMapping("menu.htm")
    public ModelAndView menu(HttpServletRequest request){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/menu");
        return v;
    }
    
    @RequestMapping("confirmacion_registro.htm")
    public ModelAndView confirmacion_registro(HttpServletRequest request,HttpServletResponse response) throws ParseException, IOException{
        if(request != null){
            String pass1 = request.getParameter("password");
            String pass2 = request.getParameter("confirmar_password");
            if(!"".equals(pass1) && pass1.equals(pass2)){
                Usuario usuario = new Usuario();
                usuario.setId(request.getParameter("id"));
                usuario.setContraseña(pass1);
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
                usuario.setTipo_documento(request.getParameter("tipo_documento"));
                usuario.setFecha_afiliacion();
                usuario.insertar();
                return new ModelAndView("confirmacion_registro");
            }
            else{
                response.sendRedirect("registro.htm");
                return new ModelAndView("registro");
            }
        }else{
            response.sendRedirect("registro.htm");
            return new ModelAndView("registro");
        }
    }
    
    @RequestMapping("registro.htm")
    public ModelAndView registro(){
        return new ModelAndView("registro");
    }
    
    @RequestMapping("iniciar_sesion.htm")
    public ModelAndView iniciar_sesion(HttpServletRequest request,HttpServletResponse response) throws IOException{
        if(request!=null){
            String usuario = request.getParameter("usuario");
            String contraseña = request.getParameter("password");
            if(!"".equals(usuario) && !"".equals(contraseña)){
                Usuario user = new Usuario();
                user.setId(usuario);
                user.setContraseña(contraseña);
                if(user.Iniciar_Sesion()){
                    response.sendRedirect("menu.htm");
                    return new ModelAndView("home");
                }
            }
            response.sendRedirect("home.htm");
            return new ModelAndView("home");
        }
        else{
            response.sendRedirect("login.htm");
            return new ModelAndView("iniciar_sesion");
        }
        //return new ModelAndView("iniciar_sesion");
    }
//    
//    private boolean log_in(){
//        Document myDoc = collection.find(and(eq("_id", getId()),eq("contraseña",getPassword()))).first();
//        return myDoc != null;
//    }
}
