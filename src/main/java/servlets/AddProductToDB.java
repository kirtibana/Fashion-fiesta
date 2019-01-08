package servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import dao.ProductDAO;
import impl.ProductDAOImpl;
import model.Product;

@WebServlet(urlPatterns = "/AddProductToDB")
@MultipartConfig(maxRequestSize=10*1024*1024)
public class AddProductToDB extends HttpServlet {

	private String extractFileName(Part part) {
	    String contentDisp = part.getHeader("content-disposition");
	    String[] items = contentDisp.split(";");
	    for (String s : items) {
	        if (s.trim().startsWith("filename")) {
	            return s.substring(s.indexOf("=") + 2, s.length()-1);
	        }
	    }
	    return "";
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String category = req.getParameter("category");
		
		String quantity = req.getParameter("quantity");
		String  price = req.getParameter("price");
		
		String description = req.getParameter("description");

		System.out.printf("Name: %s, Category: %s, Quantity: %s, Price: %s, Description: %s", name, category, quantity,
				price, description);

		Product c = new Product();

		c.setName(name);
		c.setCategory(category);
		c.setQuantity(quantity);
		c.setPrice(price);
		c.setDescription(description);

		try {
	
			Part p = req.getPart("file");
			
			System.out.println(p.getSize());
			System.out.println(p.getContentType());
			System.out.println( "Original File Name: " + this.extractFileName(p) );
			
			String currPath = req.getRealPath("/");
			
			System.out.printf(" Curr Path: %s\n",currPath);
			
			File f = new File( currPath + "/" + this.extractFileName(p) );
			
			if( !f.exists() ){
				f.createNewFile();
			}
			
			byte b[] = new byte[ (int)p.getSize() ];
			
			p.getInputStream().read(b);
			
			FileOutputStream fos = new FileOutputStream(f);
			
			fos.write(b);
			
			fos.close();
			
			Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap(
					"cloud_name", "dffeoc9ms",
					  "api_key", "612348427315137",
					  "api_secret", "UQ60Mdh4A8zJEaO-iGCZHVhwlVg"));
			
			Map uploadResult = cloudinary.uploader().upload( f ,ObjectUtils.emptyMap());
		
			System.out.println(uploadResult.get("secure_url"));
			
			c.setImageUrl( uploadResult.get("secure_url").toString() );
			
		}catch( Exception e ) {
			e.printStackTrace();
		}
		
		ProductDAO cdao = new ProductDAOImpl();

		cdao.insert(c);

		System.out.println("INSERTED SUCCESSFULLY");

		resp.sendRedirect("ViewProduct.jsp");
	}

}

