/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//package controllers;
//
//import models.Pelicula;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//@Controller
//public class SalaController {
//    @RequestMapping("index_salas.htm")
//    public ModelAndView index_salas(){
//        ModelAndView v = new ModelAndView();
//       // v.addObject("datos", new Pelicula().getListaPeliculas());
//        v.setViewName("administrador/mantenimiento_salas/index_salas");
//        return v;
//    }
//    
//    @RequestMapping("agregar_sala.htm")
//    public ModelAndView agregar_sala(){
//        ModelAndView v = new ModelAndView();
//        v.setViewName("administrador/mantenimiento_salas/agregar_sala");
//        return v;
//    }
//}
package controllers;

import java.io.IOException;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
public class SalaController {
    @RequestMapping("index_salas.htm")
    public ModelAndView index_salas(){
        ModelAndView v = new ModelAndView();
        v.addObject("datos", new Sala().getListaSalas());
        v.setViewName("administrador/mantenimiento_sala/index_salas");
        return v;
    }
    
    @RequestMapping("agregar_sala.htm") 
    public ModelAndView agregar_sala(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_sala/agregar_sala");
        return v;
    }
    
    @RequestMapping("modificar_sala.htm")
    public ModelAndView modificar_sala(HttpServletRequest request)throws ParseException{
        ModelAndView v = new ModelAndView();
        String id = request.getParameter("id");
        Document sala = new Sala().getSala(id);       
        v.addObject("dato", sala);
        v.addObject("id",id);
        v.setViewName("administrador/mantenimiento_sala/modificar_sala");
        return v;
    }
    
    @RequestMapping("detalle_sala.htm")
    public ModelAndView detalle_sala(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_sala/detalle_sala");
        return v;
    }
    
    @RequestMapping("guardar_datos_sala.htm")
    public ModelAndView guardar_datos_sala(HttpServletRequest request, HttpServletResponse response)throws ParseException, FileUploadException, IOException{
        
        if(request != null) {
            ModelAndView v = new ModelAndView();
            //response.sendRedirect("registro.htm");
            //return new ModelAndView("administrador/mantenimiento_pelicula/guardar_datos_pelicula");
            Sala sala = new Sala();
            
            sala.setNro_asientos(request.getParameter("nro_asientos"));
            sala.setAsientos(request.getParameter("asientos"));
            sala.Insertar();
            v.addObject("datos",sala);
          //  v.setViewName("administrador/mantenimiento_pelicula/guardar_datos_pelicula");
           // return v;
        }
        
        response.sendRedirect("index_salas.htm");
        return new ModelAndView("administrador/mantenimiento_sala/index_salas");
    }
    
    @RequestMapping("modificar_datos_sala.htm")
    public ModelAndView modificar_datos_sala(HttpServletRequest request)throws ParseException, FileUploadException, IOException{
        ModelAndView v = new ModelAndView();
        
        Sala sala = new Sala();
        sala.setId(request.getParameter("id"));
        sala.setNro_asientos(request.getParameter("nro_asientos"));
        sala.setAsientos(request.getParameter("asientos"));
        sala.Actualizar();
        v.addObject("datos",sala);
        v.setViewName("administrador/mantenimiento_sala/modificar_datos_sala");
        return v;
    }
}
