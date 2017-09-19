/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

/**
 *
 * @author gabri
 */
public class Conexion {
    DBCollection countersCollection;
    
    protected MongoClient crearConexion() {
        MongoClient mongo = new MongoClient("127.0.0.1", 27017);
        return mongo;
    }
    
    public void createCountersCollection(String name) {
        try {
            MongoClient mongoClient = new MongoClient();
            DB database = mongoClient.getDB("dbcinerama");
            BasicDBObject document = new BasicDBObject();
            document.append("_id",name);
            document.append("seq", 0);            
            countersCollection.insert(document);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public Object getNextSequence(String name) {
        MongoClient mongoClient = new MongoClient();
        DB database = mongoClient.getDB("dbcinerama");
        countersCollection = database.getCollection("counters");
        DBObject objeto = countersCollection.findOne(name);
        if (objeto == null) {
            createCountersCollection(name);
        }        
        BasicDBObject searchQuery = new BasicDBObject("_id", name);
        BasicDBObject increase = new BasicDBObject("seq", 1);
        BasicDBObject updateQuery = new BasicDBObject("$inc", increase);
        DBObject result = countersCollection.findAndModify(searchQuery, null, null,
                false, updateQuery, true, false);
        return result.get("seq");
    }
}
