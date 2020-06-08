<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>New User</title>
	<!-- css -->
	 <%@include file="components/common_css_js.jsp" %>
</head>
<body>
	<!-- navbar -->
	<%@include file="components/navbar.jsp" %>
	<!--End navbar  -->
	
	
	<!-- registraion form -->
  <div class="container-fluid">
	<div class="row mt-5">
	  <div class="col-md-6 offset-md-3">
	  
	    <div class="card">
	    
	      <!-- show message -->
	      <%@include file="components/message.jsp" %>
	      <!-- end message -->
	      
	      <div class="card-body px-5">
	          <h3 class="text-center my-3">Sign up Here</h3>
	   
	    <form action="RegisterServlet" method="post">
	      <div class="form-group">
		    <label for="name">User Name</label>
		    <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter here">
		  </div>
		  
		  <div class="form-group">
		    <label for="email">User Email</label>
		    <input name="user_email" type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Enter here">
		  </div>
		  
		  <div class="form-group">
		    <label for="password">User Password</label>
		    <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp" placeholder="Enter here">
		  </div>
		  
		  <div class="form-group">
		    <label for="phone">User Phone</label>
		    <input name="user_phone" type="text" class="form-control" id="phone" aria-describedby="emailHelp" placeholder="Enter here">
		  </div>
		  
		  <div class="form-group">
		    <label for="address">User Address</label>
		    <textarea name="user_address" class="form-control" rows="5"  placeholder="Enter here"></textarea>
		  </div>
		  
		  <div>
		    <div class="container text-center">
		      <button class="btn btn-outline-customSuccess">Register</button>
		      <button class="btn btn-outline-warning">Reset</button>
		    </div>
		  </div>
	    </form>
	      </div>
	    </div>
	   
	   
	  </div>
	</div>
  </div>
	<!-- End registration form -->
</body>
</html>