<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.loginModel" %>
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
    </script>
</body>
</html>