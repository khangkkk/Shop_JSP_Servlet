package my.com.dao;

import java.sql.SQLException;
import java.util.List;

import my.com.model.Product;

public interface ProductDAO {
	// get list contains all products
	public List<Product> getAllProductOrByCategory(String want, int idCat) throws SQLException;

	// get information of product by id
	public Product getProductInformation(int id) throws SQLException;

	// insert a product
	public boolean insertProduct(Product product) throws SQLException;

	// update a product
	public boolean updateProduct(Product product) throws SQLException;

	// delete a product
	public boolean deleteProduct(int idProduct) throws SQLException;

	//
	public List<Product> searchProduct(String nameProduct, String nameCategory) throws SQLException;

	//
	public List<Product> getListByPage(List<Product> lst, int start, int end) throws SQLException;

}
