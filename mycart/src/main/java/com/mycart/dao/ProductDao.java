package com.mycart.dao;

import java.util.List;

import org.hibernate.query.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entities.Product;

public class ProductDao {
	
private SessionFactory factory;
	
	public ProductDao(SessionFactory factory) {
		this.factory=factory;
	}

	public boolean saveProduct(Product product)
	{
		boolean f=false;
		try {
			
			Session s = this.factory.openSession();
			Transaction tx=s.beginTransaction();
			
			s.save(product);
			
			tx.commit();
			s.close();
			 f=true;
			
		} catch (Exception e) {
			e.printStackTrace();
			f=false;
		}
		
		return f;
	}
	
	
	//get all products
	public List<Product> getAllProducts()
	{
		Session s=this.factory.openSession();
		Query q=s.createQuery("from Product");
		List<Product> list=q.list();
		return list;
		
	}
	
	//get products based on category id
		public List<Product> getAllProductsById(int cid)
		{
			Session s=this.factory.openSession();
			Query q=s.createQuery("from Product as p where p.category.categoryId =: id");
			q.setParameter("id", cid);
			List<Product> list=q.list();
			return list;
			
		}
}
