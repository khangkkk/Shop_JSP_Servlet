package my.com.dao.impl;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import my.com.dao.ProductDAO;
import my.com.model.Product;
import my.com.utils.DBConnection;

public class ProductDAOImpl implements ProductDAO {
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public List<Product> getAllProductOrByCategory(String want, int idCat) throws SQLException {
		String sql = null;
		if (want.equals("all") && idCat == -1) {
			sql = "SELECT * \r\n" + "FROM Product";
		} else if (want.equals("allByCat")) {
			sql = "SELECT * \r\n" + "FROM Product\r\n" + "WHERE id_cat = ?";
		}
		List<Product> lstPro = new ArrayList<Product>();
		Product pro = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			if (want.equals("allByCat")) {
				ps.setInt(1, idCat);
			}
			rs = ps.executeQuery();
			while (rs.next()) {
				pro = new Product(rs.getInt("id_pro"), rs.getInt("id_cat"), rs.getString("name_pro"),
						rs.getString("images"), rs.getInt("quantity"), rs.getDouble("price"), rs.getString("supplier"),
						rs.getString("infor"));
				lstPro.add(pro);
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
		return lstPro;
	}

	@Override
	public Product getProductInformation(int id) throws SQLException {
		String sql = "SELECT * FROM Product WHERE id_pro = '" + id + "'";
		Product p = null;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				p = new Product(rs.getInt("id_pro"), rs.getInt("id_cat"), rs.getString("name_pro"),
						rs.getString("images"), rs.getInt("quantity"), rs.getDouble("price"), rs.getString("supplier"),
						rs.getString("infor"));
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}

	@Override
	public boolean insertProduct(Product product) throws SQLException {
		String sql = "INSERT INTO Product VALUES (?, ?, ?, ?, ?, ?, ?)";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, product.getId_cat());
			ps.setString(2, product.getName_pro());
			ps.setString(3, product.getImages());
			ps.setInt(4, product.getQuantity());
			ps.setDouble(5, product.getPrice());
			ps.setString(6, product.getSupplier());
			ps.setString(7, product.getInfor());
			row = ps.executeUpdate();
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

		return row > 0;
	}

	@Override
	public boolean updateProduct(Product product) throws SQLException {
		String sql = "UPDATE Product \r\n"
				+ "SET id_cat = ?, name_pro = ?, images = ?, quantity = ?, price = ?, supplier = ?, infor = ? \r\n"
				+ "WHERE id_pro = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, product.getId_cat());
			ps.setString(2, product.getName_pro());
			ps.setString(3, product.getImages());
			ps.setInt(4, product.getQuantity());
			ps.setDouble(5, product.getPrice());
			ps.setString(6, product.getSupplier());
			ps.setString(7, product.getInfor());
			ps.setInt(8, product.getId_pro());
			row = ps.executeUpdate();
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

		return row > 0;
	}

	@Override
	public boolean deleteProduct(int idProduct) throws SQLException {
		String sql = "DELETE FROM Product WHERE id_pro = ?";
		int row = 0;
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, idProduct);
			row = ps.executeUpdate();
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
		return row > 0;
	}

	@Override
	public List<Product> searchProduct(String nameProduct, String nameCategory) throws SQLException {
		String sql = null;
		if (!nameProduct.equals("") && !nameCategory.equals("")) {
			sql = "SELECT * FROM Product, Category\n" + "WHERE name_pro LIKE '%" + nameProduct
					+ "%' AND Product.id_cat=Category.id_cat AND name_cat LIKE '%" + nameCategory + "%'";
		} else {
			if (nameProduct.equals("")) {
				sql = "SELECT * FROM Product, Category\n" + "WHERE Product.id_cat=Category.id_cat AND name_cat LIKE '%"
						+ nameCategory + "%'";
			} else {
				sql = "SELECT * FROM Product, Category\n" + "WHERE name_pro LIKE '%" + nameProduct
						+ "%' AND Product.id_cat=Category.id_cat";
			}
		}
		Product p = null;
		List<Product> lst = new ArrayList<>();
		try {
			con = DBConnection.getInstance().getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				p = new Product(rs.getInt("id_pro"), rs.getInt("id_cat"), rs.getString("name_pro"),
						rs.getString("images"), rs.getInt("quantity"), rs.getDouble("price"), rs.getString("supplier"),
						rs.getString("infor"));
				lst.add(p);
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
		return lst;
	}

	@Override
	public List<Product> getListByPage(List<Product> lst, int start, int end) throws SQLException {
		List<Product> arr = new ArrayList<>();
		for (int i = start; i < end; i++) {
			arr.add(lst.get(i));
		}
		return arr;
	}
}
