import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.io.IOException;

@WebServlet("/upload")
@MultipartConfig
public class upload extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Part p = request.getPart("files");
		PrintWriter out = response.getWriter();	

		String Filename = p.getSubmittedFileName();

		HttpSession s = request.getSession();
		String semail = s.getAttribute("email").toString();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doc_saver","root","");
			
			String query = "SELECT * FROM documents WHERE email=? AND name=?";
	        PreparedStatement selectStatement = con.prepareStatement(query);
	        selectStatement.setString(1, semail);
	        selectStatement.setString(2, Filename);
	        ResultSet rs = selectStatement.executeQuery();
	        
	        if(rs.next()) {
	        	String path = getServletContext().getRealPath("")+"pdf";

				File f = new File(path);
				System.out.println(path);
				String updated = semail+f.separator+Filename;
				
				String parentFolderName = path;
		        String folderName = semail;
		        Path parentFolderPath = Paths.get(parentFolderName);
		        Path folderPath = parentFolderPath.resolve(folderName); // Resolving child folder path relative to parent folder
		        String lastFilePath = folderPath.toString();
		        Path lastPath = Paths.get(lastFilePath);
		        
//		        System.out.println("The folder path : " + lastPath);


		        if (Files.exists(lastPath) && Files.isDirectory(lastPath)) {
//		            System.out.println("Folder exists.");
		            p.write(lastPath+ f.separator + Filename);
		            response.sendRedirect("edit_file.jsp?msg=file+uploaded");
		        } else {
//		            System.out.println("Folder does not exist.");
		            try {
		                Path createdFolderPath = Files.createDirectory(folderPath);
//		                System.out.println("Folder created successfully at: " + createdFolderPath);
//		                System.out.println(lastPath);
		                p.write(lastPath+ f.separator + Filename);
		                response.sendRedirect("edit_file.jsp?msg=file+Not+uploaded");
		            } catch (IOException e) {
		                System.err.println("Failed to create folder: " + e.getMessage());
		            }
		        }
			}else {
				String insertQuery = "INSERT INTO documents (email, name) VALUES (?, ?)";
                PreparedStatement insertStatement = con.prepareStatement(insertQuery);
                insertStatement.setString(1, semail);
                insertStatement.setString(2, Filename);
                int insertedRows = insertStatement.executeUpdate();

                if (insertedRows == 1) {
                    // Successfully inserted into the database, now upload to folder
                    String path = getServletContext().getRealPath("") + File.separator + "pdf";
                    File f = new File(path);

                    // Folder creation of user
                    String parentFolderName = path;
                    String folderName = semail;
                    Path parentFolderPath = Paths.get(parentFolderName);
                    Path folderPath = parentFolderPath.resolve(folderName); // Resolving child folder path relative to parent folder

                    try {
                        if (!Files.exists(folderPath)) {
                            // Create the folder if it does not exist
                            Files.createDirectories(folderPath);
                        }
                        // Write the file to the folder
                        p.write(folderPath + File.separator + Filename);
                        response.sendRedirect("edit_file.jsp?msg=file+uploaded");
                    } catch (IOException e) {
                        System.err.println("Failed to create folder: " + e.getMessage());
                        response.sendRedirect("edit_file.jsp?msg=file+upload+failed");
                    }
                } else {
                    // Insert into database failed
                    response.sendRedirect("edit_file.jsp?msg=db+insert+failed");
                }
			}
		}catch(Exception e) {
			System.err.println(e);		
	}
 }
}

