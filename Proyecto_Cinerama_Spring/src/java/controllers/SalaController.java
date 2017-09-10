package controllers;

import java.io.IOException;
import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import models.Pelicula;
import models.Sala;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.bson.Document;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SalaController {
    @RequestMapping("index_salas.htm")
    public ModelAndView index_salas(){
        ModelAndView v = new ModelAndView();
       v.addObject("datos", new Sala().getListaSalas());
        v.setViewName("administrador/mantenimiento_salas/index_salas");
        return v;
    }
    
    @RequestMapping("agregar_sala.htm")
    public ModelAndView agregar_sala(){
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_salas/agregar_sala");
        return v;
    }
    @RequestMapping("modificar_sala.htm")
    public ModelAndView modificar_sala(HttpServletRequest request)throws ParseException{
        ModelAndView v = new ModelAndView();
        String id = request.getParameter("id");
        Document sala = new Sala().getSala(id);       
        v.addObject("dato", sala);
        v.addObject("id",id);
        v.setViewName("administrador/mantenimiento_salas/modificar_sala");
        return v;
    }
    
    @RequestMapping("guardar_datos_sala.htm")
    public ModelAndView guardar_datos_sala(HttpServletRequest request)throws ParseException, FileUploadException, IOException{
        ModelAndView v = new ModelAndView();
        String[] ar = request.getParameter("butacas").split("");
        int cant_butacas = 0;
        for(int i = 0;i<ar.length;i++){
            if(ar[i].equals("1")){
                cant_butacas++;
            }
        }
        Sala sala = new Sala();
        sala.setId(request.getParameter("numero"));
        sala.setFilas(request.getParameter("filas"));
        sala.setColumnas(request.getParameter("columnas"));
        sala.setButacas(request.getParameter("butacas"));
        sala.setCant_butacas(String.valueOf(cant_butacas));
        sala.Insertar();   
        v.addObject("datos",sala);
        v.setViewName("administrador/mantenimiento_salas/guardar_datos_sala");
        return v;
    }
    @RequestMapping("modificar_datos_sala.htm")
    public ModelAndView modificar_datos_sala(HttpServletRequest request)throws ParseException, FileUploadException, IOException{
        ModelAndView v = new ModelAndView();
        String[] ar = request.getParameter("butacas").split("");
        int cant_butacas = 0;
        for(int i = 0;i<ar.length;i++){
            if(ar[i].equals("1")){
                cant_butacas++;
            }
        }
        Sala sala = new Sala();
        sala.setId(request.getParameter("numero"));
        sala.setFilas(request.getParameter("filas"));
        sala.setColumnas(request.getParameter("columnas"));
        sala.setButacas(request.getParameter("butacas"));
        sala.setCant_butacas(String.valueOf(cant_butacas));
        sala.Actualizar();
        v.addObject("datos",sala);
        v.setViewName("administrador/mantenimiento_salas/modificar_datos_sala");
        return v;
    }
}