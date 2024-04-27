<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit File</title>
    <link rel="stylesheet" href="edit_page.css">
    <style>
    @charset "UTF-8";
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

.file-btn {
    width: 99.80%;
    height: 96.99vh;
    display: flex;
    justify-content: center;
    align-items: center;
    /* border: 2px solid red; */
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
.button {
    padding: 10px 15px 10px 15px;
    border-radius: 5px;
    font-weight: 700;
    border: 0;
    outline: 0;
    cursor: pointer;
    background-color: var(--primary-color);
    color: white;
}
#messageDiv{
	color:green;
	text-align:left;
}
    </style>
</head>
<body>
	<div class="navigation">
                <div class="edit-btn">
                    <a href="homepage.jsp"><button>Home</button></a>
                </div>
                <form action="logout" method = "post">
                	<div class="logout-btn">
                    	<a href="logout"><button>Log Out</button></a>
                	</div>
                </form>
            </div>
    <div>
    <form action="upload" method="post" enctype="multipart/form-data">
	        <div class="file-btn"> 
	            <div>
	            	<label>Upload PDF here</label><br>
	            	<br>	
	                <input class="button" name="files" type="file" >
	            </div>
	            <div>
	            	<br>
	            	<br>
	            	<input class="button" type="submit" value="Upload">
	            </div>
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
    </form>
</body>
</html>