/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import models.Pelicula;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.util.Streams;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PeliculaController {
    
    @RequestMapping("index_peliculas.htm")
    public ModelAndView index_peliculas(){
        ModelAndView v = new ModelAndView();
        v.addObject("datos", new Pelicula().getListaPeliculas());
        v.setViewName("administrador/mantenimiento_pelicula/index_peliculas");
        return v;
    }
    
    @RequestMapping("agregar_pelicula.htm")
    public ModelAndView agregar_pelicula(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_pelicula/agregar_pelicula");
        return v;
    }
    
    @RequestMapping("modificar_pelicula.htm")
    public ModelAndView modificar_pelicula(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_pelicula/modificar_pelicula");
        return v;
    }
    
    @RequestMapping("detalle_pelicula.htm")
    public ModelAndView detalle_pelicula(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_pelicula/detalle_pelicula");
        return v;
    }
    
    @RequestMapping("guardar_datos_pelicula.htm")
    public ModelAndView guardar_datos_pelicula(HttpServletRequest request)throws ParseException, FileUploadException, IOException{
        ModelAndView v = new ModelAndView();
        
        Pelicula pelicula = new Pelicula();
        pelicula.setTitulo(request.getParameter("titulo"));
        pelicula.setGenero(request.getParameter("genero"));
        pelicula.setPais(request.getParameter("pais"));
        pelicula.setUrl_trailer(request.getParameter("trailer"));
        pelicula.setDuracion(request.getParameter("duracion"));
        pelicula.setFecha_estreno(request.getParameter("fecha_estreno"));
        pelicula.setSinopsis(request.getParameter("sinopsis"));
        pelicula.Insertar();   
        v.addObject("datos",pelicula);
        v.setViewName("administrador/mantenimiento_pelicula/guardar_datos_pelicula");
        return v;
    }
}
