package dao;

import java.util.List;

import model.Cart;

public interface CartDAO {
	
	void insert(Cart c);
	
	void delete(int c);
	void delete(String username);
	
	int getCount(String username);
	
	Cart getCart(int cid);
	
	String getBillingAddress( String username );
	String getShippingAddress( String username );
	
	void updateBillingAndShippingAddress( String username, String billingAddress, String shippingAddress );
	
	List<Cart> getCart();
	List<Cart>getCart(String un);
}
