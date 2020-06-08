package com.mycart.dao;

import java.util.List;

import org.hibernate.query.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.mycart.entities.Category;

public class CategoryDao {
	
	private SessionFactory factory;
	
	public CategoryDao(SessionFactory factory) {
		this.factory=factory;
	}
    
	//save the category to DB 
	public int saveCategory(Category cat)
	{
		Session session=this.factory.openSession();
		Transaction tx=session.beginTransaction();
		
		int catId=(Integer) session.save(cat);
		
		tx.commit();
		session.close();
		return catId;
	}
	
	//List of category
	
	public List<Category> getCategories()
	{
		Session s=this.factory.openSession();
		Query q=s.createQuery("from Category");
		List<Category> list=q.list();
		return list;
	}
	
	
	//get category by id
	public Category getCategoryById(int cid)
	{
		Category cat=null;
		
		try {
			
			Session s=this.factory.openSession();
			cat=s.get(Category.class, cid);
			s.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cat;
	}
	
	
}