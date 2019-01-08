package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CategoryDAO;
import impl.CategoryDAOImpl;
import model.Category;

@WebServlet(urlPatterns="/UpdateCategoryToDB")
public class UpdateCategoryToDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id = Integer.parseInt( req.getParameter("id") );
		String name = req.getParameter("name");
		String description = req.getParameter("description");
		
		CategoryDAO cdao = new CategoryDAOImpl();
		
		Category c = cdao.getCategory(id);
		
		c.setDescription(description);
		c.setName(name);
		
		cdao.update(c);
		
		resp.sendRedirect("ViewCategories.jsp");
		
	}

	
	
}
