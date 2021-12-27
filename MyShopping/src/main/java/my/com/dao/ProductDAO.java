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
	public boolean deleteProduct(String idProduct) throws SQLException;

	//search product by name of product or name of category
	public List<Product> searchProduct(String nameProduct, String nameCategory) throws SQLException;

	//get list of products by paging
	public List<Product> getListByPage(List<Product> lst, int start, int end) throws SQLException;

	//get list of products by paging( use offset fetch sql)
	public List<Product> getAllProduct(int row) throws SQLException;
	
	//count all product
	public int countTotalProduct() throws SQLException;
}
