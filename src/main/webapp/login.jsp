<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="login.css"">
</head>
<body>
	<form action="login" method="post">
	    <div class="container">
	        <div class="inner-container">
	            <h2 style="text-align: center; color: #3C9AE2;">Login</h2>
	            <div>Email: </div>
	            <input type="email" name="email" required>
	            <div>Password: </div>
	            <input type="password" name="pass" required>
	            <% String msg = request.getParameter("inpas");
	            String nouser = request.getParameter("nouser");
	            %>
			    <% if (msg != null && !msg.isEmpty()) { %>
			        <p style="color:red"><%= msg %></p>
			    <% } %>
			    <% if (nouser != null && !nouser.isEmpty()) { %>
			        <p style="color:red"><%= nouser %></p>
			    <% } %>
	            <div class="btn-div"> 
	                <a href="login"><button>Login</button></a>
	                
	            </div>
	            <p>create a account! <a href="register.jsp">signup</a>
	        </div>
	    </div>
    </form>
</body>
</html>