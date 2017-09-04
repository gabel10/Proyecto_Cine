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
public class SalaController {
    @RequestMapping("index_salas.htm")
    public ModelAndView index_salas(){
        ModelAndView v = new ModelAndView();
       // v.addObject("datos", new Pelicula().getListaPeliculas());
        v.setViewName("administrador/mantenimiento_salas/index_salas");
        return v;
    }
    
    @RequestMapping("agregar_sala.htm")
    public ModelAndView agregar_sala(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_salas/agregar_sala");
        return v;
    }
}
