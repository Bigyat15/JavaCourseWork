package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.loginModelDAO;
import DAO.registerDAO;
import models.loginModel;
import models.registerModel;

/**
 * Servlet implementation class register
 */
@WebServlet("/register")
public class register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private registerDAO dao;
	private loginModelDAO dao1;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public register() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new registerDAO();
    	dao1 = new loginModelDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ArrayList<loginModel> userList;
		try {
			userList = dao1.getAllUserInfo();
			request.setAttribute("userList", userList);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("pages/register.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String first_name = request.getParameter("first_name");
	    String last_name = request.getParameter("last_name");
	    String DOB = request.getParameter("dob");
	    String email = request.getParameter("email");
	    String phoneNumber = request.getParameter("phone_number");
	    String password = request.getParameter("password");
	    String confirmPassword = request.getParameter("confirm_password");


	    if (first_name == null || first_name.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=firstName");
	        return;
	    }
	    if (last_name == null || last_name.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=lastName");
	        return;
	    }
	    if (DOB == null || DOB.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=dob");
	        return;
	    }
	    if (email == null || email.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=email");
	        return;
	    }
	    if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=phoneNumber");
	        return;
	    }
	    if (password == null || password.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=password");
	        return;
	    }
	    if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=confirmPassword");
	        return;
	    }

	    if (!password.equals(confirmPassword)) {
	        response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=passwordMismatch");
	        return;
	    }

	    
	    registerModel register = new registerModel(first_name, last_name, DOB, email, phoneNumber,false,LocalDateTime.now(),LocalDateTime.now(), password);

	    try {
	    	if(dao.emailExist(email)) {
	    		response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=emailExists");
	    		return;
	    	}
	        boolean success = dao.addRegistrationDetail(register);
	        if (success) {
	            response.sendRedirect(request.getContextPath()+"/login");
	        } else {
	            response.sendRedirect(request.getContextPath()+"/pages/register.jsp?error=registrationFailed");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendRedirect("/CollegeTutorial/pages/register.jsp?error=databaseError");
	    }
	}
	


}
