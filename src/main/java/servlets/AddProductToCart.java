package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CartDAO;
import impl.CartDAOImpl;
import impl.UsersDAOImpl;
import model.Cart;

@WebServlet(urlPatterns = "/AddProductToCart")
public class AddProductToCart extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String un = req.getParameter("username");
		String q = req.getParameter("qty");
		
		int pid = Integer.parseInt(req.getParameter("pid"));
		
		System.out.printf("un: %s, q: %s, pid: %s", un, q, pid);

		Cart c = new Cart();
		
		c.setBa(new UsersDAOImpl().getUserAddress(un));
		c.setSa(new UsersDAOImpl().getUserAddress(un));

		c.setUn(un);
		c.setQ(q);
		c.setPid(pid);

		System.out.println(c);

		CartDAO cdao = new CartDAOImpl();

		cdao.insert(c);

		System.out.println("INSERTED SUCCESSFULLY");

		resp.sendRedirect("ViewCart.jsp");
	}

}
