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
   
    
    @RequestMapping("agregar_funcion.htm") 
    public ModelAndView agregar_funcion(){
        ModelAndView v = new ModelAndView();
        v.addObject("salas", new Sala().getListaSalas()); 
        v.setViewName("administrador/mantenimiento_funcion/agregar_funcion");
        return v;
    }
    
    
}
