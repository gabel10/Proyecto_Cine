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
import models.Funcion;
import models.Sala;
import models.Pelicula;
import models.Reserva;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.bson.Document;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Usuario
 */
public class ReservaController {
    @RequestMapping("reservar_cantidad_butacas.htm")
    public ModelAndView reservar_cantidad_butacas(HttpServletRequest request)throws ParseException{
        ModelAndView v = new ModelAndView();         
        String id_pelicula = request.getParameter("idpelicula");
        String id_funcion = request.getParameter("idfuncion");
        String nro_sala = request.getParameter("nro_sala");        
        Document pelicula = new Pelicula().getPelicula(id_pelicula);       
        v.addObject("pelicula", pelicula);
        Document funcion = new Funcion().getFuncionId(id_funcion);       
        v.addObject("funcion", funcion);    
        Document sala = new Sala().getSala(nro_sala);  
        v.addObject("sala",sala.get("_id"));
        v.setViewName("reservar_cantidad_butacas");
        return v;
    }
    
    @RequestMapping("reservar_butacas.htm")
    public ModelAndView reservar_butacas(HttpServletRequest request)throws ParseException{
        ModelAndView v = new ModelAndView();         
        String id_pelicula = request.getParameter("idpelicula");
        String id_funcion = request.getParameter("funcion");
        String nro_sala = request.getParameter("nrosala");     
        String cant_butacas = request.getParameter("cant_total");   
        String suma_total = request.getParameter("suma_total");    
        
        Document pelicula = new Pelicula().getPelicula(id_pelicula);       
        v.addObject("pelicula", pelicula);
        Document funcion = new Funcion().getFuncionId(id_funcion);       
        v.addObject("funcion", funcion);    
        Document sala = new Sala().getSala(nro_sala);  
        v.addObject("sala",sala);
        v.addObject("cantbutacas",cant_butacas);
        v.addObject("sumatotal",suma_total);
        v.setViewName("reservar_butacas");
        return v;
    }
    
    @RequestMapping("confirmar_reserva.htm")
    public ModelAndView confirmar_reserva(HttpServletRequest request)throws ParseException, FileUploadException, IOException{
        ModelAndView v = new ModelAndView();         
        String id_pelicula = request.getParameter("id_pelicula");
        String id_funcion = request.getParameter("id_funcion");
        String butacas = request.getParameter("butacas_seleccionadas");     
        String cant_butacas = request.getParameter("cant_butacas");   
        String suma_total = request.getParameter("suma_total");    
        String id_cliente = "12345678";
        
        Reserva r = new Reserva();
        r.setId_cliente(id_cliente);
        r.setId_funcion(id_funcion);
        r.setId_pelicula(id_pelicula);
        r.setButacas(butacas);
        r.setCant_butacas(cant_butacas);
        r.setSuma_total(suma_total);
        
        r.Insertar();
        
        
        Document funcion = new Funcion().getFuncionId(id_funcion);
        Funcion f = new Funcion();
        f.setId(id_funcion);
        f.setId_cartelera(funcion.get("id_cartelera").toString());
        f.setHorario(funcion.get("horario").toString());
        f.setNro_sala(funcion.get("nro_sala").toString());
        String butacasocupadas = funcion.get("butacas_ocupadas").toString();
        if(funcion.get("butacas_ocupadas").toString().length()>0){
            butacasocupadas = butacasocupadas+","+butacas;
        }
        else{
            butacasocupadas = butacasocupadas+butacas;

        }
        f.setButacas_ocupadas(butacasocupadas);
        
        f.Actualizar();
        v.setViewName("confirmar_reserva");
        return v;
    }
}
