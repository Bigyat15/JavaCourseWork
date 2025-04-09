package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.loginModelDAO;
import models.loginModel;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private loginModelDAO dao;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new loginModelDAO();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("pages/login.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(email==null||email.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() + "/pages/login.jsp?error=email");
			return;
		}
		if(password==null||password.trim().isEmpty()) {
			response.sendRedirect(request.getContextPath() +"/pages/login.jsp?error=password");
			return;
		}
		
		loginModel login = new loginModel(email,password);
		try {
			boolean success = dao.loginAttempt(login);
			if(success) {
				response.sendRedirect(request.getContextPath() +"/pages/main.jsp");
				return;
			}else {
				response.sendRedirect(request.getContextPath() +"/pages/login.jsp?error=failed");
				return;
			}
		}catch(SQLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath() +"/pages/login.jsp?status=DatabaseError");
			return;
		}
	}

}
