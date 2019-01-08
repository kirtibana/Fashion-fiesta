package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import impl.UsersDAOImpl;

@WebServlet("/Login")
public class Login extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("Username"), password = req.getParameter("Password");
		
		UsersDAOImpl udao = new UsersDAOImpl();
		
		if( udao.getUsers(username, password) == null ) {
			
			req.setAttribute("invalid", "invalid");
			req.getRequestDispatcher("Login.jsp").forward(req, resp);
			
		}else {
			req.getSession().setAttribute("username", username);
			req.getSession().setAttribute("usernameRole", udao.getUsers(username, password).getRole() );
			resp.sendRedirect("Index.jsp");
		}
	}

	
	
}
