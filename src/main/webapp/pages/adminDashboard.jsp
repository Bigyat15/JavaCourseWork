<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.loginModel" %>
<%@ page import="models.productModel" %>
<%@ page import="models.orderModel" %>
<%@ page import="models.colorModel" %>
<%@ page import="models.categoryModel" %>
<%@ page import="models.productImageModel" %>
<%@ page import="models.carColorsModel" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Car Admin Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- FontAwesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f4f6f9;
        }

        .sidebar {
            width: 260px;
            background-color: #1f2937;
            color: white;
            height: 100vh;
            position: fixed;
            padding: 30px 20px;
            transition: all 0.3s;
            z-index: 1000;
        }

        .sidebar h2 {
            font-weight: 600;
            margin-bottom: 40px;
        }

        .sidebar a {
            color: #d1d5db;
            text-decoration: none;
            display: block;
            margin-bottom: 25px;
            font-size: 1rem;
        }

        .sidebar a i {
            margin-right: 10px;
        }

        .sidebar a:hover {
            color: #fff;
        }

        .main {
            margin-left: 260px;
            padding: 20px;
            width: calc(100% - 260px);
            transition: all 0.3s;
        }

        .section {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 20px;
            overflow-x: auto;
        }

        .section h2 {
            font-weight: 600;
            margin-bottom: 20px;
            font-size: 1.5rem;
        }

        .add-btn {
            background-color: #10b981;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            margin-bottom: 15px;
            font-size: 0.9rem;
        }

        .edit-btn {
            background-color: #f3f4f6;
            color: #111827;
        }

        .delete-btn {
            background-color: #ef4444;
            color: white;
        }

        .modal-header {
            background-color: #1f2937;
            color: white;
        }

        .modal-footer .btn {
            min-width: 80px;
        }

        .table-responsive {
            overflow-x: auto;
        }

        /* Mobile menu toggle */
        .mobile-menu-toggle {
            display: none;
            position: fixed;
            top: 15px;
            left: 15px;
            z-index: 1100;
            background: #1f2937;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 8px 12px;
            font-size: 1.2rem;
        }

        /* Responsive adjustments */
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main {
                margin-left: 0;
                width: 100%;
            }
            
            .mobile-menu-toggle {
                display: block;
            }
        }

        @media (max-width: 768px) {
            .section {
                padding: 15px;
            }
            
            .section h2 {
                font-size: 1.3rem;
            }
            
            .add-btn {
                padding: 6px 12px;
                font-size: 0.8rem;
            }
            
            .modal-dialog {
                margin: 10px auto;
            }
        }

        @media (max-width: 576px) {
            .section {
                padding: 10px;
            }
            
            .section h2 {
                font-size: 1.2rem;
                margin-bottom: 15px;
            }
            
            .btn {
                padding: 5px 10px;
                font-size: 0.8rem;
            }
            
            .modal-content {
                padding: 10px;
            }
        }
        .modal {
    z-index: 1060; /* Higher than the backdrop which is 1050 */
}

.modal-backdrop {
    z-index: 1040; /* Lower than the modal */
}
        .error {
    color: #dc3545;
    background-color: #f8d7da;
    border: 1px solid #f5c6cb;
    padding: 10px;
    border-radius: 4px;
    margin: 10px 0;
    text-align: center;
}

.success {
    color: #28a745;
    background-color: #d4edda;
    border: 1px solid #c3e6cb;
    padding: 10px;
    border-radius: 4px;
    margin: 10px 0;
    text-align: center;
}
    </style>
</head>

<body>
    <!-- Mobile Menu Toggle Button -->
    <button class="mobile-menu-toggle" id="mobileMenuToggle">
        <i class="fas fa-bars"></i>
    </button>

    <div class="sidebar" id="sidebar">
        <h2>Admin Panel</h2>
        <a href="#user-management"><i class="fas fa-users"></i>User Management</a>
        <a href="#product-management"><i class="fas fa-car"></i>Product Management</a>
        <a href="#report-generation"><i class="fas fa-chart-line"></i>Report Generation</a>
    </div>

    <div class="main" id="mainContent">
        <!-- User Management -->
        <% if(request.getParameter("error") != null && request.getParameter("error").equals("firstName")) { %>
    <p class="error">First name is required</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("lastName")) { %>
    <p class="error">Last name is required</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("dob")) { %>
    <p class="error">Date of birth is required</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("email")) { %>
    <p class="error">Email is required</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("phoneNumber")) { %>
    <p class="error">Phone number is required</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("password")) { %>
    <p class="error">Password is required</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("confirmPassword")) { %>
    <p class="error">Please confirm your password</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("passwordMismatch")) { %>
    <p class="error">Passwords do not match</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("emailExists")) { %>
    <p class="error">Email already exists</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("registrationFailed")) { %>
    <p class="error">Registration failed, please try again</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("databaseError")) { %>
    <p class="error">Database error occurred</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("deleteFailed")) { %>
    <p class="error">Failed to delete user</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("updateFailed")) { %>
    <p class="error">Failed to update user</p>
<% } %>

<% if(request.getParameter("message") != null && request.getParameter("message").equals("userDeleted")) { %>
    <p class="success">User deleted successfully</p>
<% } %>

