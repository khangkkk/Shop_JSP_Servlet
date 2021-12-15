package my.com.dao;

import java.sql.SQLException;
import java.util.List;

import my.com.model.Category;

public interface CategoryDAO {

	// get list contains all categories
	public List<Category> getAllCat() throws SQLException;
}
