/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import models.Cartelera;
import models.Pelicula;
import models.Sala;
import models.Funcion;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.bson.Document;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Usuario
 */
public class CarteleraController {
    
    
    @RequestMapping("cartelera.htm")
    public ModelAndView cartelera(){
        ModelAndView v = new ModelAndView();  
        v.addObject("datos1", new Cartelera().getListaCarteleraFecha("2017-09-14"));
        v.addObject("horarios", new Funcion().getListaFunciones());
        v.addObject("peliculas", new Pelicula().getListaPeliculas());
        v.setViewName("cartelera");
        return v;
    }
    
    @RequestMapping("index_cartelera.htm")
    public ModelAndView index_cartelera(){
        ModelAndView v = new ModelAndView();        
        v.addObject("id","id_pelicula");
        v.addObject("datos", new Cartelera().getListaCarteleras());
        v.setViewName("administrador/mantenimiento_cartelera/index_cartelera");
        return v;
    }
    
    @RequestMapping("agregar_cartelera.htm")
    public ModelAndView agregar_cartelera(){
        ModelAndView v = new ModelAndView();
        v.addObject("peliculas", new Pelicula().getListaPeliculas());
        v.addObject("salas", new Sala().getListaSalas());
        v.setViewName("administrador/mantenimiento_cartelera/agregar_cartelera");
        return v;
    }
    
    @RequestMapping("modificar_cartelera.htm")
    public ModelAndView modificar_cartelera(HttpServletRequest request)throws ParseException{
        ModelAndView v = new ModelAndView();
        String id = request.getParameter("id");
        v.addObject("peliculas", new Pelicula().getListaPeliculas());
        v.setViewName("administrador/mantenimiento_cartelera/modificar_cartelera");
        return v;
    }
    
    @RequestMapping("detalle_cartelera.htm")
    public ModelAndView detalle_cartelera(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_cartelera/detalle_cartelera");
        return v;
    }
    
    @RequestMapping("guardar_datos_cartelera.htm")
    public ModelAndView guardar_datos_cartelera(HttpServletRequest request)throws ParseException, FileUploadException, IOException{
        ModelAndView v = new ModelAndView();
        Cartelera cartelera = new Cartelera();
        
        cartelera.setFecha_cartelera(request.getParameter("fecha_cartelera"));
        cartelera.setId_pelicula(request.getParameter("id_pelicula"));
        cartelera.Insertar();
        
        String[] horarios = request.getParameter("horarios").toString().split(",");
        String[] salas = request.getParameter("salas").toString().split(",");
        
        
        for(int i = 0;i<horarios.length;i++){
            Funcion funcion = new Funcion();
            funcion.setId_cartelera(cartelera.getId_cartelera());
            funcion.setNro_sala(salas[i]);
            funcion.setHorario(horarios[i]);
            funcion.setButacas_ocupadas("");
            funcion.Insertar();
        }
        v.setViewName("administrador/mantenimiento_cartelera/guardar_datos_cartelera");
        return v;
    }
    
    @RequestMapping("modificar_datos_cartelera.htm")
    public ModelAndView modificar_datos_cartelera(HttpServletRequest request)throws ParseException, FileUploadException, IOException{
        ModelAndView v = new ModelAndView();
       
        v.setViewName("administrador/mantenimiento_cartelera/modificar_datos_cartelera");
        return v;
    }
}
