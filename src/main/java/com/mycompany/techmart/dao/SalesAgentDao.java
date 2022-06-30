package com.mycompany.techmart.dao;

import com.mycompany.techmart.entities.User;
import com.mycompany.techmart.entities.User;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class SalesAgentDao {

    private SessionFactory factory;

    public SalesAgentDao(SessionFactory factory) {
        this.factory = factory;
    }
    

    public int saveSalesAgent(User user){
        Session session = this.factory.openSession();
        Transaction tx = session.beginTransaction();       
        int userId =(int) session.save(user);
        tx.commit();     
        session.close();    
        return userId;
        
    }

    
    
}
