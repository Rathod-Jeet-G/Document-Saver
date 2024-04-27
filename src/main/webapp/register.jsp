<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="register.css">
</head>
<body>
	<form action="register" method="post">
    <div class="container">
        <div class="inner-container">
            <h2 style="text-align: center; color: #3C9AE2;">Register</h2>
            <div>Full Name: </div>
            <input type="text" name="full name">
            <div>Email: </div>
            <input type="text" name="email">
            <div>Password: </div>
            <input type="password" name="pass">
            <div>Confirm Password: </div>
            <input type="password" name="conpass">
            <% String msg = request.getParameter("msg"); %>
		    <% if (msg != null && !msg.isEmpty()) { %>
		        <p><%= msg %></p>
		    <% } %>
            <div class="btn-div"> 
                <a href="register"><button>register</button></a>
                	
            </div>
            <P>if you have an account?<a href="login.jsp">Login</a></P>
        </div>
    </div>
    </form>
</body>
</html>