<% if(request.getParameter("message") != null && request.getParameter("message").equals("userUpdated")) { %>
    <p class="success">User updated successfully</p>
<% } %>
<% if(request.getParameter("error") != null && request.getParameter("error").equals("empty")) { %>
    <p class="error">Color name cannot be empty</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("not_found")) { %>
    <p class="error">Color not found</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("sql_error")) { %>
    <p class="error">Database error processing color</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("missing_name")) { %>
    <p class="error">Color name is required</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("missing_parameters")) { %>
    <p class="error">Missing required parameters</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("invalid_color_id")) { %>
    <p class="error">Invalid color ID</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("color_updated")) { %>
    <p class="success">Color updated successfully</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("deleted")) { %>
    <p class="success">Color deleted successfully</p>
<% } %>
<% if(request.getParameter("error") != null && request.getParameter("error").equals("empty")) { %>
    <p class="error">Color name cannot be empty</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("not_found")) { %>
    <p class="error">Color not found</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("sql_error")) { %>
    <p class="error">Database error processing color</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("missing_name")) { %>
    <p class="error">Color name is required</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("missing_parameters")) { %>
    <p class="error">Missing required parameters</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("invalid_color_id")) { %>
    <p class="error">Invalid color ID</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("color_updated")) { %>
    <p class="success">Color updated successfully</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("deleted")) { %>
    <p class="success">Color deleted successfully</p>
<% } %>
<% if(request.getParameter("error") != null && request.getParameter("error").equals("missing_image")) { %>
    <p class="error">Category image is required</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("file_upload")) { %>
    <p class="error">Error uploading image</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("category_not_found")) { %>
    <p class="error">Category not found</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("category_added")) { %>
    <p class="success">Category added successfully</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("add_failed")) { %>
    <p class="error">Failed to add category</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("category_updated")) { %>
    <p class="success">Category updated successfully</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("update_failed")) { %>
    <p class="error">Failed to update category</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("exception_occurred")) { %>
    <p class="error">An error occurred</p>
<% } %>
<% if(request.getParameter("error") != null && request.getParameter("error").equals("server_error")) { %>
    <p class="error">Server error occurred</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("product_added")) { %>
    <p class="success">Product added successfully</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("product_updated")) { %>
    <p class="success">Product updated successfully</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("update_failed")) { %>
    <p class="error">Failed to update product</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("product_deleted")) { %>
    <p class="success">Product deleted successfully</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("not_found")) { %>
    <p class="error">Product not found</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("delete_failed")) { %>
    <p class="error">Failed to delete product</p>
<% } %>
<% if(request.getParameter("error") != null && request.getParameter("error").equals("missing_image")) { %>
    <p class="error">Image is required</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("image_added")) { %>
    <p class="success">Image added successfully</p>
<% } %>
<% if(request.getParameter("success") != null && request.getParameter("success").equals("category_deleted")) { %>
    <p class="success">Category deleted successfully</p>
<% } %>
<% if(request.getParameter("success") != null && request.getParameter("success").equals("color_deleted")) { %>
    <p class="success">Color deleted successfully</p>
<% } %>


<% if(request.getParameter("error") != null && request.getParameter("error").equals("add_failed")) { %>
    <p class="error">Failed to add image</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("image_updated")) { %>
    <p class="success">Image updated successfully</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("image_deleted")) { %>
    <p class="success">Image deleted successfully</p>
<% } %>
<% if(request.getParameter("error") != null && request.getParameter("error").equals("invalidUserId")) { %>
    <p class="error">Invalid user ID format</p>
<% } %>
<% if(request.getParameter("success") != null && request.getParameter("success").equals("car_color_deleted")) { %>
    <p class="success">Car Color deleted successfully</p>
<% } %>
<% if(request.getParameter("success") != null && request.getParameter("success").equals("car_color_added")) { %>
    <p class="success">Car color added successfully</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("car_color_updated")) { %>
    <p class="success">Car color updated successfully</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("add_failed")) { %>
    <p class="error">Failed to add car color</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("update_failed")) { %>
    <p class="error">Failed to update car color</p>
<% } %>

