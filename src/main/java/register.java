import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.sql.*;
import java.util.Scanner;

@WebServlet("/register")
public class register extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String fname = request.getParameter("full name");
		String email = request.getParameter("email");
		String pass = request.getParameter("pass");
		String conpass = request.getParameter("conpass");
		HttpSession s = request.getSession();
		RequestDispatcher dis = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/doc_saver","root","");
			String query = "insert into register values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, fname);
			ps.setString(2, email);
			ps.setString(3, pass);
			ps.setString(4, conpass);
			int ans = ps.executeUpdate();
			System.out.println(ans);
			String msg;
			if(ans>0) {
//				s.setAttribute("status", "data inserted");
//				dis = request.getRequestDispatcher("register.html");
//				dis.forward(request, response);
				response.sendRedirect("register.jsp?msg=Data+Inserted");	
			}
			
		}catch(Exception e) {
			System.out.println(e);
			if(e instanceof java.sql.SQLIntegrityConstraintViolationException) {
				response.sendRedirect("register.jsp?msg=Allready+user+exist");
			}
		}
	}

}
