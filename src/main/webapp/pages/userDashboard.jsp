<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="models.loginModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        /* Luxury color scheme */
        .luxury-bg {
            background-color: #1a1a1a;
        }
        .luxury-btn {
            background-color: #4A4A4A;
            color: #FFF;
            transition: all 0.3s ease;
        }
        .luxury-btn:hover {
            background-color: #2C2C2C;
            transform: translateY(-1px);
        }
        .luxury-card {
            background-color: #2C2C2C;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1), 0px 1px 3px rgba(0, 0, 0, 0.08);
            border-radius: 1.5rem;
            width: 100%;
            max-width: 600px;
        }
        .luxury-text {
            color: #D1D5DB;
        }
        .luxury-heading {
            color: #FFF;
        }
    </style>
</head>
<body class="luxury-bg min-h-screen">
<%@ include file="navbar.jsp" %>

<%
    loginModel user = (loginModel) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String mode = request.getParameter("mode");
    boolean editMode = "edit".equals(mode);
%>

<div class="flex flex-col items-center justify-center min-h-[calc(100vh-80px)] p-4">
    <div class="luxury-card p-8 w-full">
        <h2 class="luxury-heading text-3xl font-semibold mb-6 text-center">Edit Profile</h2>

        <% if (editMode) { %>
            <form action="userDashboard" method="POST" class="space-y-6">
                <input type="hidden" name="action" value="updateProfile">
                
                <div class="space-y-4">
                    <div>
                        <label class="luxury-text block text-sm font-medium mb-2">First Name</label>
                        <input type="text" name="first_name" value="<%= user.getFirst_name() %>" 
                               class="w-full px-4 py-3 rounded-lg bg-gray-800 border border-gray-700 focus:border-gray-500 focus:outline-none text-white">
                    </div>
                    
                    <div>
                        <label class="luxury-text block text-sm font-medium mb-2">Last Name</label>
                        <input type="text" name="last_name" value="<%= user.getLast_name() %>" 
                               class="w-full px-4 py-3 rounded-lg bg-gray-800 border border-gray-700 focus:border-gray-500 focus:outline-none text-white">
                    </div>
                    
                    <div>
                        <label class="luxury-text block text-sm font-medium mb-2">Email</label>
                        <input type="email" name="email" value="<%= user.getEmail() %>" 
                               class="w-full px-4 py-3 rounded-lg bg-gray-800 border border-gray-700 focus:border-gray-500 focus:outline-none text-white">
                    </div>
                    
                    <div>
                        <label class="luxury-text block text-sm font-medium mb-2">Phone</label>
                        <input type="tel" name="phone_number" value="<%= user.getPhone_number() %>" 
                               class="w-full px-4 py-3 rounded-lg bg-gray-800 border border-gray-700 focus:border-gray-500 focus:outline-none text-white">
                    </div>
                    
                    <div class="flex justify-end gap-4 pt-6">
                        <a href="userDashboard" class="luxury-btn px-6 py-2.5 rounded-lg">Cancel</a>
                        <button type="submit" class="luxury-btn px-6 py-2.5 rounded-lg hover:bg-gray-700">Save Changes</button>
                    </div>
                </div>
            </form>
        <% } else { %>
            <div class="space-y-6">
                <div class="flex justify-between items-center border-b border-gray-700 pb-4">
                    <span class="luxury-text">First Name</span>
                    <span class="luxury-text font-medium"><%= user.getFirst_name() %></span>
                </div>
                
                <div class="flex justify-between items-center border-b border-gray-700 pb-4">
                    <span class="luxury-text">Last Name</span>
                    <span class="luxury-text font-medium"><%= user.getLast_name() %></span>
                </div>
                
                <div class="flex justify-between items-center border-b border-gray-700 pb-4">
                    <span class="luxury-text">Email</span>
                    <span class="luxury-text font-medium"><%= user.getEmail() %></span>
                </div>
                
                <div class="flex justify-between items-center border-b border-gray-700 pb-4">
                    <span class="luxury-text">Phone</span>
                    <span class="luxury-text font-medium"><%= user.getPhone_number() %></span>
                </div>
                
                <div class="flex justify-center pt-8">
                    <a href="userDashboard?mode=edit" class="luxury-btn px-8 py-3 rounded-lg transform transition hover:scale-105">
                        Edit Profile
                    </a>
                </div>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>