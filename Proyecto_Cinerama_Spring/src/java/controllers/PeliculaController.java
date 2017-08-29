/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import models.Pelicula;
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
}
