import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/login")
public class login extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		try {
			System.out.println(email);
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doc_saver","root","");
			PreparedStatement selectStatement = con.prepareStatement("select email, pass from register where email = ?");
			selectStatement.setString(1, email);
			ResultSet rs = selectStatement.executeQuery();
			HttpSession s = request.getSession();
			
			if (rs.next()) {
				String dbpas = rs.getString("pass");
				System.out.println(dbpas);
			    if (dbpas.equals(pass)) {
			    	s.setAttribute("email", email);
			    	System.out.println(s.getAttribute("email"));
			    	response.sendRedirect("homepage.jsp");
			    } else {
			    	response.sendRedirect("login.jsp?inpas=invalid+password");
			    }
			}else {
				response.sendRedirect("login.jsp?nouser=No+User+Found");
			}	
		}catch(Exception e) {
			
		}
		
	}

}
