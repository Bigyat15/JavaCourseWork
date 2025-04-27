package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.loginModelDAO;
import models.loginModel;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private loginModelDAO dao;

    public login() {
        super();
    }

    public void init() {
        dao = new loginModelDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If user is already logged in, redirect them to the appropriate page
//        HttpSession session = request.getSession(false);
//        
//        if (session != null) {
//            Integer userId = (Integer) session.getAttribute("user_id");
//            if (userId != null) {
//                System.out.println("User is logged in: " + userId);
//            } else {
//                System.out.println("No user_id in session");
//            }
//        } else {
//            System.out.println("Session is null");
//        }
    	
    	
        request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userIdParam = request.getParameter("user_id");
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String password = request.getParameter("password");

        // Check if user_id is not null and can be parsed to an integer
        Integer userID = null;
        if (userIdParam != null && !userIdParam.trim().isEmpty()) {
            try {
                userID = Integer.parseInt(userIdParam);
            } catch (NumberFormatException e) {
                response.sendRedirect(request.getContextPath() + "/pages/login.jsp?error=invalidUserId");
                return;
            }
        }

        // Check if email or password is null or empty
        if (email == null || email.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp?error=email");
            return;
        }
        if (password == null || password.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp?error=password");
            return;
        }
        

        try {
            loginModel login = new loginModel(userID,first_name,last_name,dob, email,phoneNumber, password, false,null,null);
            loginModel result = dao.loginAttempt(login);
            if (result != null) {
                HttpSession session = request.getSession();
                session.setAttribute("user_id", result.getUser_id());
                session.setAttribute("email", login.getEmail());
                session.setAttribute("is_admin", login.isIs_admin());
                System.out.println("User logged in successfully. Session user_id: " + session.getAttribute("user_id"));
                System.out.println("Session email: " + session.getAttribute("email"));
                System.out.println("Session is_admin: " + session.getAttribute("is_admin"));
                // Check if there's a redirect URL stored in the session
                String redirectAfterLogin = (String) session.getAttribute("redirectAfterLogin");
                if (redirectAfterLogin != null && !redirectAfterLogin.isEmpty()) {
                    // Redirect the user back to the original page
                    session.removeAttribute("redirectAfterLogin");  // Remove the redirect URL from session
                    response.sendRedirect(redirectAfterLogin);
                } else {
//                     If there's no referring page stored, send the user to the default page
                    if (result.isIs_admin()) {
                        response.sendRedirect(request.getContextPath() + "/adminDashboard");
                    } else {
                    	// New redirect to car servlet
                    	response.sendRedirect(request.getContextPath() + "/car");

                    }
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/login.jsp?error=failed");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp?status=DatabaseError");
        }
    }

}
