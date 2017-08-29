/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import com.mongodb.MongoClient;

/**
 *
 * @author gabri
 */
public class Conexion {
    
    protected MongoClient crearConexion() {
        MongoClient mongo = new MongoClient("127.0.0.1", 27017);
        return mongo;
    }
}
