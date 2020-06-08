<%@page import="com.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycart.dao.CategoryDao"%>
<%@page import="com.mycart.entities.User"%>
<%@page import="com.mycart.helper.FactoryProvider"%>

<%

    //check login or not
    
    User user=(User)session.getAttribute("current-user");
    if(user==null)
    {
    	session.setAttribute("warning_message", "You are not logged in !! Login first");
    	response.sendRedirect("login.jsp");
    	return;
    }
    else
    {
    	if(user.getUserType().equals("normal"))
    	{
    		session.setAttribute("warning_message", "You are not Admin !! Do not access this page");
        	response.sendRedirect("login.jsp");
    		return;
    	}
    }



%>



<html>
<head>
 <title>Admin Panel</title>
 <!-- css -->
 <%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <!-- navbar -->
	<div class="container-fluid p-0 m-0">
	  <%@include file="components/navbar.jsp" %>
	</div>
	<!-- End navbar -->

    <div class="container admin">
    
  
    <!-- show message -->
	      <%@include file="components/message.jsp" %>
	<!-- end message -->
    
      
      <!-- first row -->
      <div class="row mt-3">
      
        <!-- first col -->
        <div class="col-md-4">
        
           <!-- First box -->
           <div class="card">
             <div class="card-body text-center">
             
                <div class="container">
                   <img style="max-width: 120px" class="img-fluid rounded-circle" alt="users_icon" src="img/users.png">
                </div>
                <h1>545</h1>
                <h1 class="text-uppercase text-muted">Users</h1>
             </div>
           </div>
           
        </div>
        
        <!-- second col -->
         <div class="col-md-4">
         
             <!-- Second box -->
             <div class="card">
             <div class="card-body text-center">
             
                <div class="container">
                   <img style="max-width: 120px" class="img-fluid rounded-circle" alt="category_icon" src="img/category.png">
                </div>
                <h1>5465</h1>
                <h1 class="text-uppercase text-muted">Categories</h1>
             </div>
           </div>
           
         </div>
         
         <!-- third col -->
          <div class="col-md-4">
          
             <!-- third box -->
             <div class="card">
             <div class="card-body text-center">
             
                <div class="container">
                   <img style="max-width: 120px" class="img-fluid rounded-circle" alt="products_icon" src="img/products.png">
                </div>
                <h1>6465</h1>
                <h1 class="text-uppercase text-muted">Products</h1>
             </div>
           </div>
           
          </div>
          
      </div>
      
      <!-- End first row -->
      
      <!-- second row -->
      <div class="row mt-3">
      
        <!-- first col -->
        <div class="col-md-6">
           <!-- First box -->
             <div class="card" data-toggle="modal" data-target="#add-category-modal">
             <div class="card-body text-center">
             
                <div class="container">
                   <img style="max-width: 120px" class="img-fluid rounded-circle" alt="add_category_icon" src="img/add_producte.png">
                </div>
                <p class="mt-2">Click here to add new category</p>
                <h1 class="text-uppercase text-muted">Add Category</h1>
             </div>
           </div>
        </div>
        
        <!-- Second col -->
        <div class="col-md-6">
          <!-- second box -->
             <div class="card" data-toggle="modal" data-target="#add-product-modal">
             <div class="card-body text-center">
             
                <div class="container">
                   <img style="max-width: 120px" class="img-fluid rounded-circle" alt="ui_icon" src="img/ui.png">
                </div>
                <p class="mt-2">Click here to add new Product</p1>
                <h1 class="text-uppercase text-muted">Add Product</h1>
             </div>
           </div>
        </div>
        
      </div>
      <!-- End second row -->
      
    </div>
    
    
    
    <!-- Add Category Model -->
    
         <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header custom-bg text-white">
			        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        
			        <form action="ProductOperationServlet" method="post">
			          
			          <input type="hidden" name="operation" value="addcategory">
			          
			          <div class="form-group">
			            <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required>
			          </div>
			          
			          <div class="form-group">
			            <textarea rows="10" class="form-control" name="catDescription" placeholder="Enter category Description" required></textarea>
			          </div>
			          
			          <div class="container text-center">
			            <button type="submit" class="btn btn-outline-customSuccess">Add Category</button>
			            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			          </div>
			          
			        </form>
			        
			      </div>
			      
			    </div>
			  </div>
		</div>
			    
	<!-- End Add Category Model -->
	
	
	 <!-- Add Product Model -->
    
         <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header custom-bg text-white">
			        <h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        
			        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
			          
			          <input type="hidden" name="operation" value="addproduct">
			          
			          <div class="form-group">
			            <input type="text" class="form-control" name="pName" placeholder="Enter Product name" required>
			          </div>
			          
			          <div class="form-group">
			            <textarea rows="6" class="form-control" name="pDescription" placeholder="Enter Product Description" required></textarea>
			          </div>
			          
			          <div class="form-group">
			            <input type="number" class="form-control" name="pPrice" placeholder="Enter Product price" required>
			          </div>
			          
			          <div class="form-group">
			            <input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required>
			          </div>
			          
			          <div class="form-group">
			            <input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required>
			          </div>
			          
			          <!-- get category from DB -->
			          <%
			             CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
			             List<Category> list=categoryDao.getCategories();
			          %>
			          
			          <div class="form-group">
			            <select id="category" name="catId" class="form-control">
			              
			              <%
			                 for(Category c:list)
			                 {
			              %>
			                   <option value="<%= c.getCategoryId()%>"><%=c.getCategoryTitle() %></option>
			              <%
			                 }
			              %>
						</select>
			          </div>
			          
			          <div class="form-group">
			          <label for="category" id="pPic">Select Photo:</label>
			            <input type="file" id="pPic" class="form-control" name="pPhoto" required/>
			          </div>
			          
			          <div class="container text-center">
			            <button type="submit" class="btn btn-outline-customSuccess">Add Product</button>
			            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			        
			          </div>
			          
			        </form>
			        
			      </div>
			     </form>
			        
			      </div>
			      
			    </div>
			  </div>
		</div>
			    
	<!-- End Add Product Model -->

<%@ include file="components/common_modals.jsp" %>

</body>

</html>
    