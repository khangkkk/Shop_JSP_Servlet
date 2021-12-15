package my.com.dao;

import java.sql.SQLException;

import my.com.model.User;

public interface UserDAO {
	// check account exist
	public User isAccountExist(User user) throws SQLException;

	// check username exist
	public boolean isUsernameExist(String username) throws SQLException;

	// get salt for password by username
	public String getSaltPassword(String username) throws SQLException;

	// insert a user
	public boolean insertUser(User user) throws SQLException;

	// update information of user
	public boolean updateUser(User user) throws SQLException;
	
	//
	public User getDetailInformationAccount(String username) throws SQLException; 
}
