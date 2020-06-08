package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycart.entities.User;
import com.mycart.helper.FactoryProvider;



@MultipartConfig
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
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
		//get session
		HttpSession httpSession=request.getSession();
		try {
			
			String userName=request.getParameter("user_name");
			String userEmail=request.getParameter("user_email");
			String userPassword=request.getParameter("user_password");
			String userPhone=request.getParameter("user_phone");
			String userAddress=request.getParameter("user_address");
			
		


			
			
			
			/*httpSession.setAttribute("message", "Please provide unique mail id "+userEmail);
			response.sendRedirect("register.jsp");
			return;*/
			
			
			//creating user object to store data
			User user=new User(userName, userEmail, userPassword, userPhone, "default.jpg", userAddress, "normal");
			
			//open hibernate session factory
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			int userId=(Integer) s.save(user);
			tx.commit();
			s.close();
			
			
			
			httpSession.setAttribute("message", "Registration Successful !! user ID is "+user.getUserId());
			response.sendRedirect("register.jsp");
			return;
			
			
			
			/*out.println("successfully saved");
			out.println("<br> User id is "+userId);*/
			
		} catch (Exception e) {
			e.printStackTrace();
			
			//out.println("mail issues");
	        
	
		}
		httpSession.setAttribute("warning_message", "Somthing went wrong !!! ");
		response.sendRedirect("register.jsp");
		return;
		//out.println("mail issues1");
		
	}

}
