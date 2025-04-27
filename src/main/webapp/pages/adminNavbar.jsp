<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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

        .card-custom {
            background-color: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .card-buttons button {
            margin-right: 10px;
        }

        .edit-btn {
            background-color: #f3f4f6;
            color: #111827;
        }

        .delete-btn {
            background-color: #ef4444;
            color: white;
        }

        .add-btn {
            background-color: #10b981;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 5px;
        }

        @media (min-width: 768px) {
            .cards-container {
                display: flex;
                flex-wrap: wrap;
                gap: 20px;
            }
            .card-custom {
                width: calc(50% - 10px);
            }
        }

        @media (min-width: 1200px) {
            .card-custom {
                width: calc(33.333% - 13.333px);
            }
        }
    </style>
<body>
	<div class="sidebar">
        <h2>Admin Panel</h2>
        <a href="#user-management"><i class="fas fa-users"></i>User Management</a>
        <a href="#product-management"><i class="fas fa-car"></i>Product Management</a>
        <a href="#report-generation"><i class="fas fa-chart-line"></i>Report Generation</a>
    </div>
</body>
</html>