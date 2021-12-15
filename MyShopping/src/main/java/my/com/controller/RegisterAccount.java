package my.com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.com.dao.UserDAO;
import my.com.dao.impl.UserDAOImpl;
import my.com.model.User;
import my.com.utils.Validation;

/**
 * Servlet implementation class RegisterAccount
 */
@WebServlet("/registerAccount")
public class RegisterAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterAccount() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAOImpl();
		String username = request.getParameter("username");
		try {
			if (userDAO.isUsernameExist(username)) {
				request.setAttribute("err", "Username existed!");
				request.setAttribute("uname", username);
				request.getRequestDispatcher("/view/register.jsp").forward(request, response);
			} else {
				String password = request.getParameter("password");
				String salt_p = Validation.randomString();
				String hash_p = Validation.encyptPassword(password, salt_p);
				User user = new User(username, salt_p, hash_p, 0);
				if (userDAO.insertUser(user)) {
					response.sendRedirect(request.getContextPath() + "/view/login.jsp");
				} else {
					request.setAttribute("error", "Register failed!");
					request.getRequestDispatcher("/view/error.jsp").forward(request, response);
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}

}
