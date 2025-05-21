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

import DAO.productModelDAO;
import models.productModel;

/**
 * Servlet implementation class adminDashboard
 */

@WebServlet("/adminDashboard")
@MultipartConfig
public class adminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private productModelDAO dao1;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao1 = new productModelDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<productModel> productList;
		productList = dao1.getAllProductDetail();
		request.setAttribute("productList", productList);
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
		

		if ("addProduct".equals(action)) {
		    try {
		        // Get form parameters
		        String carName = request.getParameter("car_name");
		        String carDesc = request.getParameter("car_description");
		        String categoryName = request.getParameter("category_name");
		        
		        int carQuantity = Integer.parseInt(request.getParameter("car_quantity"));
		        double carPrice = Double.parseDouble(request.getParameter("car_price"));
		        String carBrand = request.getParameter("car_brand");
		        int carYear = Integer.parseInt(request.getParameter("car_year"));
		        Integer carModel = Integer.parseInt(request.getParameter("car_model"));

		        // Handle image upload
		        Part imagePart = request.getPart("store_images");
		        String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
		        String relativeImagePath = "images/" + fileName;
		        String absoluteImagePath = getServletContext().getRealPath("/") + relativeImagePath;

		        // Create the upload directory if it doesn't exist
		        File uploadDir = new File(getServletContext().getRealPath("/images/"));
		        if (!uploadDir.exists()) {
		            uploadDir.mkdirs();
		        }

		        // Write the image to the directory
		        imagePart.write(absoluteImagePath);

		        // Fetching the category ID from the database based on category name
		        int categoryID = Integer.parseInt(request.getParameter("category_id"));

		        // Example values for engine_type, performance, and transmission
		        String engineType = request.getParameter("engine_type");
		        String performance = request.getParameter("performance");
		        String transmission = request.getParameter("transmission");

		        // Saving the product to the database using the DAO method
		        dao1.addProduct(carName, carDesc, carQuantity, carPrice, carBrand, carYear, carModel, categoryID, categoryName, relativeImagePath, engineType, performance, transmission);

		        // Redirect to admin dashboard with a success message
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?success=product_added");

		    } catch (Exception e) {
		        e.printStackTrace();
		        // Redirect to admin dashboard with an error message
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=server_error");
		    }
		    return;
		}
		if ("editProduct".equals(action)) {
		    try {
		        // Get form parameters
		    	int carID =  Integer.parseInt(request.getParameter("car_id"));
		        String carName = request.getParameter("car_name");
		        String carDesc = request.getParameter("car_description");
		        int carQuantity = Integer.parseInt(request.getParameter("car_quantity"));
		        double carPrice = Double.parseDouble(request.getParameter("car_price"));
		        String carBrand = request.getParameter("car_brand");
		        int carYear = Integer.parseInt(request.getParameter("car_year"));
		        int carModel = Integer.parseInt(request.getParameter("car_model"));

		        // Handle optional image upload
		        Part imagePart = request.getPart("store_images");
		        String relativeImagePath = null;
		        if (imagePart != null && imagePart.getSize() > 0) {
		            String fileName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
		            relativeImagePath = "images/" + fileName;
		            String absoluteImagePath = getServletContext().getRealPath("/") + relativeImagePath;

		            File uploadDir = new File(getServletContext().getRealPath("/images/"));
		            if (!uploadDir.exists()) {
		                uploadDir.mkdirs();
		            }
		            imagePart.write(absoluteImagePath);
		        }
		        int categoryID = Integer.parseInt(request.getParameter("category_id"));
		        String engineType = request.getParameter("engine_type");
		        String performance = request.getParameter("performance");
		        String transmission = request.getParameter("transmission");

		        // If no new image uploaded, fetch existing one from DB or set default
		        if (relativeImagePath == null) {
		        	String existingImagePath = dao1.getImagePathByCarId(carID); // You can use ID if available
		            relativeImagePath = existingImagePath != null ? existingImagePath : "images/default.png";
		        }

		        // Update the product in the database
		        dao1.updateProduct(carID,carName, carDesc, carQuantity, carPrice, carBrand,
		                carYear, carModel, categoryID, relativeImagePath, engineType, performance, transmission);

		        response.sendRedirect(request.getContextPath() + "/adminDashboard?success=product_updated");
		    } catch (Exception e) {
		        e.printStackTrace();
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=update_failed");
		    }
		    return;
		}
		if ("deleteProduct".equals(action)) {
		    try {
		        String carName = request.getParameter("car_name");

		        boolean deleted = dao1.deleteProduct(carName);

		        if (deleted) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?success=product_deleted");
		        } else {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=not_found");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        response.sendRedirect(request.getContextPath() + "/pages/adminDashboard?error=delete_failed");
		    }
		    return;
		}
	    
	    
	    
	}
	
	
	

	

}
