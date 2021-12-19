package my.com.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import my.com.dao.UserDAO;
import my.com.dao.impl.UserDAOImpl;
import my.com.model.User;
import my.com.utils.Validation;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/view/login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO userDAO = new UserDAOImpl();
		User user = null;
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String remember = request.getParameter("remember");
		try {
			String salt_p = userDAO.getSaltPassword(username);
			String hash_p = Validation.encyptPassword(password, salt_p);
			user = new User(username, salt_p, hash_p, 0);
			if (userDAO.isAccountExist(user) != null) {
				// HttpSession session = request.getSession();

				Cookie loginCooki = new Cookie("username", username);
				Cookie p = new Cookie("password", password);
				// set time limit of cookie 30 minutes
				loginCooki.setMaxAge(30 * 60);
				if (remember != null) {
					p.setMaxAge(60);
				} else {
					p.setMaxAge(0);
				}
				response.addCookie(loginCooki);
				response.addCookie(p);
				if (user.getUsername().equals("admin")) {
					request.getRequestDispatcher("/view/homeA.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("/view/home.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("err", "Username or password incorrect!");
				request.getRequestDispatcher("/view/login.jsp").forward(request, response);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
