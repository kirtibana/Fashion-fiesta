package dao;

import java.util.List;

import model.Users;

public interface UsersDAO {
	
	void insert(Users c);
	
	void delete(int c);
	
	Users getUsers(int cid);
	List<Users> getUsers();
	String getUserAddress( String username );
}
