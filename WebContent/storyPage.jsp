<%@page import="beans.UserBean"%>
<%@page import="beans.StoryBean"%>

<%@page import="java.sql.ResultSet"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>

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
				 <button class="btn btn-danger"type="submit">Logout</button>
		</form><br>
		
		<div>
		
		
		
		<%
				
				StoryBean storyBean = (StoryBean)request.getAttribute("storyBean");
				
				if(storyBean != null) {
				ResultSet resultSet = storyBean.getResultSet();
				//Print messages
				while (resultSet.next()) {
					
					// Creating string variables to show which resultSet result is which.
					String storyUser = resultSet.getString(3);
					String storyHashTag = resultSet.getString(2);
					String storyMessage = resultSet.getString(1);
					
					
					// Print the feed on the website.
					out.println("<div class=\"card text-dark bg-warning mb-3\" style=\"max-width: 18rem;\">");
					out.println("<div class=\"card-header\" class=\"text-primary\"> From: " + storyUser + "</div>");
					out.println("<div class=\"card-body\"> <h5 class=\"card-title\">" + storyHashTag + "</h5>");		
					out.println( "<p class=\"card-text\">" + storyMessage + "</p>");
					out.println("</div></div>");				
					
					
				}				
				}			
			%>		
		
		
		    <form action="<%=request.getContextPath()%>/storyController" method="post">
 
            <div class="input-group mb-3">
            <span class="input-group-text" id="basic-addon1">#</span>
             <input type="text" required="required" color="blue" name="hashTag"  class="form-control" placeholder="HashTag" aria-label="Username" aria-describedby="basic-addon1">
           </div>
		    
	     	     	
	     	<div class="form-floating">
              <textarea name="story" required="required" class="form-control" id="floatingTextarea2" style="height: 100px"></textarea>
              <label for="floatingTextarea2">Write the story</label>
           </div><br>
	
	     	<button type="submit" class="btn btn-success">Post</button>

            </form>    		

		</div>
	</div>




</body>
</html>