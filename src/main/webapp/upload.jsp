<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit File</title>
    <link rel="stylesheet" href="edit_file.css">
</head>
<body>
	<div class="navigation">
                <div class="edit-btn">
                    <a href="edit_file.html"><button>Edit</button></a>
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
	                Upload PDF here<input name="files" type="file" require>
	            </div>
	            <div>
	            	<input type="submit" value="upload">
	            </div>
	        </div>
	    </div>
    </form>
</body>
</html>