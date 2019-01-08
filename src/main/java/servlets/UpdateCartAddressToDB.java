package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import impl.CartDAOImpl;

@WebServlet(urlPatterns="/UpdateCartAddressToDB")
public class UpdateCartAddressToDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		CartDAO cdao = new CartDAOImpl();
		
		cdao.updateBillingAndShippingAddress(req.getSession().getAttribute("username").toString(), req.getParameter("ba"), req.getParameter("sa"));
		
		resp.sendRedirect("ConfirmAddress.jsp");
		
	}

	
	
}
