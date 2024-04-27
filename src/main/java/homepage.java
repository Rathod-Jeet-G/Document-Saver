import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@WebServlet("/homepage")
public class homepage extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name = request.getParameter("p1");
		HttpSession s = request.getSession();
		String semail = s.getAttribute("email").toString();
		String pdfPath = "pdf/"+ semail+"/" + name;
		if(name.endsWith(".pdf")) {
			out.println("<!DOCTYPE html>");
	        out.println("<html>");
	        out.println("<head>");
	        out.println("<meta charset=\"UTF-8\">");
	        out.println("<title>PDF Viewer</title>");
	        out.println("</head>");
	        out.println("<body>");
	        out.println("<iframe src=\"" + pdfPath + "\" width=\"100%\" height=\"800\"></iframe>");
	        out.println("</body>");
	        out.println("</html>");
		}
		else if(name.endsWith(".jpg")) {
			out.println("<!DOCTYPE html>");
	        out.println("<html>");
	        out.println("<head>");
	        out.println("<meta charset=\"UTF-8\">");
	        out.println("<title>PDF Viewer</title>");
	        out.println("</head>");
	        out.println("<body>");
	        out.println("<img src=\"" + pdfPath + "\" width=\"100%\" height=\"800\">");
	        out.println("</body>");
	        out.println("</html>");
		}
	}

}
