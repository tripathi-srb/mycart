<!-- Success Message -->
<%

 String message = (String)session.getAttribute("message");
 if(message!=null)
 {
	 //prints message
	 //out.println(message);
	 
	 %>
		 
		 <div class="alert alert-success alert-dismissible fade show" role="alert">
	      <strong><%= message %></strong>
	      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	       <span aria-hidden="true">&times;</span>
	      </button>
	    </div>
		 
	 <%
	 session.removeAttribute("message");
 }
%>
<!-- End Success Message -->

<!-- Warning message -->
<%

 String warning_message = (String)session.getAttribute("warning_message");
 if(warning_message!=null)
 {
	 //prints message
	 //out.println(message);
	 
	 %>
		 
		 <div class="alert alert-warning alert-dismissible fade show" role="alert">
	      <strong><%= warning_message %></strong>
	      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
	       <span aria-hidden="true">&times;</span>
	      </button>
	    </div>
		 
	 <%
	 session.removeAttribute("warning_message");
 }
%>
<!-- End Warning message -->
