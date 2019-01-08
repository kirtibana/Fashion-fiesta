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

@WebServlet(urlPatterns = "/AddCategoryToDB")
public class  AddCategoryToDB extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {

		String name = req.getParameter("name");
		String description = req.getParameter("description");

		System.out.printf("Name: %s, Description: %s", name, description);

		Category c = new Category();

		c.setName(name);
		c.setDescription(description);

		System.out.println(c);

		CategoryDAO cdao = new CategoryDAOImpl();

		cdao.insert(c);

		System.out.println("INSERTED SUCCESSFULLY");
	
		resp.sendRedirect("ViewCategories.jsp");
	}

}
