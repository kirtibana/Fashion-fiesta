package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.ProductDAO;
import impl.ProductDAOImpl;
import model.Product;

@WebServlet(urlPatterns="/UpdateProductToDB")
public class UpdateProductToDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt( req.getParameter("id") );
		String Category = req.getParameter("category");
		String Name = req.getParameter("name");
		String Quantity = req.getParameter("quantity");
		String Price = req.getParameter("price");
		String Description = req.getParameter("description");
		ProductDAO cdao = new ProductDAOImpl();
		

		System.out.printf("Id: %s, Category: %s, Name: %s, Quantity: %s, Price: %s, Description: %s",id, Category, Name, Quantity,
				Price, Description);

		
		Product c = cdao.getProduct(id);
		
		
		c.setName(Name);
		c.setQuantity(Quantity);
		c.setPrice(Price);
		c.setDescription(Description);
		c.setCategory(Category);
		
		System.out.println(c);

		ProductDAO cdao1 = new ProductDAOImpl();
		
		cdao1.update(c);
		
		System.out.println("INSERTED SUCCESSFULLY");
		
		resp.sendRedirect("ViewProduct.jsp");
		
	}

	
	
}
