package com.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycart.dao.CategoryDao;
import com.mycart.dao.ProductDao;
import com.mycart.dao.UserDao;
import com.mycart.entities.Category;
import com.mycart.entities.Product;
import com.mycart.entities.User;
import com.mycart.helper.FactoryProvider;



@MultipartConfig
@WebServlet("/ProductOperationServlet")
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
        
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		//out.println("login servlet");
		
		try {
			
			//servlet 2: add category or add product
			String op=request.getParameter("operation");
			
			if(op.trim().equals("addcategory"))
			{
			 //Fetching category data
			String title=request.getParameter("catTitle");
			String description=request.getParameter("catDescription");
			//out.println(op +" : "+title+" : "+description);
			
			Category category=new Category();
			category.setCategoryTitle(title);
			category.setCategoryDescription(description);
			
			//category database save
			CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
			int catId=categoryDao.saveCategory(category);
			//out.println("category save");
			
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("message", "Category Added Successfully..."+catId);
			response.sendRedirect("admin.jsp");
			return;
			
			}
			else if(op.trim().equals("addproduct"))
			{
				//fetching product data
				String name=request.getParameter("pName");
				String description=request.getParameter("pDescription");
				int price=Integer.parseInt(request.getParameter("pPrice"));
				int discount=Integer.parseInt(request.getParameter("pDiscount"));
				int quantity=Integer.parseInt(request.getParameter("pQuantity"));
				int catId=Integer.parseInt(request.getParameter("catId")); 
				Part part=request.getPart("pPhoto");
				
				Product product=new Product();
				product.setpName(name);
				product.setpDes(description);
				product.setpPrice(price);
				product.setpDiscount(discount);
				product.setpQuantity(quantity);
				product.setpPhoto(part.getSubmittedFileName());
				
				
				//get category by id
				CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
				Category category=categoryDao.getCategoryById(catId);
				
				product.setCategory(category);
				
				//product save
				
				ProductDao productDao=new ProductDao(FactoryProvider.getFactory());
				productDao.saveProduct(product);
				
				//photo upload
				//find out the path to upload photo
                String path=request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
                System.out.println("path....................."+path);
                
                
                
                //uploading code..
                try {
                	
                	FileOutputStream fos=new FileOutputStream(path);
                    InputStream is=part.getInputStream();
                    
                    //reading data
                    byte []data=new byte[is.available()];
                    is.read(data);
    				
    				//writing the data
                    fos.write(data);
                    
                    fos.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
                
				
				HttpSession httpSession=request.getSession();
				httpSession.setAttribute("message", "Product Added Successfully...");
				response.sendRedirect("admin.jsp");
				return;
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}
	}


