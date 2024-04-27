import java.io.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/removepdf")
public class removepdf extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("p1");
//		System.out.print(name);
//		String pdfPath = "pdf/" + name;
		HttpSession s = request.getSession();
		String email = s.getAttribute("email").toString();	
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doc_saver","root","");
			PreparedStatement selectStatement = con.prepareStatement("delete from documents where name = ?");
			selectStatement.setString(1, name);
			
			int rs = selectStatement.executeUpdate();
			
			if(rs == 1) {
				String path = getServletContext().getRealPath("") + File.separator + "pdf";
                String filePath = path + File.separator + email + File.separator + name;
                System.out.print("actualfile path"+filePath);
                File fileToDelete = new File(filePath);
                
                if (fileToDelete.exists()) {
                    boolean deleted = fileToDelete.delete();
                    if (deleted) {
                        response.sendRedirect("homepage.jsp?msg=File+deleted");
                    } else {
                        response.sendRedirect("homepage.jsp?msg=File+not+deleted");
                    }
                } else {
                    response.sendRedirect("homepage.jsp?msg=File+not+found");
                }
            } else {
                System.out.println("PDF is not deleted");
            }
	}catch(Exception e) {
		
	}
	}	
}
