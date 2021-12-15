package my.com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.com.dao.UserDAO;
import my.com.dao.impl.UserDAOImpl;
import my.com.model.User;
import my.com.utils.Validation;

/**
 * Servlet implementation class EditAccount
 */
@WebServlet("/editAccount")
public class EditAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditAccount() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserDAO userDAO = new UserDAOImpl();
		String un = request.getParameter("username");

		try {
			User u = userDAO.getDetailInformationAccount(un);
			request.setAttribute("u", u);
			request.getRequestDispatcher("/view/updateAccount.jsp").forward(request, response);
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
		UserDAO userDAO=new UserDAOImpl();
		String id=request.getParameter("id");
		String username=request.getParameter("username");
		String fullname=request.getParameter("fullname");
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		String email=request.getParameter("email");
		String phone=request.getParameter("phone");
		String address=request.getParameter("address");
		int idU=Validation.convert(id);
		User u=new User(idU, username, fullname, dob, gender, email, phone, address);
		try {
			if(userDAO.updateUser(u)) {
				request.setAttribute("mess", "Update information successfully!");
				request.setAttribute("u", u);
				request.getRequestDispatcher("/view/updateAccount.jsp").forward(request, response);
			}else {
				request.setAttribute("mess", "Update information failed!");
				request.getRequestDispatcher("/view/updateAccount.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
