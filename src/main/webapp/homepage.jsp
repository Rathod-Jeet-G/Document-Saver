<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <link rel="stylesheet" href="homepage.css">
    <style>
    @charset "UTF-8";

@import url('https://fonts.googleapis.com/css2?family=Inter:wght@100..900&display=swap');

:root {
    --primary-color: #3C9AE2;
}


html, body {
    padding: 0;
    margin: 0;
    box-sizing: border-box;
    font-family: "Inter", sans-serif;
}

.navigation {
    background-color: black;
    display: flex;
    justify-content: end;
    padding-top: 20px;
    padding-bottom: 20px;
}

.navigation > div {
    margin-right: 50px;
}
/*.pdf-files-list {
    /* border: 2px solid red; */

.pdf-files-list > .box {
    /* border: 2px solid blue; */
    margin: 0px 50px;
}

.box  >  div {
    margin-left: 10px;
    margin-bottom: 10px;
    letter-spacing: 1px;
}

button {
    padding: 10px 15px 10px 15px;
    border-radius: 5px;
    font-weight: 700;
    border: 0;
    outline: 0;
    cursor: pointer;
    background-color: var(--primary-color);
    color: white;
}

button > a {
    border: 2px solid red;
    text-decoration: none;
    color: white;
}
.pdf_icon{
	width: 20px;
	padding-top:20px;
	margin-left:10px;
	margin-right:15px;
	
}
.pdf_name{
	text-decoration:none;
	color:black;
	
}

.content{
	background-color:#D3D3D3;
	display:inline-block;
	border-radius:20px;
}
.remove_icon{
	width: 30px;
	margin-left:1300px;
	display:inline-block;
	bottom:20px;
	background-color:#D3D3D3;
}
.icon_edits{
	margin-top:10px;
	display:inline;
	
}
.edit_icon{
	width: 30px;
	margin-left:20px;
	
}
#messageDiv{
	color:green;
	text-align:center;
}
    </style>
</head>

<body>
    <div>
        <div>
            <div class="navigation">
                <div class="edit-btn">
                    <a href="edit_file.jsp"><button>Edit</button></a>
                </div>
                <form action="logout" method="post">
                    <div class="logout-btn">
                        <a href="logout"><button>Log Out</button></a>
                    </div>
                </form>
            </div>
            <% if (session.getAttribute("email") == null) {
                response.sendRedirect("login.jsp");
            } else {
                try {
                    String email = session.getAttribute("email").toString();
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doc_saver", "root", "");
                    String query = "select * from documents where email = ?";
                    PreparedStatement pst = con.prepareStatement(query);
                    pst.setString(1, email);
                    ResultSet rs = pst.executeQuery();
                    %>
                    <div class="pdf-files-list">
                        <div class="box">
                            <h2>Your Files </h2>
                            <% while (rs.next()) { %>
                                <%
                                String pname = rs.getString("name");
                                %>
                                <div class="content">
                                    <img class="pdf_icon" src="pdf/pdf.png">
                                    <a class="pdf_name" href="homepage?p1=<%= pname %>"><%= pname %></a>
                                    <a href="removepdf?p1=<%= pname %>"><img class="remove_icon" src="pdf/remove.png"></a>
                                    <a href="edit_file.html"><div class="icon_edits"><img class="edit_icon" src="pdf/edit_icon.png"></a></div>
                                </div>
                            <% } %>
                        </div>
                    </div>
                <% } catch (Exception e) {
                    e.printStackTrace();
                }
            } %>
        </div>
        <% String msg = request.getParameter("msg"); %>
		<% if (msg != null && !msg.isEmpty()) { %>
    		<div id="messageDiv"><%= msg %></div>
    		<script>
        // Function to hide the message after 5 seconds
        		setTimeout(function() {
            		var messageDiv = document.getElementById("messageDiv");
            		if (messageDiv) {
                		messageDiv.style.display = "none";
            		}
        		}, 2000); // 5000 milliseconds = 5 seconds
    		</script>
		<% } %>
    </div>
</body>

</html>
