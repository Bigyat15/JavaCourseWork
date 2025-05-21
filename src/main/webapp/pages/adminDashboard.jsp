<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.productModel" %>
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
        
        
    </script>
</body>
</html>