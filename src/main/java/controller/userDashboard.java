package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.registerDAO;
import models.loginModel;

@WebServlet("/userDashboard")
public class userDashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private registerDAO dao;
    
    public void init() {
        dao = new registerDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if session exists and has user_id attribute
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            // Get user ID from session
            int userId = (int) session.getAttribute("user_id");
            
            // Fetch complete user data from database
            loginModel currentUser = dao.getUserById(userId);
            
            if (currentUser == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }
            
            // Store user in session for future use
            session.setAttribute("currentUser", currentUser);
            
            // Forward to JSP with user data
            request.setAttribute("user", currentUser);
            request.getRequestDispatcher("/pages/userDashboard.jsp").forward(request, response);

            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            int userId = (int) session.getAttribute("user_id");
            String action = request.getParameter("action");
            
            if ("updateProfile".equals(action)) {
                // Get updated fields
            	String firstName = request.getParameter("first_name");
            	String lastName = request.getParameter("last_name");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phone_number");
                
                // Update user in database
                boolean success = dao.updateUserProfile(userId,firstName,lastName, email, phoneNumber);
                
                if (success) {
                    // Refresh user data in session
                    loginModel updatedUser = dao.getUserById(userId);
                    session.setAttribute("currentUser", updatedUser);
                    response.sendRedirect(request.getContextPath() + "/userDashboard?success=Profile+updated");
                } else {
                    response.sendRedirect(request.getContextPath() + "/userDashboard?error=Update+failed");
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/userDashboard");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/userDashboard?error=Server+error");
        }
    }
}