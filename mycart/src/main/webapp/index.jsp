<%@page import="com.mycart.helper.Helper"%>
<%@page import="com.mycart.entities.Category"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.dao.ProductDao"%>
<%@page import="com.mycart.helper.FactoryProvider"%>
<html>
<head>
 <title>Mycart - Home</title>
 <!-- css -->
 <%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <!-- navbar -->
	<div class="container-fluid p-0 m-0">
	  <%@include file="components/navbar.jsp" %>
	</div>
	<!-- End navbar -->
	
	
	
	<div class="row mt-3 mx-2">
	
	   <%
	   
	   
	   //fetch all category
	   CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
	   List<Category> clist=categoryDao.getCategories();
	   
	   //fetch all product
	   ProductDao productDao=new ProductDao(FactoryProvider.getFactory());
	   List<Product> list=null;
	   
	   //fetch product data based on category id
	   String cat=request.getParameter("category");
	   
	   if(cat==null||cat.trim().equals("all"))
	   {
		   list=productDao.getAllProducts();
		   
	   }
	   else
	   {
		   int cid=Integer.parseInt(cat.trim());
		   list=productDao.getAllProductsById(cid);
	   }
	   
	   
	   %>
	
	    <!-- show category -->
	    <div class="col-md-2">
	      <div class="list-group mt-4">
	         <a href="index.jsp?category=all" class="list-group-item list-group-item-action active1">
			    All Products
			 </a>			
	      
	    
	    <%
	    for(Category category:clist)
	    {
	    	%>
	    	<!--  out.println(category.getCategoryTitle()+"<br>");-->
	    	<a href="index.jsp?category=<%=category.getCategoryId() %>" class="list-group-item list-group-item-action"><%= category.getCategoryTitle() %></a>
	    	<% 
	    }
	    %>
	    
	    </div>
	      
	    </div>
	    <!-- End show category -->
	    
	    <!-- show product -->
	    <div class="col-md-10">
	    
	      <%-- <h1>Number of products is <%=list.size() %></h1> --%>
	      
	      <!-- row -->
	      <div class="row mt-4">
	      
	         <div class="col-md-12">
	           
	             <div class="card-columns">
	             
	             <!-- traversing products -->
	             <%
			         for(Product product:list)
			         {
			        	 /* out.println(product.getpPhoto()+"<br>");
			        	 out.println(product.getpName()+"<br>"); */
			      %>
			          
			          <!-- Product card -->
				       <div class="card product-card">
				         <div class="container text-center">
				            <img class="card-img-top mt-2"  style="max-height: :200px; max-width: 100%;width: auto;" src="img/products/<%=product.getpPhoto() %>" alt="Card image cap">
						  
				         </div>
						 <div class="card-body">
						    <h5 class="card-title"><%=product.getpName() %></h5>
						    <p class="card-text"><%=Helper.get10Words(product.getpDes()) %></p>
						    <!-- <a href="#" class="btn btn-primary">Read More</a> -->
						  </div>
						   <div class="card-footer text-center">
						   <button class="btn custom-bg text-white" onclick="add_to_cart(<%=product.getpId()%>,'<%=product.getpName()%>',<%=product.getPriceAfterApplyingDiscount()%>);">Add to cart</button>
						   <button class="btn btn-outline-success">&#x20B9;<%=product.getPriceAfterApplyingDiscount() %>/-<span class="text-secondary discount-label"> <strike>&#x20B9;<%=product.getpPrice() %></strike>,<%=product.getpDiscount()%> % off</span></button>
						 </div>
						</div>
						
						
			         
			      
			      <%
			         }
	             
	              //if product data is not available
	              if(list.size()==0)
	              {
	            	  out.println("<h2>No item is this category</h2>");
	              }
			      %>
	             
	             </div>
	           
	         </div>
	        
	      </div>
	      
	      
	    </div>
	    <!-- End show product -->
	
	</div>

  <!-- modals -->
 <%@include file="components/common_modals.jsp" %>


</body>

</html>