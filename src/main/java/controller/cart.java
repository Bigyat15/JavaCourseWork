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

@WebServlet("/cart")
public class cart extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private cartModelDAO dao;

    public cart() {
        super();
    }

    public void init() {
        dao = new cartModelDAO();
    }

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if(session == null) {
            System.out.println("Session is null in cart servlet.");
        } else {
            System.out.println("Session exists in cart servlet. User ID: " + session.getAttribute("user_id"));
        }
     
        if(session == null || session.getAttribute("user_id") == null) {
            System.out.println("Session is null or user_id is missing.");
            String referer = request.getHeader("Referer");
            session = request.getSession(true);
            session.setAttribute("redirectAfterLogin", referer);
            response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
            return;
        }
        
        int userID = (int) session.getAttribute("user_id");
        try {
            System.out.println("User ID: " + userID);
            ArrayList<cartModel> cartList = dao.getCartItem(userID);
            request.setAttribute("cartList",cartList);
            System.out.println("Cart List:" + cartList);
            request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);
        } catch (SQLException e) {
            System.err.println("SQLException: " + e.getMessage());
            e.printStackTrace();
        }
    }

   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
       
        if(session == null || session.getAttribute("user_id") == null) {
            System.out.println("Session is null or user_id is missing in doPost.");
            String referer = request.getHeader("Referer");
            session = request.getSession(true);
            session.setAttribute("redirectAfterLogin", referer != null ? referer : request.getContextPath() + "/cart");
            response.sendRedirect(request.getContextPath()+"/pages/login.jsp");
            return;
        }

        int userID = (int) session.getAttribute("user_id");
        
       
        System.out.println("User ID in doPost: " + userID);
        
        if (userID <= 0) {
            request.setAttribute("Error message", "Invalid user session. Please login again.");
            request.getRequestDispatcher("/pages/login.jsp").forward(request, response);
            return;
        }
        
        try {
      
            String carIdParam = request.getParameter("car_id");
            System.out.println("Car ID parameter: " + carIdParam);
            
            if (carIdParam == null || carIdParam.trim().isEmpty()) {
                throw new IllegalArgumentException("Car ID is required.");
            }

            int carID = Integer.parseInt(carIdParam);
            String quantity = request.getParameter("quantity");
            System.out.println("Quantity parameter: " + quantity);
            if(quantity == null || quantity.trim().isEmpty()) {
                quantity = "1";
            }
            int quantityValue;
            try {
            	quantityValue = Integer.parseInt(quantity);
            }catch(NumberFormatException e) {
            	quantityValue = 1;
            }
            

            String carName = request.getParameter("car_name");
            String carDescription = request.getParameter("car_description");
            String carPriceParam = request.getParameter("car_price");
            String totalPriceParam = request.getParameter("total");
            if (totalPriceParam != null) {
                totalPriceParam = totalPriceParam.trim();
                double totalPrice = Double.parseDouble(totalPriceParam);
            } else {
                System.out.println("totalPrice parameter is missing!");
            }
            System.out.println("Car price parameter: "+carPriceParam);
            if(carPriceParam == null || carPriceParam.trim().isEmpty()) {
            	throw new IllegalArgumentException("Car price is required");
            }
            double carPrice = Double.parseDouble(carPriceParam.trim());
            double totalPrice = Double.parseDouble(totalPriceParam.trim());
            String storePath = request.getParameter("store_image");
            String action = request.getParameter("action");
            
      
            System.out.println("Adding car to cart: " + carName + ", Price: " + carPrice);
            
            int cartID = dao.createNewCartForUser(userID);
            if("add".equals(action)) {
            	dao.incrementItemQuantity(cartID, carID);
            	double totalPricee = carPrice * quantityValue;
            	dao.updateCartTotalPrice(cartID, totalPricee);
            	
            }else if("subtract".equals(action)){
            	dao.decreaseItemQuantity(cartID, carID);
            	double totalPricee = carPrice * (quantityValue - 1);
            	dao.updateCartTotalPrice(cartID, totalPricee);
            }else if("delete".equals(action)){
            	dao.deleteCartItem(cartID, carID);
            }
            else {
            	cartModel item = new cartModel(userID, cartID, carID, quantity,totalPrice, carName, carDescription, carPrice, storePath);
            	dao.addToCart(item);
            	
//            	double totalPricee = carPrice * quantityValue;
//            	dao.updateCartTotalPrice(cartID, totalPricee);
            	
            }
            if(quantityValue <= 0) {
            	dao.deleteCartItem(cartID, carID);
            	System.out.println("Item deleted from cart because quantity was <= 0");
            }else {
            	
                System.out.println("Error");
            }
            ArrayList<cartModel> cartList = dao.getCartItem(userID);
            request.setAttribute("cartList", cartList);
            request.getRequestDispatcher("/pages/cart.jsp").forward(request, response);
        } catch (SQLException e) {
            System.err.println("SQLException during adding to cart: " + e.getMessage());
            e.printStackTrace();
        } catch (NumberFormatException e) {
            System.err.println("NumberFormatException: " + e.getMessage());
            e.printStackTrace();
        } catch (IllegalArgumentException e) {
            System.err.println("IllegalArgumentException: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
