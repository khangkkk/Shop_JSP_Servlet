package my.com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.com.dao.CategoryDAO;
import my.com.dao.ProductDAO;
import my.com.dao.impl.CategoryDAOImpl;
import my.com.dao.impl.ProductDAOImpl;
import my.com.model.Category;
import my.com.model.Product;
import my.com.utils.Validation;

/**
 * Servlet implementation class EditProduct
 */
@WebServlet("/editProduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		CategoryDAO categoryDAO = new CategoryDAOImpl();
		ProductDAO productDAO = new ProductDAOImpl();
		List<Category> lst = new ArrayList<Category>();
		String id = request.getParameter("id");
		int idProduct = Validation.convert(id);
		Product product = null;
		try {
			product = productDAO.getProductInformation(idProduct);
			lst = categoryDAO.getAllCat();
			request.setAttribute("product", product);
			request.setAttribute("lstCat", lst);
			request.getRequestDispatcher("/view/updateProductA.jsp").forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO productDAO = new ProductDAOImpl();
		CategoryDAO categoryDAO = new CategoryDAOImpl();
		List<Category> lst = new ArrayList<Category>();
		String id=request.getParameter("");
		int idProduct=Validation.convert(id);
		String cat = request.getParameter("categoryP");
		int category = Validation.convert(cat);
		String nameProduct = request.getParameter("nameP");
		String image = request.getParameter("imageP");
		String quantityP = request.getParameter("quantityP");
		int quantity = Validation.convert(quantityP);
		String priceP = request.getParameter("priceP");
		double price = Validation.convert(priceP);
		String manufacturer = request.getParameter("manufacturerP");
		String infor = request.getParameter("inforP");

		Product product = new Product(idProduct, category, nameProduct, image, quantity, price, manufacturer, infor);
		try {
			if (productDAO.updateProduct(product)) {
				lst = categoryDAO.getAllCat();
				request.setAttribute("mess", "Update product successfully!");
				request.setAttribute("lstCat", lst);
				request.setAttribute("product", product);
				request.getRequestDispatcher("/view/updateProductA.jsp").forward(request, response);
			}else {
				lst = categoryDAO.getAllCat();
				request.setAttribute("mess", "Update product failed!");
				request.setAttribute("lstCat", lst);
				request.setAttribute("product", product);
				request.getRequestDispatcher("/view/updateProductA.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
