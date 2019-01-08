package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Config;
import dao.UsersDAO;
import model.Users;

public class UsersDAOImpl implements UsersDAO {
	
	public String getUserAddress(String username) {
		Users c = new Users();

		String query = "select address from User1 where username= ?";

		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, username);
			
			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				return rs.getString("address");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}


	public Users getUsers(String username, String password) {
		Users c = new Users();

		String query = "select * from User1 where username= ? and password = ? and active = 1";

		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, username);
			p.setString(2, password);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				c.setUsername(rs.getString("Username"));
				c.setPassword(rs.getString("Password"));
				c.setEmail(rs.getString("Email"));
				c.setPhoneno(rs.getString("Phone_no"));
				c.setAddress(rs.getString("Address"));
				c.setRole(rs.getString("Role"));

				return c;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public void insert(Users c) {
		// TODO Auto-generated method stub
		String query = "insert into User1 (username,email, password, phone_no, address,role,active) values(?,?,?,?,?,?,?)";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, c.getUsername());
			p.setString(2, c.getEmail());
			p.setString(3, c.getPassword());
			p.setString(4, c.getPhoneno());
			p.setString(5, c.getAddress());
			p.setString(6, c.getRole());
			p.setInt(7, c.isActive() ? 1 : 0);

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void delete(int cid) {
		// TODO Auto-generated method stub
		String query = "delete from User1 where id=?";

		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, cid);

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Users getUsers(int cid) {
	
		String query = "select * from User1 where id= ?";

		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, cid);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				Users c1 = new Users();
				
				c1.setId(rs.getInt("id"));
				c1.setUsername(rs.getString("Username"));
				c1.setEmail(rs.getString("Email"));
				c1.setPassword(rs.getString("password"));
				c1.setPhoneno(rs.getString("phoneno"));
				c1.setAddress(rs.getString("address"));
			
				
				
				return c1;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Users> getUsers() {
		// TODO Auto-generated method stub
		List<Users> list = new ArrayList<Users>();
		String query = "select * from User1";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				Users c = new Users();

				c.setId(rs.getInt("id"));
				c.setUsername(rs.getString("username"));
				c.setEmail(rs.getString("Email"));
				c.setPassword(rs.getString("Password"));
				c.setPhoneno(rs.getString("phone_no"));
				c.setAddress(rs.getString("address"));
				c.setActive(rs.getInt("active")==1 ? true : false);
			
				list.add(c);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;
	}

	public void update(Users c) {
		// TODO Auto-generated method stub
		
	}

}
