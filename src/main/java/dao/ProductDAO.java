package dao;

import java.util.List;
import java.util.Map;

import model.Product;

public interface ProductDAO {

	void insert(Product c);
	void update(Product c);
	void delete(int cid);
	
	Product getProduct(int cid);
	List<Product> getProduct();
	List<Product>getProduct(String categoryName);
	Map<String, List<Product>> getProductsByCategory();
}
