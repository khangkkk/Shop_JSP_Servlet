package my.com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.com.dao.ProductDAO;
import my.com.dao.impl.ProductDAOImpl;
import my.com.model.Product;

/**
 * Servlet implementation class ViewProductList
 */
@WebServlet("/viewProductList")
public class ViewProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewProductList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int total = 0;
		ProductDAO productDAO = new ProductDAOImpl();
		List<Product> lst = new ArrayList<Product>();
		try {
			if (request.getParameter("page") == null) {
				lst = productDAO.getAllProduct(0);
				total = productDAO.countTotalProduct() / 3;
				if (productDAO.countTotalProduct() % 3 != 0) {
					total = total + 1;
				}
				request.setAttribute("check", 0);
				request.setAttribute("lstP", lst);
				request.setAttribute("total", total);
				request.setAttribute("tag", 1);
				request.getRequestDispatcher("/view/productListA.jsp").forward(request, response);
			} else {
				int page = Integer.parseInt(request.getParameter("page"));
				lst = productDAO.getAllProduct((page - 1) * 3);
				total = productDAO.countTotalProduct() / 3;
				if (productDAO.countTotalProduct() % 3 != 0) {
					total += 1;
				}
				request.setAttribute("check", 0);
				request.setAttribute("lstP", lst);
				request.setAttribute("total", total);
				request.setAttribute("tag", page);
				request.getRequestDispatcher("/view/productListA.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("error", "Error!");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
