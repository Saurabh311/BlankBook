<%@page import="beans.UserBean"%>
<%@page import="beans.StoryBean"%>

<%@page import="java.sql.ResultSet"%>

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
		
		<%
				
				StoryBean storyBean = (StoryBean)request.getAttribute("storyBean");
				
				if(storyBean != null) {
				ResultSet resultSet = storyBean.getResultSet();
				//Print messages
				String divClassForContainer = "container container-feed";
				String timePlacement = "time-right";
				while (resultSet.next()) {
					
					// Creating string variables to show which resultSet result is which.
					String storyUser = resultSet.getString(3);
					String storyHashTag = resultSet.getString(1);
					String storyMessage = resultSet.getString(2);
					
					
					// Print the feed on the website.
					out.println("<div class=\"" + divClassForContainer + "\">");
					out.println("<div class=\"feed-header\"><span class=\"storyUsersName\">" + storyUser + "</span> <span class=\"storyHashtag\">" + storyHashTag + "</span></div>");
					out.println("<p>" + storyMessage + "</p>");					
					out.println("</div>");
					
					// This will print either white background with time on the right or darker background with time on left of the feed messages
					if(divClassForContainer.equals("container container-feed")) {
						divClassForContainer = "container container-feed darker";
						timePlacement = "time-left";
					} else {
						divClassForContainer = "container container-feed";
						timePlacement = "time-right";
					}
				}				
				}
					
			
			%>
		
		<p>You can post your story</p>  
		
		
		
		    <form action="<%=request.getContextPath()%>/storyController" method="post">
 
            <p>
			#HashTag: <input type="text" required="required" name="hashTag" />
		    </p>
		    
	     	<p>
			Story: <textarea rows="10" cols="40" name="story" required="required" placeholder="Input your message here." maxlength="255"></textarea> <br>
	     	</p>
	
	     	<input type="submit" value="Post" />

            </form>    		

		</div>
	</div>



</body>
</html>