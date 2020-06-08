<%@page import="com.mycart.helper.FactoryProvider"%>
<html>
<head>
 <title>Mycart - User Login</title>
 <!-- css -->
 <%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <!-- navbar -->
	<div class="container-fluid p-0 m-0">
	  <%@include file="/components/navbar.jsp" %>
	</div>
	<!-- End navbar -->
     
    <!-- login form -->
     <div class="container">
       <div class="row">
         <div class="col-md-6 offset-md-3">
           
           <div class="card mt-3">
           
             <div class="card-header custom-bg text-white">
                <h3>Login here</h3>
             </div>
             
             <div class="card-body">
             
             <!-- show message -->
		      <%@include file="components/message.jsp" %>
		      <!-- end message -->
             
                <form action="LoginServlet" method="post">
				  <div class="form-group">
				    <label for="exampleInputEmail1">Email address</label>
				    <input name="user_email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
				    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				  </div>
				  <div class="form-group">
				    <label for="exampleInputPassword1">Password</label>
				    <input name="user_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
				  </div>
				  
				 <a href="register.jsp" class="text-center d-block mb-2"> if not registered click here</a><br>
				  <div class="container text-center">
				    <button type="submit" class="btn btn-primary1 border-0">Submit</button>
				    <button type="reset" class="btn btn-primary1 border-0">Reset</button>
				  </div>
				  
				</form>
					  
             </div>
             
             
           
           </div>
           
         </div>
       </div>
     </div>
   <!-- End login form -->
  
  
  <%@ include file="components/common_modals.jsp" %>   
</body>

</html>
   