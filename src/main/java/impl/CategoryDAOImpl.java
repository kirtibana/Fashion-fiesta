package impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import config.Config;
import dao.CategoryDAO;
import model.Category;

public class CategoryDAOImpl implements CategoryDAO {

	public void insert(Category c) {
		String query = "insert into Category (name,description) values (?,?)";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, c.getName());
			p.setString(2, c.getDescription());

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void update(Category c) {
		// TODO Auto-generated method stub
		String query = "update Category set name=?, description=? where id=?";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setString(1, c.getName());
			p.setString(2, c.getDescription());
			p.setInt(3, c.getId());

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void delete(int cid) {
		// TODO Auto-generated method stub
		String query = "delete from Category where id=?";

		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, cid);

			p.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Category getCategory(int cid) {
		// TODO Auto-generated method stub
		Category c = new Category();

		String query = "select * from Category where id= ?";

		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			p.setInt(1, cid);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescription(rs.getString("description"));

				return c;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public List<Category> getCategory() {
		List<Category> list = new ArrayList<Category>();
		String query = "select * from Category";
		try {

			Connection conn = Config.conn;

			PreparedStatement p = conn.prepareStatement(query);

			ResultSet rs = p.executeQuery();

			while (rs.next()) {

				Category c = new Category();

				c.setId(rs.getInt("id"));
				c.setName(rs.getString("name"));
				c.setDescription(rs.getString("description"));

				list.add(c);

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		return list;
	}

}
