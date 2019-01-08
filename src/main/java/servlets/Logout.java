package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns="/Logout1")
public class Logout extends HttpServlet {

	public Logout() {
		super();
		System.out.println("Logout Created");
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getSession().invalidate();
		
		System.out.println("Logout");
		
		resp.sendRedirect("Index.jsp");

	}

}
