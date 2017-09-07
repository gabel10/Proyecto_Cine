/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Funcion;
import models.Pelicula;
import models.Sala;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.bson.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Willy
 */

@Controller
public class FuncionController {
    @RequestMapping("index_funciones.htm")
    public ModelAndView index_funcion(){
        
        ModelAndView v = new ModelAndView();
        v.addObject("datos", new Funcion().getListaFunciones());
        v.setViewName("administrador/mantenimiento_funcion/index_funciones");
        return v;
    }
    
    @RequestMapping("agregar_funcion.htm") 
    public ModelAndView agregar_funcion(){
        ModelAndView v = new ModelAndView();
        v.addObject("peliculas", new Pelicula().getListaPeliculas());
        v.addObject("gg", "este tio");
        v.addObject("salas", new Sala().getListaSalas()); 
        v.setViewName("administrador/mantenimiento_funcion/agregar_funcion");
        return v;
    }
    
    @RequestMapping("modificar_funcion.htm")
    public ModelAndView modificar_funcion(HttpServletRequest request)throws ParseException{
        ModelAndView v = new ModelAndView();
        String id = request.getParameter("id");
        Document funcion = new Funcion().getFuncion(id);    
        
        v.addObject("dato", funcion);
        v.addObject("peliculas", new Pelicula().getListaPeliculas());
        v.addObject("salas", new Sala().getListaSalas());
        v.addObject("id",id);
        v.setViewName("administrador/mantenimiento_funcion/modificar_funcion");
        return v;
    }
    
    @RequestMapping("detalle_funcion.htm")
    public ModelAndView detalle_funcion(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_funcion/detalle_funcion");
        return v;
    }
    
    @RequestMapping("guardar_datos_funcion.htm")
    public ModelAndView guardar_datos_funcion(HttpServletRequest request, HttpServletResponse response)throws ParseException, FileUploadException, IOException{
        
        if(request != null) {
            ModelAndView v = new ModelAndView();
            //response.sendRedirect("registro.htm");
            //return new ModelAndView("administrador/mantenimiento_pelicula/guardar_datos_pelicula");
            Funcion funcion = new Funcion();
            
            funcion.setHorario(request.getParameter("horario"));
            funcion.setId_pelicula(request.getParameter("id_pelicula"));
            funcion.setId_sala(request.getParameter("id_sala"));
            funcion.Insertar();
           
           // v.addObject("datos",funcion);
           // v.setViewName("administrador/mantenimiento_pelicula/guardar_datos_funcion");
            //return v;
        }
        
        response.sendRedirect("index_funciones.htm");
        return new ModelAndView("administrador/mantenimiento_funcion/index_funciones");
    }
    
    @RequestMapping("modificar_datos_funcion.htm")
    public ModelAndView modificar_datos_funcion(HttpServletRequest request)throws ParseException, FileUploadException, IOException{
        ModelAndView v = new ModelAndView();
        Funcion funcion = new Funcion();
        funcion.setId(request.getParameter("id"));
        funcion.setHorario(request.getParameter("horario"));
        funcion.setId_pelicula(request.getParameter("id_pelicula"));
        funcion.setId_sala(request.getParameter("id_sala"));
        
        funcion.Actualizar();
        v.addObject("datos",funcion);
        v.setViewName("administrador/mantenimiento_funcion/modificar_datos_funcion");
        return v;
    }
}
