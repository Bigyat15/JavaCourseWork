<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.loginModel" %>
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
            display: flex;
        }

        .sidebar {
            width: 260px;
            background-color: #1f2937;
            color: white;
            height: 100vh;
            position: fixed;
            padding: 30px 20px;
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
            padding: 30px;
            width: 100%;
        }

        .section {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            margin-bottom: 30px;
        }

        .section h2 {
            font-weight: 600;
            margin-bottom: 25px;
        }

        .add-btn {
            background-color: #10b981;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 5px;
            margin-bottom: 20px;
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
            min-width: 100px;
        }
    </style>
</head>

<body>
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="#user-management"><i class="fas fa-users"></i>User Management</a>
        <a href="#product-management"><i class="fas fa-car"></i>Product Management</a>
        <a href="#report-generation"><i class="fas fa-chart-line"></i>Report Generation</a>
    </div>

    <div class="main">
        <!-- User Management -->
        <div class="section" id="user-management">
            <h2>User Management</h2>

            <!-- Add User Button -->
            <button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#addUserModal">
                <i class="fas fa-plus"></i> Add User
            </button>

            <% 
            ArrayList<loginModel> userList = (ArrayList<loginModel>) request.getAttribute("loginList"); 
            if(userList != null && !userList.isEmpty()){
            %>

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
                            <button class="btn edit-btn btn-sm">Edit</button>
                            <button class="btn delete-btn btn-sm">Delete</button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <% } else { %>
                <p>No users found.</p>
            <% } %>
        </div>

        <!-- Product Management -->
        <div class="section" id="product-management">
            <h2>Product Management</h2>

            <%
            ArrayList<productModel> productList = (ArrayList<productModel>) request.getAttribute("productList");
            if (productList != null && !productList.isEmpty()) {
            %>

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
                            <button class="btn edit-btn btn-sm">Edit</button>
                            <button class="btn delete-btn btn-sm">Delete</button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>

            <% } else { %>
                <p>No products found.</p>
            <% } %>
        </div>

        <!-- Report Generation -->
        <div class="section" id="report-generation">
            <h2>Report Generation</h2>
            <button class="add-btn"><i class="fas fa-plus"></i> Add Report</button>
        </div>
    </div>

    <!-- Add User Modal -->
    <!-- Add User Modal -->
<div class="modal fade" id="addUserModal" tabindex="-1" aria-labelledby="addUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="" method="post">
                <div class="modal-header">
                    <h5 class="modal-title" id="addUserModalLabel">Add New User</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>

                <div class="modal-body">
                    <div class="mb-3">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" required>
                    </div>
                    <div class="mb-3">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" required>
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
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="text" class="form-control" id="phone" name="phone">
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <div class="mb-3">
                        <label for="confirmPassword" class="form-label">Confirm Password</label>
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
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


    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
