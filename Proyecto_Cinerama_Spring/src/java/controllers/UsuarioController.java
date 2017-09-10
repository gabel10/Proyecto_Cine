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
import javax.servlet.http.HttpSession;
import models.Usuario;
import org.bson.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author gabri
 */
@Controller
public class UsuarioController extends Conexion{
    
    @RequestMapping("login.htm")
    public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws IOException{
        String nombre_pagina = "login";
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("usuario") != null){
            String nivel_acceso = sesion.getAttribute("nivel_acceso").toString();
            if("administrador".equals(nivel_acceso) || "vendedor".equals(nivel_acceso)){
                nombre_pagina = "administrador/menu";
            }else if("cliente".equals(nivel_acceso)){
                response.sendRedirect("panel.htm");
                nombre_pagina = "panel";
            }
        }
        return new ModelAndView(nombre_pagina);
    }
        
    @RequestMapping("menu.htm")
    public ModelAndView menu(HttpServletRequest request,HttpServletResponse response) throws IOException{
        /*HttpSession sesion = request.getSession();
        String nombre_pagina = "";
        if(sesion.getAttribute("usuario") == null){
            response.sendRedirect("home.htm");
            nombre_pagina = "home";
        }else{
            String nivel_acceso = sesion.getAttribute("nivel_acceso").toString();
            if("administrador".equals(nivel_acceso) || "vendedor".equals(nivel_acceso)){
                nombre_pagina = "administrador/menu";
            }else if("cliente".equals(nivel_acceso)){
                response.sendRedirect("home.htm");
                nombre_pagina = "home";
            }
        }*/
        return new ModelAndView("administrador/menu");
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
        String usuario, contraseña, nivel_acceso;
        if(request!=null){
            usuario = request.getParameter("usuario");
            contraseña = request.getParameter("password");
            if(!"".equals(usuario) && !"".equals(contraseña)){
                Usuario user = new Usuario();
                user.setId(usuario);
                user.setContraseña(contraseña);
                Document u = user.Iniciar_Sesion();
                if(u != null){
                    nivel_acceso  = u.get("nivel_acceso", String.class);
                    HttpSession sesion = request.getSession();
                    String nombre_user = u.get("nombres", String.class)+" "+u.get("apellido_paterno",String.class)+" "+u.get("apellido_materno",String.class);
                    sesion.setAttribute("id", u.get("_id",String.class));
                    sesion.setAttribute("usuario",nombre_user);
                    sesion.setAttribute("nivel_acceso", nivel_acceso);
                    sesion.setMaxInactiveInterval(180);
                    response.sendRedirect("panel.htm");
                    ModelAndView v = new ModelAndView();
                    v.addObject("cliente",u);
                    v.setViewName("panel");
                    return v;
                }
            }
            response.sendRedirect("home.htm");
            return new ModelAndView("home");
        }
        else{
            response.sendRedirect("login.htm");
            return new ModelAndView("iniciar_sesion");
        }
    }
    
    @RequestMapping("panel.htm")
    public ModelAndView panel(HttpServletRequest request, HttpServletResponse response) throws IOException{
        ModelAndView v = new ModelAndView();
        HttpSession sesion = request.getSession();
        if(sesion.getAttribute("usuario") == null){
            v.setViewName("home");
            response.sendRedirect("home.htm");
        }else{
            String id = sesion.getAttribute("id").toString();
            Usuario user = new Usuario();
            user.setId(id);
            Document u = user.Obtener_Datos();
            if(u == null){
                v.setViewName("home");
                response.sendRedirect("home.htm");
            }else{
                v.addObject("user", u);
                v.setViewName("panel");
            }
        }
        return v;
    }
}
