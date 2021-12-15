package my.com.dao.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import my.com.dao.CategoryDAO;
import my.com.model.Category;
import my.com.utils.DBConnection;

public class CategoryDAOImpl implements CategoryDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public List<Category> getAllCat() throws SQLException {
		String sql = "SELECT * \r\n" + "FROM Category";
		List<Category> lstCat = new ArrayList<Category>();
		Category category = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				category = new Category();
				category.setId_cat(rs.getInt("id_cat"));
				category.setName_cat(rs.getString("name_cat"));
				category.setDescribe(rs.getString("describe"));
				lstCat.add(category);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}
		return lstCat;
	}

}
