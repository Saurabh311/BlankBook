<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// check if there is a session with an user

if (session.getAttribute("user") != null) {

	// there is one goto the login servlet
	RequestDispatcher rd = request.getRequestDispatcher("Login");
	rd.forward(request, response);// this lands on the GET in the servlet
}
%>






<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
   
    <title>Log in page Template · Bootstrap v5.0</title>

  
           <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/signin.css" rel="stylesheet">
</head>
 <body class="text-center">
 
 <main>


	<form action="<%=request.getContextPath()%>/Login" method="post">
		<p>
			Username: <input type="text" name="email" />
		</p>
		<p>
			Password: <input type="password" name="password" />
		</p>
		<input type="submit" value="Login" />
	</form>
	
	

  
</main>
	
	
	
	
	
	
	
	
	
	
	
	  <!--randomword api-->
   <script src="js/fetchWord.js"></script>
    
	
	
</body>
</html>