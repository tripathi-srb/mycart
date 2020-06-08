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
    	if(user.getUserType().equals("admin"))
    	{
    		session.setAttribute("warning_message", "You are not Normal User !! Do not access this page");
        	response.sendRedirect("login.jsp");
    		return;
    	}
    }



%>
<html>
<head>
 <title>Mycart - Normal</title>
 <!-- css -->
 <%@include file="components/common_css_js.jsp" %>
</head>
<body>
    <!-- navbar -->
	<div class="container-fluid p-0 m-0">
	  <%@include file="components/navbar.jsp" %>
	</div>
	<!-- End navbar -->
<h1>Normal User</h1>


<%@ include file="components/common_modals.jsp" %>
</body>


</html>
   