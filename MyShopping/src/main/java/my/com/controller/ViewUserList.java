package my.com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import my.com.dao.UserDAO;
import my.com.dao.impl.UserDAOImpl;
import my.com.model.User;

/**
 * Servlet implementation class ViewUserList
 */
@WebServlet("/viewUserList")
public class ViewUserList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ViewUserList() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int total = 0;
		UserDAO userDAO = new UserDAOImpl();
		List<User> lst = new ArrayList<User>();
		try {
			if (request.getParameter("page") == null) {
				lst = userDAO.getAllUser(0);
				total = userDAO.countTotalUser() / 3;
				if (userDAO.countTotalUser() % 3 != 0) {
					total = total + 1;
				}
				request.setAttribute("check", 0);
				request.setAttribute("lst", lst);
				request.setAttribute("total", total);
				request.setAttribute("tag", 1);
				request.getRequestDispatcher("/view/viewUserA.jsp").forward(request, response);
			} else {
				int page = Integer.parseInt(request.getParameter("page"));
				lst = userDAO.getAllUser((page - 1) * 3);
				total = userDAO.countTotalUser() / 3;
				if (userDAO.countTotalUser() % 3 != 0) {
					total += 1;
				}
				request.setAttribute("check", 0);
				request.setAttribute("lst", lst);
				request.setAttribute("total", total);
				request.setAttribute("tag", page);
				request.getRequestDispatcher("/view/viewUserA.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			request.setAttribute("error", "Error!");
			request.getRequestDispatcher("/view/error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
