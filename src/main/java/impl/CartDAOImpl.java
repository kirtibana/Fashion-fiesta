package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Config;
import dao.CartDAO;
import model.Cart;

public class CartDAOImpl implements CartDAO{

	public String getBillingAddress(String username) {

		String query = "select ba from Cart where un=?";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, username);
			
			ResultSet rs = p.executeQuery();
			if(rs.next()){
				
				return rs.getString("ba");
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public String getShippingAddress(String username) {
		String query = "select sa from Cart where un=?";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, username);
			
			ResultSet rs = p.executeQuery();
			if(rs.next()){
				
				return rs.getString("sa");
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public void updateBillingAndShippingAddress(String username, String billingAddress, String shippingAddress) {
		String query = "update Cart set sa=? ,ba= ? where un=?";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, shippingAddress);
			p.setString(2, billingAddress);
			p.setString(3, username);
			
			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insert(Cart c) {
		// TODO Auto-generated method stub
		String query = "insert into Cart (un,pid,sa,ba,q) values (?,?,?,?,?)";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, c.getUn());
			p.setInt(2, c.getPid());
			p.setString(3, c.getSa());
			p.setString(4, c.getBa());
			p.setString(5, c.getQ());
			
			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void delete(int c) {
		// TODO Auto-generated method stub
		String query = "delete from Cart where id=?";

		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, c);

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Cart getCart(int cid) {
		// TODO Auto-generated method stub
		Cart c = new Cart();

		String query = "select * from Cart where id= ?";

		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, cid);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				c.setId(rs.getInt("id"));
				c.setUn(rs.getString("un"));
				c.setPid(rs.getInt("pid"));
				c.setSa(rs.getString("sa"));
				c.setBa(rs.getString("ba"));
				c.setQ(rs.getString("q"));

				return c;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Cart> getCart(String un) {
		// TODO Auto-generated method stub
		List<Cart> list = new ArrayList<Cart>();
		String query = "select * from Cart where un=?";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);
			
			p.setString(1, un);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				Cart c = new Cart();

				c.setId(rs.getInt("id"));
				c.setUn(rs.getString("un"));
				c.setPid(rs.getInt("pid"));
				c.setSa(rs.getString("sa"));
				c.setBa(rs.getString("ba"));
				c.setQ(rs.getString("q"));

				c.setProduct(new ProductDAOImpl().getProduct(c.getPid()));
				
				list.add(c);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}
		return list;
	}

	public List<Cart> getCart() {
		// TODO Auto-generated method stub
		return null;
	}

	public void delete(String username) {
		// TODO Auto-generated method stub
		String query = "delete from Cart where un=?";

		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, username);

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public int getCount(String username) {
		// TODO Auto-generated method stub
		String query = "select * from Cart where un=?";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, username);
			
			ResultSet rs = p.executeQuery();

			int count = 0;
			
			while (rs.next()) {
				count++;
			}
			
			return count;
		}
		catch (Exception e) {

		e.printStackTrace();
		}
		
		return 0;
	}

	


	

}
