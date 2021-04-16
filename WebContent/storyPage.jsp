<%@page import="beans.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div class="container">

		<div class="row">

			<%
			// Check to see if the session has a user bean.
					if (session.getAttribute("user") == null) {

						// if there is not one, goto the logout servlet
						RequestDispatcher rd = request.getRequestDispatcher("Logout");
						rd.forward(request, response);
					} else {
						// if there is a session , then all is well  

						// get the bean to unpack the user data
						UserBean bean = (UserBean) request.getAttribute("user");

						out.print("<h1>Welcome, " + bean.getName() + "</h1>");
					}
			%>
		</div>


		<form action="<%=request.getContextPath()%>/Logout" method="post">
				 <button class="w-100 btn btn-lg btn-primary" type="submit">Log out</button>
		</form>
		
		<div>
		
		<p>You can post your story</p>  
		
		
		    <form action="<%=request.getContextPath()%>/storyController" method="post">
 
            <p>
			#HashTag: <input type="text" name="hashTag" />
		    </p>
		    
	     	<p>
			Story: <input type="text" name="story" />
	     	</p>
	
	     	<input type="submit" value="Post" />

            </form>    		

		</div>
	</div>



</body>
</html>