<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.categoryModel" %>

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



<% if(request.getParameter("error") != null && request.getParameter("error").equals("category_not_found")) { %>
    <p class="error">Category not found</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("category_added")) { %>
    <p class="success">Category added successfully</p>
<% } %>

<% if(request.getParameter("success") != null && request.getParameter("success").equals("category_updated")) { %>
    <p class="success">Category updated successfully</p>
<% } %>



      

       
        
    



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