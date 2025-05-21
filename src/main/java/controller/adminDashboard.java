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


import DAO.categoryDAO;




import models.categoryModel;
import models.loginModel;
import models.registerModel;

/**
 * Servlet implementation class adminDashboard
 */

@WebServlet("/adminDashboard")
@MultipartConfig
public class adminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private categoryDAO dao5;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao5 = new categoryDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<loginModel> loginList;

		ArrayList<categoryModel> categoryList;
		categoryList = dao5.getAllCategory();
		request.setAttribute("categoryList", categoryList);
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
		
		
		if ("addCategory".equals(action)) {
		    try {
		        // Get form parameters
		        String categoryName = request.getParameter("category_name");
		        String categoryDescription = request.getParameter("category_description");
		        
		        // Validate required parameters
		        if (categoryName == null || categoryName.trim().isEmpty()) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=missing_name");
		            return;
		        }
		        
		        // Handle file upload
		        Part filePart = request.getPart("category_image");
		        if (filePart == null || filePart.getSize() == 0) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=missing_image");
		            return;
		        }
		        
		        // Process the uploaded file
		        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		        
		        // Define paths
		        String relativeImagePath = "images/" + fileName;  // Relative to webapp
		        String absoluteImagePath = getServletContext().getRealPath("/") + relativeImagePath;
		        
		        System.out.println("Relative Image Path: " + relativeImagePath);
		        System.out.println("Absolute Image Path: " + absoluteImagePath);
		        
		        // Create directory if it doesn't exist
		        File uploadDir = new File(getServletContext().getRealPath("/images/"));
		        if (!uploadDir.exists()) {
		            uploadDir.mkdirs();
		        }
		        
		        // Save the file
		        filePart.write(absoluteImagePath);
		        
		        // Add category to database with relative path
		        boolean isAdded = dao5.addCategory(categoryName.trim(), relativeImagePath, categoryDescription.trim());
		        
		        if (isAdded) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?success=category_added");
		        } else {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=add_failed");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=sql_error");
		    } catch (IOException e) {
		        e.printStackTrace();
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=file_upload");
		    }
		    return;
		}
		if ("editCategory".equals(action)) {
		    try {
		        // Get parameters
		        String categoryName = request.getParameter("category_name");
		        String newDescription = request.getParameter("category_description");
		        int categoryId = Integer.parseInt(request.getParameter("category_id"));
		        
		        // Validate input
		        if (categoryName == null || categoryName.trim().isEmpty()) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=missing_parameters");
		            return;
		        }

		        // Get existing category details from DB by name
		        ArrayList<categoryModel> categories = dao5.getCategoryById(categoryId); 
		        if (categories.isEmpty()) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=category_not_found");
		            return;
		        }

		        categoryModel category = categories.get(0); 
		        
		        String currentImagePath = category.getCategory_image_path();

		        // Handle optional image upload
		        Part filePart = request.getPart("category_image");
		        String imagePath = currentImagePath; // default to existing

		        if (filePart != null && filePart.getSize() > 0) {
		            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		            String relativePath = "images/" + fileName;
		            String absolutePath = getServletContext().getRealPath("/") + relativePath;

		            File uploadDir = new File(getServletContext().getRealPath("/images/"));
		            if (!uploadDir.exists()) {
		                uploadDir.mkdirs();
		            }

		            filePart.write(absolutePath);
		            imagePath = relativePath; // Use new image path
		        }

		        // Update category
		        boolean isEdited = dao5.updateCategory(categoryId, categoryName.trim(), imagePath, newDescription.trim());

		        if (isEdited) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?success=category_updated");
		        } else {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=update_failed");
		        }

		    } catch (Exception e) {
		        e.printStackTrace();
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=exception_occurred");
		    }
		    return;
		}
		if ("deleteCategory".equals(action)) {
		    String categoryName = request.getParameter("category_name");

		    if (categoryName != null && !categoryName.trim().isEmpty()) {
		        try {
		            // Call the DAO to delete the color from the database
		            boolean isDeleted = dao5.deleteCategory(categoryName.trim());

		            if (isDeleted) {
		                response.sendRedirect(request.getContextPath() + "/adminDashboard?success=category_deleted");
		                return;
		            } else {
		                response.sendRedirect(request.getContextPath() + "/adminDashboard?error=not_found");
		                return;
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=sql_error");
		            return;
		        }
		    } else {
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=missing_name");
		        return;
		    }
		}

	
	    
	    
	    
	}
	

}
