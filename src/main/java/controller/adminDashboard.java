package controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


import DAO.loginModelDAO;
import DAO.registerDAO;
import models.loginModel;
import models.registerModel;

/**
 * Servlet implementation class adminDashboard
 */

@WebServlet("/adminDashboard")
@MultipartConfig
public class adminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private loginModelDAO dao;
    private registerDAO dao2;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new loginModelDAO();
    	dao2 = new registerDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<loginModel> loginList;
		try {
			loginList = dao.getAllUserInfo();
			request.setAttribute("loginList",loginList);	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect("/CollegeTutorial/pages/somethingWentWrong.jsp");
			return;
		}
		request.getRequestDispatcher("/pages/adminDashboard.jsp").forward(request, response);
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//For users to be added functionality
		String action = request.getParameter("action");
		System.out.println("Received action: " + action);		
		String userIdParam = request.getParameter("user_id");
		if("deleteUser".equals(action) && userIdParam != null) {
			try {
				int userId = Integer.parseInt(userIdParam);
				boolean deleted = dao2.deleteUser(userId);
				if(deleted) {
					response.sendRedirect(request.getContextPath()+"/adminDashboard?message=userDeleted");

				}else {
					response.sendRedirect(request.getContextPath()+"/adminDashboard?error=deleteFailed");
				}
				return;
			}catch(NumberFormatException | SQLException e) {
				e.printStackTrace();
			}
		}
		if("editUser".equals(action) && userIdParam != null) {
			try {
				int userId = Integer.parseInt(userIdParam);
				String firstName = request.getParameter("first_name");
				String lastName = request.getParameter("last_name");
				String dob = request.getParameter("dob");
				String email = request.getParameter("email");
				String phoneNumber = request.getParameter("phone_number");
				if (dao2.emailExist(email) && !dao2.isSameUserEmail(userId, email)) {
				    response.sendRedirect(request.getContextPath() + "/adminDashboard?error=emailExists");
				    return;
				}

				boolean edited = dao2.updateUser(userId, firstName, lastName, dob, email, phoneNumber);
				if(edited) {
					response.sendRedirect(request.getContextPath() + "/adminDashboard?message=userUpdated");
				}else {
					response.sendRedirect(request.getContextPath() + "/adminDashboard?error=updateFailed");
				}
				return;
			}catch (NumberFormatException | SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=updateFailed");
	        }
		}
	
		String first_name = request.getParameter("first_name");
	    String last_name = request.getParameter("last_name");
	    String DOB = request.getParameter("dob");
	    String email = request.getParameter("email");
	    String phoneNumber = request.getParameter("phone_number");
	    String password = request.getParameter("password");
	    String confirmPassword = request.getParameter("confirm_password");
	    
	    //For products to be addded
	    

	    if (first_name == null || first_name.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=firstName");
	        return;
	    }
	    if (last_name == null || last_name.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=lastName");
	        return;
	    }
	    if (DOB == null || DOB.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=dob");
	        return;
	    }
	    if (email == null || email.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=email");
	        return;
	    }
	    if (phoneNumber == null || phoneNumber.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=phoneNumber");
	        return;
	    }
	    if (password == null || password.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=password");
	        return;
	    }
	    if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
	        response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=confirmPassword");
	        return;
	    }

	    if (!password.equals(confirmPassword)) {
	        response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=passwordMismatch");
	        return;
	    }
	    
	    registerModel register = new registerModel(first_name, last_name, DOB, email, phoneNumber,false,LocalDateTime.now(),LocalDateTime.now(), password);

	    try {
	    	if(dao2.emailExist(email)) {
	    		response.sendRedirect(request.getContextPath()+"/adminDashboard?error=emailExists");
	    		return;
	    	}
	        boolean success = dao2.addUser(register);
	        if (success) {
	            response.sendRedirect(request.getContextPath()+"/adminDashboard");
	        } else {
	            response.sendRedirect(request.getContextPath()+"/adminDashboard?error=registrationFailed");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	        response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=databaseError");
	    } 
	    
	}
	
}
