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

import com.mycart.dao.UserDao;
import com.mycart.entities.User;
import com.mycart.helper.FactoryProvider;



@MultipartConfig
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
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
			
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			//out.println(email+" : "+password);
			
			//validation
			
			
			//authenticating user
			UserDao userDao=new UserDao(FactoryProvider.getFactory());
			User user=userDao.getUsertByEmailAndPassword(email, password);
			//out.println(user);
			
			
			//get session
			HttpSession httpSession=request.getSession();
			
			
			if(user==null)
			{
				//out.println("<h1>Invallid details</h1>");
				httpSession.setAttribute("warning_message", "Invalid Details !! Try with another one");
				response.sendRedirect("login.jsp");
				return;
				
			}
			else
			{
				//out.println("<h1>Welcome :</h1>"+user.getUserName());
				
				//login
				httpSession.setAttribute("current-user", user);
				
				
				if(user.getUserType().equals("admin"))
				{
					//aadmin user : admin.jsp
					response.sendRedirect("admin.jsp");
					
				}else if(user.getUserType().equals("normal"))
				{
					//normar user : normal.jsp
					response.sendRedirect("normal.jsp");
					
				}
				else
				{
					out.println("We have not identified user type");
				}
				
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
