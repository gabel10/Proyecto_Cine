/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.mongodb.MongoClient;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;
import com.mongodb.client.gridfs.model.GridFSUploadOptions;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Pelicula;
import org.apache.tomcat.util.http.fileupload.FileItemIterator;
import org.apache.tomcat.util.http.fileupload.FileItemStream;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.bson.Document;
import org.bson.types.ObjectId;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Usuario
 */
public class ImagenController {
    
    private ServletFileUpload servletFileUpload;
    
    
    
    @RequestMapping("procesar_subida_imagen.htm")
    @ResponseBody
    public String procesar_subida_imagen(HttpServletRequest request)throws ParseException, FileUploadException, IOException{
        ModelAndView v = new ModelAndView();
        String respuesta = "ERROR";
         // creando nuevo archivo para manejar las subidas
        ServletFileUpload paSubir = new ServletFileUpload();
        // gestionando el o los archivos subidos
        if(paSubir.isMultipartContent(request)){
            FileItemIterator iter = paSubir.getItemIterator(request);
            while (iter.hasNext()) {
                FileItemStream item = iter.next();
                InputStream stream = item.openStream();
                if (item.isFormField()) {

                } else {//desde este modulo podemos hacer loq ue querramos con el INPUTSTREAM
                    
                    String nombreArch = item.getName();

                    //INSERTAR EN BD
                    //conexio a base de datos
                    MongoClient miCliente = new MongoClient("127.0.0.1", 27017);
                    MongoDatabase baseDatos = miCliente.getDatabase("dbcinerama");
                    GridFSBucket gridFSBucket = GridFSBuckets.create(baseDatos, "imagenes");
                    
                    GridFSUploadOptions opciones = new GridFSUploadOptions()
                            .chunkSizeBytes(1024)
                            .metadata(new Document("tipo", "imagen"));
                    ObjectId fileId = gridFSBucket.uploadFromStream(nombreArch, stream, opciones);
                    stream.close();
                    respuesta = "EXITO";
                    return respuesta;
                }
            }
        }
        return respuesta;
    }
    
    @RequestMapping("mostrar_imagen.htm")
    public ModelAndView mostrar_imagen(HttpServletRequest request,HttpServletResponse response)throws ParseException, IOException{
        String nomArchivo = request.getParameter("imagen");
        OutputStream salida = response.getOutputStream();

        MongoClient miCliente = new MongoClient("127.0.0.1", 27017);
        MongoDatabase baseDatos = miCliente.getDatabase("dbcinerama");
        GridFSBucket gridFSBucket = GridFSBuckets.create(baseDatos, "imagenes");

        gridFSBucket.downloadToStream(nomArchivo, salida);

        response.setContentType("image/jpg");

        salida.flush();
        salida.close();
        return null;
    }
    
    @RequestMapping("lista_imagenes.htm")
    public ModelAndView lista_imagenes(HttpServletRequest request)throws ParseException, IOException{
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_imagenes/lista_imagenes");
        return v;
    }
    
    @RequestMapping("agregar_imagen.htm")
    public ModelAndView agregar_imagen(HttpServletRequest request)throws ParseException, IOException{
        ModelAndView v = new ModelAndView();
        v.setViewName("administrador/mantenimiento_imagenes/agregar_imagen");
        return v;
    }
}
