/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.mycart.dao;

import com.learn.mycart.entities.Product;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

 public class ProductDao {
     
      private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
     public boolean saveProduct(Product product)
     {
         boolean f=false;
         try
         {
             
          Session s= this.factory.openSession();
          Transaction tx=s.beginTransaction();
                  
          s.save(product);
          tx.commit();
         
          s.close();
           f=true;
          
         }
         catch(Exception e)
         {
             e.printStackTrace();
             f=false;
         }
         return f;
     }
     
     
     public List<Product> getAllProducts()
     {
         
        Session s= this.factory.openSession();
         
           Query query=s.createQuery("from Product");
          List<Product>list = query.list();
          
          return list;
          
         
     }
     public List<Product> getAllProductById(int cid)
     {
         
        Session s= this.factory.openSession();
         
           Query query=s.createQuery("from Product as p where p.category.categoryId=:id");
           query.setParameter("id",cid);
           List<Product>list = query.list();
          
          return list;
           
         
         
     }
     
 
     
     
    
}
