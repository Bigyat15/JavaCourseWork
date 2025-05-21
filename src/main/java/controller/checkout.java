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
import DAO.cartModelDAO;
import models.cartModel;

@WebServlet("/checkout")
public class checkout extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private cartModelDAO dao;

    public void init() {
        dao = new cartModelDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        
        // Check if user is logged in
        if(session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
            return;
        }
        
        int userId = (int) session.getAttribute("user_id");
        
        try {
            // Get cart items
            ArrayList<cartModel> cartItems = dao.getCartItem(userId);
            
            // Calculate total
            double total = cartItems.stream().mapToDouble(cartModel::getTotalPrice).sum();
            
            // Set attributes for JSP
            request.setAttribute("cartItems", cartItems);
            request.setAttribute("total", total);
            request.setAttribute("userId", userId);
            
            // Forward to checkout page
            request.getRequestDispatcher("/pages/checkout.jsp").forward(request, response);
            
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error processing your checkout");
            request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle payment processing here
        // This would be where you integrate with payment gateways
    }
}