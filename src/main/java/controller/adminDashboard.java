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

import DAO.carColorModelDAO;
import DAO.categoryDAO;
import DAO.colorModelDAO;
import DAO.loginModelDAO;
import DAO.orderModelDAO;
import DAO.productImageModelDAO;
import DAO.productModelDAO;
import DAO.registerDAO;
import models.carColorsModel;
import models.categoryModel;
import models.colorModel;
import models.loginModel;
import models.orderModel;
import models.productImageModel;
import models.productModel;
import models.registerModel;

/**
 * Servlet implementation class adminDashboard
 */

@WebServlet("/adminDashboard")
@MultipartConfig
public class adminDashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private loginModelDAO dao;
    private productModelDAO dao1;
    private registerDAO dao2;
    private orderModelDAO dao3;
    private colorModelDAO dao4;
    private categoryDAO dao5;
    private productImageModelDAO dao6;
    private carColorModelDAO dao7;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminDashboard() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() {
    	dao = new loginModelDAO();
    	dao1 = new productModelDAO();
    	dao2 = new registerDAO();
    	dao3 = new orderModelDAO();
    	dao4 = new colorModelDAO();
    	dao5 = new categoryDAO();
    	dao6 = new productImageModelDAO();
    	dao7 = new carColorModelDAO();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ArrayList<loginModel> loginList;
		ArrayList<productModel> productList;
		ArrayList<orderModel> orderList;
		ArrayList<colorModel> colorList;
		ArrayList<categoryModel> categoryList;
		ArrayList<productImageModel> productImage;
		ArrayList<carColorsModel> carColorList;
		try {
			


			loginList = dao.getAllUserInfo();
			request.setAttribute("loginList",loginList);
			
		
			
	        productList = dao1.getAllProductDetail();
			request.setAttribute("productList", productList);
			
			orderList = dao3.getAllOrder();
			request.setAttribute("orderList", orderList);
			
			colorList = dao4.getAllColor();
			request.setAttribute("colorList", colorList);
			
			categoryList = dao5.getAllCategory();
			request.setAttribute("categoryList", categoryList);
			
			productImage = dao6.getAllProductImages();
			request.setAttribute("productImage", productImage);
			
			carColorList = dao7.getCarColorList();
			request.setAttribute("carColorList", carColorList);
			
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
		if("addColor".equals(action)) {
			
			String colorName = request.getParameter("color_name");
			if(colorName != null && !colorName.trim().isEmpty()) {
				try {
					dao4.addColor(colorName.trim());
					response.sendRedirect(request.getContextPath()+"/adminDashboard");
					return;
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}else {
				response.sendRedirect("/CollegeTutorial/pages/adminDashboard.jsp?error=empty");
				return;
			}
		}
		if ("deleteColor".equals(action)) {
		    String colorName = request.getParameter("color_name");

		    if (colorName != null && !colorName.trim().isEmpty()) {
		        try {
		            // Call the DAO to delete the color from the database
		            boolean isDeleted = dao4.deleteColor(colorName.trim());

		            if (isDeleted) {
		                response.sendRedirect(request.getContextPath() + "/adminDashboard?success=color_deleted");
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
		if ("editColor".equals(action)) {
		    try {
		        String colorIdStr = request.getParameter("color_id");
		        String newColorName = request.getParameter("color_name");
		        
		        // Validate parameters
		        if (colorIdStr == null || colorIdStr.trim().isEmpty() || 
		            newColorName == null || newColorName.trim().isEmpty()) {
		            if (!response.isCommitted()) {
		                response.sendRedirect(request.getContextPath() + "/adminDashboard?error=missing_parameters");
		            }
		            return;
		        }

		        int colorId = Integer.parseInt(colorIdStr);
		        boolean isEdited = dao4.updateColor(colorId, newColorName.trim());
		        
		        if (!response.isCommitted()) {
		            if (isEdited) {
		                response.sendRedirect(request.getContextPath() + "/adminDashboard?success=color_updated");
		            } else {
		                response.sendRedirect(request.getContextPath() + "/adminDashboard?error=color_not_found");
		            }
		        }
		    } catch (NumberFormatException e) {
		        e.printStackTrace();
		        if (!response.isCommitted()) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=invalid_color_id");
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		        if (!response.isCommitted()) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=sql_error");
		        }
		    }
		    return;
		}
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
		if ("addCarImage".equals(action)) {
		    try {
		        // Get form parameters
		        int carId = Integer.parseInt(request.getParameter("car_id"));
		        
		        // Handle file upload
		        Part filePart = request.getPart("car_images_path");
		        if (filePart == null || filePart.getSize() == 0) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=missing_image");
		            return;
		        }
		        
		        // Process the uploaded file
		        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
		        
		        // Define paths
		        String relativeImagePath = "images/" + fileName;  // Relative to webapp
		        String absoluteImagePath = getServletContext().getRealPath("/") + relativeImagePath;
		        
		        // Create directory if it doesn't exist
		        File uploadDir = new File(getServletContext().getRealPath("/images/"));
		        if (!uploadDir.exists()) {
		            uploadDir.mkdirs();
		        }
		        
		        // Save the file
		        filePart.write(absoluteImagePath);
		        
		        // Add image to database with relative path
		        boolean isAdded = dao6.addCarImage(carId, relativeImagePath);
		        
		        if (isAdded) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?success=image_added");
		        } else {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=add_failed");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=server_error");
		    }
		    return;
		}

		if ("editCarImage".equals(action)) {
		    try {
		        // Get parameters
		        int imageId = Integer.parseInt(request.getParameter("car_images_id"));
		        int carId = Integer.parseInt(request.getParameter("car_id"));
		        String currentImagePath = request.getParameter("current_car_image_path");
		        
		        // Handle optional image upload
		        Part filePart = request.getPart("car_images_path");
		        String imagePath = currentImagePath; // default to existing
		        
		        if (filePart != null && filePart.getSize() > 0) {
		            // New image was uploaded
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
		        
		        // Update the image in database
		        boolean isUpdated = dao6.updateCarImage(imageId, carId, imagePath);
		        
		        if (isUpdated) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?success=image_updated");
		        } else {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=update_failed");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=server_error");
		    }
		    return;
		}

		if ("deleteCarImage".equals(action)) {
		    try {
		        int imageId = Integer.parseInt(request.getParameter("car_images_id"));
		        boolean deleted = dao6.deleteCarImage(imageId);
		        
		        if (deleted) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?success=image_deleted");
		        } else {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=delete_failed");
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=server_error");
		    }
		    return;
		}
		if ("deleteCarColor".equals(action)) {
		    String colorID = request.getParameter("color_id");

		    if (colorID != null && !colorID.trim().isEmpty()) {
		        try {
		            // Call the DAO to delete the color from the database
		            boolean isDeleted = dao7.deleteCarColor(colorID.trim());

		            if (isDeleted) {
		                response.sendRedirect(request.getContextPath() + "/adminDashboard?success=car_color_deleted");
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
		// Add Car Color
		if ("addCarColor".equals(action)) {
		    try {
		        int carId = Integer.parseInt(request.getParameter("car_id"));
		        int colorId = Integer.parseInt(request.getParameter("color_id"));
		        
		        boolean isAdded = dao7.addCarColor(carId, colorId);
		        
		        if (isAdded) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?success=car_color_added");
		        } else {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=add_failed");
		        }
		    } catch (NumberFormatException e) {
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=invalid_id");
		    } catch (SQLException e) {
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=sql_error");
		    }
		    return;
		}

		// Edit Car Color
		if ("editCarColor".equals(action)) {
		    try {
		        int carColorId = Integer.parseInt(request.getParameter("car_colors_id"));
		        int carId = Integer.parseInt(request.getParameter("car_id"));
		        int colorId = Integer.parseInt(request.getParameter("color_id"));
		        
		        boolean isUpdated = dao7.updateCarColor(carColorId, carId, colorId);
		        
		        if (isUpdated) {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?success=car_color_updated");
		        } else {
		            response.sendRedirect(request.getContextPath() + "/adminDashboard?error=update_failed");
		        }
		    } catch (NumberFormatException e) {
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=invalid_id");
		    } catch (SQLException e) {
		    	e.printStackTrace();
		        response.sendRedirect(request.getContextPath() + "/adminDashboard?error=sql_error");
		    }
		    return;
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
