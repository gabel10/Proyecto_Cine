package controllers;

import java.io.IOException;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Funcion;
import models.Pelicula;
import models.Sala;
import models.Usuario;
import org.bson.Document;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReservaController {
    @RequestMapping("single.htm")
    public ModelAndView single(HttpServletRequest request){
        ModelAndView v = new ModelAndView();
         
        String id = request.getParameter("id");
        String url = request.getParameter("img");
        Document pelicula = new Pelicula().getPelicula(id);       
        v.addObject("dato", pelicula);
        v.addObject("id",id);
        v.addObject("url", url);
        v.setViewName("single");
        //return v;
    
        //v.addObject("datos", new Pelicula().getListaPeliculas());
        //v.setViewName("single");
        return v;
    }
    
    @RequestMapping("cantbutacas.htm")
    public ModelAndView butacas(HttpServletRequest request){
        ModelAndView v = new ModelAndView();
        String fun = request.getParameter("fun");
        //String cnt = request.getParameter("cant_total");
        v.addObject("funcion", fun);
        //v.addObject("cnt", cnt);
        //v.addObject("datos", new Pelicula().getListaPeliculas());
        v.setViewName("cantbutacas");
        
        return v;
    }

    

    
    
    @RequestMapping("reservarbutacas.htm")
    public ModelAndView reservar(HttpServletRequest request){
        ModelAndView v = new ModelAndView();
        //v.addObject("datos", new Pelicula().getListaPeliculas());
        String cnt = request.getParameter("cnt");
        v.addObject("cnt", cnt);
        
        String id_funcion = "4";
        
        Document funcion = new Funcion().getFuncion(id_funcion);
        String id_pelicula = funcion.get("id_pelicula").toString();
        String id_sala = funcion.get("id_sala").toString();
        Document sala = new Sala().getSala(id_sala);
        String asientos = sala.get("asientos").toString();
        
        v.addObject("funcion", funcion);
        v.addObject("ggpe", id_pelicula);
        
        v.addObject("asientos_sala", asientos);
        //v.addObject("id_sala", id_sala);
        
        
        v.setViewName("reservarbutacas");
        return v;
    }
    
    @RequestMapping("confirmacion_reserva.htm")
    public ModelAndView confirmacion_reserva(HttpServletRequest request){
        ModelAndView v = new ModelAndView();
        //v.addObject("datos", new Pelicula().getListaPeliculas());
        String asientos_nuevos = request.getParameter("asientos_nuevos");
        String id_sala = request.getParameter("id_sala");
        v.addObject("asientos_new", asientos_nuevos);
        v.addObject("id_sala", id_sala);
        
        
        
        Document sala = new Sala().getSala(id_sala);
        
        Sala sala_n = new Sala();
        sala_n.setId(id_sala);
        //sala_n.setNro_asientos(sala.get("nro_asientos").toString());
        //sala_n.setAsientos(asientos_nuevos);
        
        sala_n.Actualizar();
            
        
        v.setViewName("confirmacion_reserva");
        return v;
    }
    
    
   /* @RequestMapping("agregar_pelicula.htm") 
    public ModelAndView agregar_pelicula(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_pelicula/agregar_pelicula");
        return v;
    }
    
    @RequestMapping("modificar_pelicula.htm")
    public ModelAndView modificar_pelicula(HttpServletRequest request)throws ParseException{
        ModelAndView v = new ModelAndView();
        String id = request.getParameter("id");
        Document pelicula = new Pelicula().getPelicula(id);       
        v.addObject("dato", pelicula);
        v.addObject("id",id);
        v.setViewName("administrador/mantenimiento_pelicula/modificar_pelicula");
        return v;
    }*/
}