<% if(request.getParameter("error") != null && request.getParameter("error").equals("invalid_id")) { %>
    <p class="error">Invalid ID format</p>
<% } %>

        <div class="section" id="user-management">
            <h2 class="text-center">User Management</h2>

            <!-- Add User Button -->
            <button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#addUserModal">
                <i class="fas fa-plus"></i> Add User
            </button>

            <% 
            ArrayList<loginModel> userList = (ArrayList<loginModel>) request.getAttribute("loginList"); 
            if(userList != null && !userList.isEmpty()){
            %>

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Name</th>
                            <th>Date of Birth</th>
                            <th>Email</th>
                            <th>Number</th>
                            <th>Created At</th>
                            <th>Updated At</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(loginModel lm : userList){ %>
                        <tr>
                            <td><%= lm.getFirst_name() + " " + lm.getLast_name() %></td>
                            <td><%= lm.getDob() %></td>
                            <td><%= lm.getEmail() != null ? lm.getEmail() : "N/A" %></td>
                            <td><%= lm.getPhone_number() != null ? lm.getPhone_number() : "N/A" %></td>
                            <td><%= lm.getCreated_at() %></td>
                            <td><%= lm.getUpdated_at() %></td>
                            <td>
                                <div class="d-flex flex-wrap gap-1">
                                    <button class="btn edit-btn btn-sm" 
                                        data-bs-toggle="modal" data-bs-target="#editUserModal" 
                                        data-id="<%= lm.getUser_id() %>" 
                                        data-firstname="<%= lm.getFirst_name() %>" 
                                        data-lastname="<%= lm.getLast_name() %>" 
                                        data-dob="<%= lm.getDob() %>" 
                                        data-email="<%= lm.getEmail() != null ? lm.getEmail() : "" %>" 
                                        data-phone="<%= lm.getPhone_number() != null ? lm.getPhone_number() : "" %>">
                                        Edit
                                    </button>

                                    <form action="${pageContext.request.contextPath}/adminDashboard" method="GET">
                                        <input type="hidden" name="action" value="deleteUser">
                                        <input type="hidden" name="user_id" value="<%= lm.getUser_id() %>">
                                        <button class="btn delete-btn btn-sm">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <% } else { %>
                <p>No users found.</p>
            <% } %>
        </div>

        <!-- Product Management -->
        <div class="section" id="product-management">
            <h2>Product Management</h2>
            <button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#addProductModal">
                <i class="fas fa-plus"></i> Add Product
            </button>

            <%
            ArrayList<productModel> productList = (ArrayList<productModel>) request.getAttribute("productList");
            if (productList != null && !productList.isEmpty()) {
            %>

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Car Name</th>
                            <th>Description</th>
                            <th>Category</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Brand</th>
                            <th>Year</th>
                            <th>Model</th>
                            <th>Store image</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for(productModel pim : productList){ %>
                        <tr>
                            <td><%= pim.getCar_name() %></td>
                            <td><%= pim.getCar_description() %></td>
                            <td><%= pim.getCategory_name() %></td>
                            <td><%= pim.getCar_quantity() %></td> 
                            <td><%= pim.getCar_price() %></td>
                            <td><%= pim.getCar_brand() %></td>
                            <td><%= pim.getCar_year() %></td>
                            <td><%= pim.getCar_model() %></td>
                            <td><%= pim.getStore_images() %></td>
                            <td>
                                <div class="d-flex flex-wrap gap-1">
                                    <button class="btn edit-btn btn-sm" 
                                        data-bs-toggle="modal" 
                                        data-bs-target="#editProductModal"
                                        data-car-id="<%= pim.getCar_id() %>"
                                        data-car-name="<%= pim.getCar_name() %>"
                                        data-category-id="<%= pim.getCategory_id() %>"
                                        data-car-description="<%= pim.getCar_description() %>"
                                        data-category-name="<%= pim.getCategory_name() %>"
                                        data-car-quantity="<%= pim.getCar_quantity() %>"
                                        data-car-price="<%= pim.getCar_price() %>"
                                        data-car-brand="<%= pim.getCar_brand() %>"
                                        data-car-year="<%= pim.getCar_year() %>"
                                        data-car-model="<%= pim.getCar_model() %>"
                                        data-store-images="<%= pim.getStore_images() %>"
                                        data-engine-type="<%= pim.getEngine_type() %>"
                                        data-performance="<%= pim.getPerformance() %>"
                                        data-transmission="<%= pim.getTransmission() %>">
                                        Edit
                                    </button>
                                    <form method="POST" action="${pageContext.request.contextPath}/adminDashboard">
                                        <input type="hidden" name="action" value="deleteProduct">
                                        <input type="hidden" name="car_name" value="<%=pim.getCar_name() %>">
                                        <button class="btn delete-btn btn-sm">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>

            <% } else { %>
                <p>No products found.</p>
            <% } %>
        </div>
        
        <div class="section" id="car-images-management">
    <h2>Car Images Management</h2>
    <input name="car_name" type="hidden">
    
    <!-- Add Car Image Button -->
    <button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#addCarImageModal">
        <i class="fas fa-plus"></i> Add Car Image
    </button>

    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Image Path</th>
                    <th>Car Name</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                ArrayList<productImageModel> productImage = (ArrayList<productImageModel>) request.getAttribute("productImage");
                if(productImage != null && !productImage.isEmpty()){
                    for(productImageModel cim : productImage){
                %>
                <tr>
                    <td><%= cim.getCar_id() %></td>
                    <td><%= cim.getCar_images_path() %></td>
                    <td><%= cim.getCar_name() %></td>
                    <td>
                        <div class="d-flex flex-wrap gap-1">
                            <button 
                                class="btn btn-primary btn-sm edit-btn"
                                data-bs-toggle="modal"
                                data-bs-target="#editCarImageModal"
                                data-car-image-id="<%= cim.getCar_images_id() %>"
                                data-car-image-path="<%= cim.getCar_images_path() %>"
                                data-car-id="<%= cim.getCar_id() %>">
                                Edit
                            </button>

                            <form action="${pageContext.request.contextPath}/adminDashboard" method="POST">
                                <input type="hidden" name="action" value="deleteCarImage">
                                <input type="hidden" name="car_images_id" value="<%= cim.getCar_images_id() %>">
                                <button class="btn delete-btn btn-sm">Delete</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr><td colspan="4" class="text-center">No Car Images Found</td></tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Car Image Modal -->
<div class="modal fade" id="addCarImageModal" tabindex="-1" aria-labelledby="addCarImageModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/adminDashboard" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="action" value="addCarImage">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCarImageModalLabel">Add New Car Image</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                <% 
                if (productList != null && !productList.isEmpty()) {
                    
                	
                %>
                    <div class="mb-3">
                        <label for="carId" class="form-label">Car ID</label>
                        <select class="form-control" id="editCarId" name="car_id" required>
        					<option value="">Select Car</option>
        					<%
        					for(productModel cim : productList){
        					%>
        					<option value="<%= cim.getCar_id() %>"><%= cim.getCar_name() %></option>
        					<%} %>
    					</select>
                    </div>
                    
                    <%}else{ %>
                    <p>No data present</p>
                    <%} %>
                    <div class="mb-3">
                        <label for="carImagePath" class="form-label">Image</label>
                        <input type="file" class="form-control" id="carImagePath" name="car_images_path" accept="image/*" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save Image</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Edit Car Image Modal -->
<div class="modal fade" id="editCarImageModal" tabindex="-1" aria-labelledby="editCarImageModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/adminDashboard" method="POST" enctype="multipart/form-data">
                <input type="hidden" name="action" value="editCarImage">
                <input type="hidden" id="editCarImageId" name="car_images_id">
                <input type="hidden" id="editCarId" name="car_id">
                <input type="hidden" id="editCurrentCarImagePath" name="current_car_image_path">
                
                <div class="modal-header">
                    <h5 class="modal-title" id="editCarImageModalLabel">Edit Car Image</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <div class="modal-body">
                <% 
                
                if (productList != null && !productList.isEmpty()) {
                	
                %>
                    <div class="mb-3">
    					<label for="editCarId" class="form-label">Car</label>
   						<select class="form-control" id="editCarId" name="car_id" required>
        					<option value="">Select Car</option>
        					<%
        					for(productModel pmm : productList){
        					%>
        					<option value="<%= pmm.getCar_id() %>"><%= pmm.getCar_name() %></option>
        					<%} %>
    					</select>
					</div>
                    
                    <%}else{ %>
                    <p>No data present</p>
                    <%} %>
                    
                    <div class="mb-3">
                        <label for="editCarImagePath" class="form-label">Image</label>
                        <input type="file" class="form-control" id="editCarImagePath" name="car_images_path" accept="image/*">
                        <small class="text-muted">Leave blank to keep current image</small>
                    </div>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

        <div class="section" id="color-management">
            <h2>Color Management</h2>
            
            <!-- Add Color Button -->
            <button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#addColorModal">
                <i class="fas fa-plus"></i> Add Color
            </button>

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Color Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        ArrayList<colorModel> colorList = (ArrayList<colorModel>) request.getAttribute("colorList");
                        if(colorList != null && !colorList.isEmpty()){
                            for(colorModel cm:colorList){
                        %>
                        <tr>
                            <td><%=cm.getColor_id() %></td>
                            <td><%=cm.getColor_name() %></td>
                            <td>
                                <div class="d-flex flex-wrap gap-1">
                                    <button 
                                        class="btn btn-primary btn-sm edit-btn"
                                        data-bs-toggle="modal"
                                        data-bs-target="#editColorModal"
                                        data-color-id="<%= cm.getColor_id() %>"
                                        data-color-name="<%= cm.getColor_name() %>">
                                        Edit
                                    </button>

                                    <form action="${pageContext.request.contextPath}/adminDashboard" method="POST">
                                        <input type="hidden" name="action" value="deleteColor">
                                        <input type="hidden" name="color_name" value="<%=cm.getColor_name() %>" >
                                        <button class="btn delete-btn btn-sm">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        }else{
                        %>
                        <tr><td colspan="3" class="text-center">No Colors Found</td></tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="section" id="color-management">
            <h2>Car Color Management</h2>
            
            <!-- Add Color Button -->
            <button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#addCarColorModal">
                <i class="fas fa-plus"></i> Add Car Color
            </button>

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Color Name</th>
                            <th>Car Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        ArrayList<carColorsModel> carColorList = (ArrayList<carColorsModel>) request.getAttribute("carColorList");
                        if(carColorList != null && !carColorList.isEmpty()){
                            for(carColorsModel cm:carColorList){
                        %>
                        <tr>
                            <td><%=cm.getColorsName() %></td>
                            <td><%=cm.getCarName() %></td>
                            <td>
                                <div class="d-flex flex-wrap gap-1">
                                    <button 
                                        class="btn btn-primary btn-sm edit-btn"
                                        data-bs-toggle="modal"
                                        data-bs-target="#editCarColorModal"
                                        data-color-id="<%= cm.getColorsID() %>"
                                        data-id="<%=cm.getCarColorsID() %>"
                                        data-car-name="<%= cm.getCarName() %>"
                                        data-car-id="<%= cm.getCarID() %>"
                                        data-car-name="<%=cm.getCarName() %>">
                                        Edit
                                    </button>

                                    <form action="${pageContext.request.contextPath}/adminDashboard" method="POST">
                                        <input type="hidden" name="action" value="deleteCarColor">
                                       <input type="hidden" name="color_id" value="<%=cm.getColorsID() %>" > 
                                        <button class="btn delete-btn btn-sm">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        }else{
                        %>
                        <tr><td colspan="3" class="text-center">No Colors Found</td></tr>
                        <%} %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Category Management -->
        <div class="section" id="category-management">
            <h2>Category Management</h2>
            
            <!-- Add Category Button -->
            <button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                <i class="fas fa-plus"></i> Add Category
            </button>

            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Category Name</th>
                            <th>Image Path</th>
                            <th>Description</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        ArrayList<categoryModel> categoryList = (ArrayList<categoryModel>) request.getAttribute("categoryList");
                        if(categoryList != null && !categoryList.isEmpty()) {
                            for(categoryModel cat : categoryList) {
                        %>
                        <tr>
                            <td><%= cat.getCaregory_id() %></td>
                            <td><%= cat.getCategory_name() %></td>
                            <td><%= cat.getCategory_image_path() %></td>
                            <td><%= cat.getCategory_description() %></td>
                            <td>
                                <div class="d-flex flex-wrap gap-1">
                                    <button class="btn edit-btn btn-sm" 
                                            data-bs-toggle="modal" 
                                            data-bs-target="#editCategoryModal"
                                            data-category-id="<%= cat.getCaregory_id() %>"
                                            data-category-name="<%= cat.getCategory_name() %>"
                                            data-category-path="<%= cat.getCategory_image_path() %>"
                                            data-category-desc="<%= cat.getCategory_description() %>">
                                        Edit
                                    </button>
                                    <form action="${pageContext.request.contextPath}/adminDashboard" method="POST">
                                        <input type="hidden" name="action" value="deleteCategory">
                                        <input type="hidden" name="category_name" value="<%= cat.getCategory_name() %>">
                                        <button class="btn delete-btn btn-sm">Delete</button>
                                    </form>
                                </div>
                            </td>
                        </tr>
                        <% 
                            }
                        } else { 
                        %>
                        <tr>
                            <td colspan="5" class="text-center">No Categories Found</td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Report Generation -->
        <div class="section" id="report-generation">
            <h2>View Report</h2>
            
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="table-dark">
                        <tr>
                            <th>Order ID</th>
                            <th>Car Name</th>
                            <th>Cart ID</th>
                            <th>User ID</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                        ArrayList<orderModel> orderList = (ArrayList<orderModel>) request.getAttribute("orderList");
                        if (orderList != null && !orderList.isEmpty()) {
                            for (orderModel order : orderList) {
                        %>
                        <tr>
                            <td><%= order.getOrder_id() %></td>
                            <td><%= order.getCar_name() %></td>
                            <td><%= order.getCart_id() %></td>
                            <td><%= order.getFirst_name() + " " + order.getLast_name() %></td>
                            <td>$<%= order.getTotal() %></td>
                        </tr>
                        <% 
                            }
                        } else { 
                        %>
                        <tr>
                            <td colspan="5" class="text-center">No orders available</td>
                        </tr>
                        <% 
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Add User Modal -->
    <div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/adminDashboard" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="first_name" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="firstName" name="first_name" required>
                        </div>
                        <div class="mb-3">
                            <label for="last_name" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="lastName" name="last_name" required>
                        </div>
                        <div class="mb-3">
                            <label for="dob" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="dob" name="dob" required>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" name="email" required>
                        </div>
                        <div class="mb-3">
                            <label for="phone_number" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="phone" name="phone_number">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="mb-3">
                            <label for="confirmPassword" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="confirmPassword" name="confirm_password" required>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-success">Add User</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/adminDashboard" method="POST">
                    <input type="hidden" id="editUserId" name="user_id">
                    <input type="hidden" name="action" value="editUser"> 
                    <div class="modal-header">
                        <h5 class="modal-title" id="editUserModalLabel">Edit User</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <input type="hidden" id="editUserId" name="user_id">
                        
                        <div class="mb-3">
                            <label for="editFirstName" class="form-label">First Name</label>
                            <input type="text" class="form-control" id="editFirstName" name="first_name" required>
                        </div>
                        <div class="mb-3">
                            <label for="editLastName" class="form-label">Last Name</label>
                            <input type="text" class="form-control" id="editLastName" name="last_name" required>
                        </div>
                        <div class="mb-3">
                            <label for="editDob" class="form-label">Date of Birth</label>
                            <input type="date" class="form-control" id="editDob" name="dob" required>
                        </div>
                        <div class="mb-3">
                            <label for="editEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="editEmail" name="email">
                        </div>
                        <div class="mb-3">
                            <label for="editPhone" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="editPhone" name="phone_number">
                        </div>
                        
                        <div class="mb-3">
                            <label for="editPassword" class="form-label">Password</label>
                            <input type="password" class="form-control" id="editPassword" name="password">
                            <small class="text-muted">Leave blank to keep the current password.</small>
                        </div>
                        <div class="mb-3">
                            <label for="editConfirmPassword" class="form-label">Confirm Password</label>
                            <input type="password" class="form-control" id="editConfirmPassword" name="confirm_password">
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-success">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Add Product Modal -->
    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <!-- Ensure the modal is always rendered -->
            <form action="${pageContext.request.contextPath}/adminDashboard" method="post" enctype="multipart/form-data">
                <div class="modal-header">
                    <h5 class="modal-title" id="addProductModalLabel">Add New Product</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Input fields -->
                    <div class="mb-3">
                        <label for="car_name" class="form-label">Car Name</label>
                        <input type="text" class="form-control" name="car_name" required>
                    </div>
                    <div class="mb-3">
                        <label for="car_description" class="form-label">Description</label>
                        <textarea class="form-control" name="car_description" rows="3" required></textarea>
                    </div>

                    <% 
                        
                        if (categoryList != null && !categoryList.isEmpty()) {
                            
                    %>
                       

                        <!-- Category selection -->
                        <div class="mb-3">
                            <label for="category_id" class="form-label">Category</label>
    <select class="form-control" name="category_id" required>
        <option value="" disabled selected>Select a category</option>
        <% for (categoryModel cm : categoryList) { %>
            <option value="<%= cm.getCaregory_id() %>"><%= cm.getCategory_name() %></option>
        <% } %>
    </select>                        </div>
                    <% 
                        } else {
                    %>
                        <!-- If no categories found, display a message -->
                        <p>No categories found. Please add a category before adding a product.</p>
                    <% } %>

                    <!-- Other product input fields -->
                    <div class="mb-3">
                        <label for="car_quantity" class="form-label">Quantity</label>
                        <input type="number" class="form-control" name="car_quantity" required>
                    </div>
                    <div class="mb-3">
                        <label for="car_price" class="form-label">Price</label>
                        <input type="number" step="0.01" class="form-control" name="car_price" required>
                    </div>
                    <div class="mb-3">
                        <label for="car_brand" class="form-label">Brand</label>
                        <input type="text" class="form-control" name="car_brand" required>
                    </div>
                    <div class="mb-3">
                        <label for="car_year" class="form-label">Year</label>
                        <input type="number" class="form-control" name="car_year" required>
                    </div>
                    <div class="mb-3">
                        <label for="car_model" class="form-label">Model No</label>
                        <input type="text" class="form-control" name="car_model" required>
                    </div>
                    <div class="mb-3">
                        <label for="store_images" class="form-label">Store Image</label>
                        <input type="file" class="form-control" name="store_images" accept="image/*" required>
                    </div>
                    <div class="mb-3">
                        <label for="engine_type" class="form-label">Engine Type</label>
                        <input type="text" class="form-control" name="engine_type" required>
                    </div>
                    <div class="mb-3">
                        <label for="performance" class="form-label">Performance</label>
                        <input type="text" class="form-control" name="performance" required>
                    </div>
                    <div class="mb-3">
                        <label for="transmission" class="form-label">Transmission</label>
                        <input type="text" class="form-control" name="transmission" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" name="action" value="addProduct" class="btn btn-success">Add Product</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                </div>
            </form>
        </div>
    </div>
</div>

    
    <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/adminDashboard" method="post" enctype="multipart/form-data">
                    
                    <input type="hidden" name="car_id">
                    <%-- <input type="hidden" name="car_name" value="<%= pm.getCar_name() %>"> --%>
                    <input type="hidden" name="action" value="editProduct">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editProductModalLabel">Edit Product</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                        <!-- Form fields -->
                        <div class="mb-3">
                            <label class="form-label">Car Name</label>
                            <input type="text" class="form-control" name="car_name"  required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea class="form-control" name="car_description" rows="3" required></textarea>
                        </div>

                        <div class="mb-3">
                            <label for="category_id" class="form-label">Category</label>
    <select class="form-control" name="category_id" required>
        <option value="" disabled selected>Select a category</option>
        <% for (categoryModel cm : categoryList) { %>
            <option value="<%= cm.getCaregory_id() %>"><%= cm.getCategory_name() %></option>
        <% } %>
    </select>                        </div>
                    
  

                        <div class="mb-3">
                            <label class="form-label">Quantity</label>
                            <input type="number" class="form-control" name="car_quantity" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Price</label>
                            <input type="number" step="0.01" class="form-control" name="car_price" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Brand</label>
                            <input type="text" class="form-control" name="car_brand"  required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Year</label>
                            <input type="number" class="form-control" name="car_year"  required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Model</label>
                            <input type="number" class="form-control" name="car_model"  required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Store Image</label>
                            <input type="file" class="form-control" name="store_images" accept="image/*">
                            <small>Leave blank to keep current image</small>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Engine Type</label>
                            <input type="text" class="form-control" name="engine_type"  required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Performance</label>
                            <input type="text" class="form-control" name="performance"  required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Transmission</label>
                            <input type="text" class="form-control" name="transmission"  required>
                        </div>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="submit" name="action" value="editProduct" class="btn btn-primary">Update Product</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <!-- Add Category Modal -->
    <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/adminDashboard" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="addCategory">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addCategoryModalLabel">Add New Category</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="categoryName" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="categoryName" name="category_name" required>
                        </div>
                        <div class="mb-3">
                            <label for="categoryImage" class="form-label">Category Image</label>
                            <input type="file" class="form-control" id="categoryImage" name="category_image" accept="image/*" required>
                        </div>
                        <div class="mb-3">
                            <label for="categoryDesc" class="form-label">Description</label>
                            <textarea class="form-control" id="categoryDesc" name="category_description" rows="3" required></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save Category</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Category Modal -->
    <div class="modal fade" id="editCategoryModal" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/adminDashboard" method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="editCategory">
                    <input type="hidden" id="editCategoryId" name="category_id">
                    <input type="hidden" id="editCurrentCategoryImage" name="current_category_image">

                    <div class="modal-header">
                        <h5 class="modal-title" id="editCategoryModalLabel">Edit Category</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="editCategoryName" class="form-label">Category Name</label>
                            <input type="text" class="form-control" id="editCategoryName" name="category_name" required>
                        </div>
                        <div class="mb-3">
                            <label for="editCategoryImage" class="form-label">Category Image</label>
                            <input type="file" class="form-control" id="editCategoryImage" name="category_image" accept="image/*">
                            <small class="text-muted">Leave blank to keep current image</small>
                        </div>
                        <div class="mb-3">
                            <label for="editCategoryDesc" class="form-label">Description</label>
                            <textarea class="form-control" id="editCategoryDesc" name="category_description" rows="3" required></textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Add Color Modal -->
    <div class="modal fade" id="addColorModal" tabindex="-1" aria-labelledby="addColorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/adminDashboard" method="POST">
                    <input type="hidden" name="category_name">
                    <input type="hidden" name="action" value="addColor">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addColorModalLabel">Add New Color</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="colorName" class="form-label">Color Name</label>
                            <input type="text" class="form-control" id="colorName" name="color_name" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save Color</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Edit Color Modal -->
    <div class="modal fade" id="editColorModal" tabindex="-1" aria-labelledby="editColorModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="${pageContext.request.contextPath}/adminDashboard" method="POST">
                    <input type="hidden" name="action" value="editColor">
                    <input type="hidden" id="editColorId" name="color_id">
                    
                    <div class="modal-header">
                        <h5 class="modal-title" id="editColorModalLabel">Edit Color</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    
                    <div class="modal-body">
                        <div class="mb-3">
                            <label for="editColorName" class="form-label">Color Name</label>
                            <input type="text" class="form-control" id="editColorName" name="color_name" required>
                        </div>
                    </div>
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-success">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Add Car Color Modal -->
<div class="modal fade" id="addCarColorModal" tabindex="-1" aria-labelledby="addCarColorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/adminDashboard" method="POST">
                <input type="hidden" name="action" value="addCarColor">
                <div class="modal-header">
                    <h5 class="modal-title" id="addCarColorModalLabel">Add Car Color</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="addCarId" class="form-label">Car</label>
                        <select class="form-control" id="addCarId" name="car_id" required>
                            <option value="">Select Car</option>
                            <% for(productModel car : productList) { %>
                            <option value="<%= car.getCar_id() %>"><%= car.getCar_name() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="addColorId" class="form-label">Color</label>
                        <select class="form-control" id="addColorId" name="color_id" required>
                            <option value="">Select Color</option>
                            <% for(colorModel color : colorList) { %>
                            <option value="<%= color.getColor_id() %>"><%= color.getColor_name() %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Add Color</button>
                </div>
            </form>
        </div>
    </div>
</div>


<!-- Edit Car Color Modal -->
<div class="modal fade" id="editCarColorModal" tabindex="-1" aria-labelledby="editCarColorModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/adminDashboard" method="POST">
                <input type="hidden" name="action" value="editCarColor">
                <input type="hidden" id="editCarColorId" name="car_colors_id">
                <div class="modal-header">
                    <h5 class="modal-title" id="editCarColorModalLabel">Edit Car Color</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="editCarId" class="form-label">Car</label>
                        <select class="form-control" id="editCarId" name="car_id" required>
                            <option value="">Select Car</option>
                            <% for(productModel car : productList) { %>
                            <option value="<%= car.getCar_id() %>"><%= car.getCar_name() %></option>
                            <% } %>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="editColorId" class="form-label">Color</label>
                        <select class="form-control" id="editColorId" name="color_id" required>
                            <option value="">Select Color</option>
                            <% for(colorModel color : colorList) { %>
                            <option value="<%= color.getColor_id() %>"><%= color.getColor_name() %></option>
                            <% } %>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-success">Save Changes</button>
                </div>
            </form>
        </div>
    </div>
</div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Mobile menu toggle functionality
        document.getElementById('mobileMenuToggle').addEventListener('click', function() {
            document.getElementById('sidebar').classList.toggle('active');
        });

        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', function(event) {
            const sidebar = document.getElementById('sidebar');
            const mobileMenuToggle = document.getElementById('mobileMenuToggle');
            
            if (window.innerWidth <= 992 && 
                !sidebar.contains(event.target) && 
                event.target !== mobileMenuToggle && 
                !mobileMenuToggle.contains(event.target)) {
                sidebar.classList.remove('active');
            }
        });

        // Edit User Modal
        var editUserModal = document.getElementById('editUserModal');
        editUserModal.addEventListener('show.bs.modal', function (event) {
            var button = event.relatedTarget;
            var userId = button.getAttribute('data-id');
            var firstName = button.getAttribute('data-firstname');
            var lastName = button.getAttribute('data-lastname');
            var dob = button.getAttribute('data-dob');
            var email = button.getAttribute('data-email');
            var phone = button.getAttribute('data-phone');

            var modal = editUserModal.querySelector('form');
            modal.querySelector('#editUserId').value = userId;
            modal.querySelector('#editFirstName').value = firstName;
            modal.querySelector('#editLastName').value = lastName;
            modal.querySelector('#editDob').value = dob;
            modal.querySelector('#editEmail').value = email;
            modal.querySelector('#editPhone').value = phone;
            modal.querySelector('#editPassword').value = "";
            modal.querySelector('#editConfirmPassword').value = "";
        });

        // Edit Color Modal
        document.getElementById('editColorModal').addEventListener('show.bs.modal', function(event) {
            var button = event.relatedTarget;
            var colorId = button.getAttribute('data-color-id');
            var colorName = button.getAttribute('data-color-name');
            
            var modal = this;
            modal.querySelector('#editColorId').value = colorId;
            modal.querySelector('#editColorName').value = colorName;
        });

        // Edit Category Modal
        document.getElementById('editCategoryModal').addEventListener('show.bs.modal', function(event) {
    var button = event.relatedTarget;
    var categoryId = button.getAttribute('data-category-id');
    var categoryName = button.getAttribute('data-category-name');
    var categoryPath = button.getAttribute('data-category-path');
    var categoryDesc = button.getAttribute('data-category-desc');

    //console.log("Editing Category:", { categoryId, categoryName, categoryPath, categoryDesc }); // Debug

    var modal = this;
    modal.querySelector('#editCategoryId').value = categoryId;
    modal.querySelector('#editCategoryName').value = categoryName;
    modal.querySelector('#editCategoryDesc').value = categoryDesc;
    modal.querySelector('#editCurrentCategoryImage').value = categoryPath;
});

        // Edit Product Modal
        document.getElementById('editProductModal')?.addEventListener('show.bs.modal', function(event) {
        	var button = event.relatedTarget; // Button that triggered the modal
            var modal = this;
            
            // Set all the product fields from data attributes
            modal.querySelector('input[name="car_id"]').value = button.getAttribute('data-car-id');
            modal.querySelector('select[name="category_id"]').value = button.getAttribute('data-category-id');

            modal.querySelector('input[name="car_name"]').value = button.getAttribute('data-car-name');
            modal.querySelector('textarea[name="car_description"]').value = button.getAttribute('data-car-description');
            
            modal.querySelector('input[name="car_quantity"]').value = button.getAttribute('data-car-quantity');
            modal.querySelector('input[name="car_price"]').value = button.getAttribute('data-car-price');
            modal.querySelector('input[name="car_brand"]').value = button.getAttribute('data-car-brand');
            modal.querySelector('input[name="car_year"]').value = button.getAttribute('data-car-year');
            modal.querySelector('input[name="car_model"]').value = button.getAttribute('data-car-model');
            modal.querySelector('input[name="engine_type"]').value = button.getAttribute('data-engine-type');
            modal.querySelector('input[name="performance"]').value = button.getAttribute('data-performance');
            modal.querySelector('input[name="transmission"]').value = button.getAttribute('data-transmission');
        });
        
        //Edit car modal
        document.getElementById('editCarImageModal').addEventListener('show.bs.modal', function(event) {
        var button = event.relatedTarget;
        var carImageId = button.getAttribute('data-car-image-id');
        var carImagePath = button.getAttribute('data-car-image-path');
        var carId = button.getAttribute('data-car-id');
        
        var modal = this;
        modal.querySelector('#editCarImageId').value = carImageId;
        modal.querySelector('#editCurrentCarImagePath').value = carImagePath;
        modal.querySelector('#editCarId').value = carId;
    });
     // Initialize all modals
        document.addEventListener('DOMContentLoaded', function() {
            // This ensures Bootstrap modals are properly initialized
            var addColorModal = new bootstrap.Modal(document.getElementById('addColorModal'));
            var addCategoryModal = new bootstrap.Modal(document.getElementById('addCategoryModal'));
            
            // You can also add event listeners if needed
            document.querySelector('.add-btn[data-bs-target="#addColorModal"]').addEventListener('click', function() {
                addColorModal.show();
            });
            
            document.querySelector('.add-btn[data-bs-target="#addCategoryModal"]').addEventListener('click', function() {
                addCategoryModal.show();
            });
        });
     // Edit Car Color Modal
        document.getElementById('editCarColorModal').addEventListener('show.bs.modal', function(event) {
    var button = event.relatedTarget;
    
    // Get all required data attributes from the button
    var carColorId = button.getAttribute('data-id'); // Changed to match button data
    var carId = button.getAttribute('data-car-id');
    var colorId = button.getAttribute('data-color-id');
    
    // Debugging - log the values to console
    console.log("Editing car color:", {
        carColorId: carColorId,
        carId: carId,
        colorId: colorId
    });
    
    var modal = this;
    
    // Set the form values
    modal.querySelector('#editCarColorId').value = carColorId;
    modal.querySelector('#editCarId').value = carId;
    modal.querySelector('#editColorId').value = colorId;
});
    </script>
</body>
</html>