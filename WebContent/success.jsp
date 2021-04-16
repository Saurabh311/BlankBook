<%@page import="beans.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">

<title>Success Template · Bootstrap v5.0</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/signin.css" rel="stylesheet">

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
		
		<div class="row">
		
		<p>You can post your story</p>  

                

		

		</div>
	</div>

</body>
</html>