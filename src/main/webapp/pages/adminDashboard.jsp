<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Car Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary-color: #1a1a1a;
            --secondary-color: #ff6b6b;
            --accent-color: #4ecdc4;
            --success-color: #2ecc71;
            --warning-color: #f1c40f;
            --danger-color: #e74c3c;
            --info-color: #3498db;
            --dark-color: #2c3e50;
            --light-color: #ecf0f1;
            --sidebar-width: 280px;
            --glass-bg: rgba(255, 255, 255, 0.95);
            --glass-border: rgba(255, 255, 255, 0.2);
            --card-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
            --transition-speed: 0.3s;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            color: var(--primary-color);
            position: relative;
            overflow-x: hidden;
        }
        
        body::before {
            content: '';
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: 
                radial-gradient(circle at 20% 20%, rgba(184, 134, 11, 0.05) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(255, 215, 0, 0.05) 0%, transparent 50%);
            z-index: -1;
            opacity: 0.5;
        }
        
        .sidebar {
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            min-height: 100vh;
            width: var(--sidebar-width);
            position: fixed;
            left: 0;
            top: 0;
            padding: 2rem 0;
            color: var(--primary-color);
            transition: transform var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
            z-index: 1000;
            border-right: 1px solid var(--glass-border);
            box-shadow: 4px 0 20px rgba(0, 0, 0, 0.1);
        }
        
        .sidebar-header {
            padding: 0 1.5rem;
            margin-bottom: 2rem;
            text-align: center;
            position: relative;
        }
        
        .sidebar-header::after {
            content: '';
            position: absolute;
            bottom: -1rem;
            left: 50%;
            transform: translateX(-50%);
            width: 80%;
            height: 1px;
            background: linear-gradient(90deg, transparent, var(--accent-color), transparent);
        }
        
        .sidebar-header h4 {
            font-weight: 700;
            color: var(--primary-color);
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            font-size: 1.5rem;
            letter-spacing: 0.5px;
        }
        
        .sidebar-header h4 i {
            color: var(--accent-color);
            font-size: 2rem;
            filter: drop-shadow(0 0 8px rgba(255, 215, 0, 0.5));
        }
        
        .sidebar .nav-link {
            color: var(--primary-color);
            padding: 1rem 1.5rem;
            margin: 0.5rem 1rem;
            border-radius: 12px;
            transition: all var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
            display: flex;
            align-items: center;
            font-weight: 500;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            position: relative;
            overflow: hidden;
            border: 1px solid var(--glass-border);
        }
        
        .sidebar .nav-link::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background: var(--accent-color);
            transform: scaleY(0);
            transition: transform var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .sidebar .nav-link i {
            width: 25px;
            margin-right: 10px;
            font-size: 1.1rem;
            transition: transform var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .sidebar .nav-link:hover {
            background: rgba(255, 107, 107, 0.1);
            color: var(--secondary-color);
            transform: translateX(5px);
        }
        
        .sidebar .nav-link:hover::before {
            transform: scaleY(1);
        }
        
        .sidebar .nav-link:hover i {
            transform: scale(1.2);
        }
        
        .sidebar .nav-link.active {
            background: rgba(184, 134, 11, 0.15);
            color: var(--secondary-color);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-color: var(--glass-border);
        }
        
        .sidebar .nav-link.active::before {
            transform: scaleY(1);
        }
        
        .main-content {
            margin-left: var(--sidebar-width);
            padding: 2rem;
            transition: margin-left var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
            background: transparent;
            min-height: 100vh;
        }
        
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding: 1.5rem;
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            border: 1px solid var(--glass-border);
            position: relative;
            overflow: hidden;
        }
        
        .page-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(184, 134, 11, 0.1), transparent);
            animation: shimmer 3s infinite;
        }
        
        @keyframes shimmer {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }
        
        .card {
            border: none;
            border-radius: 20px;
            box-shadow: var(--card-shadow);
            margin-bottom: 2rem;
            transition: all var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            border: 1px solid var(--glass-border);
            position: relative;
            overflow: hidden;
        }
        
        .card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(184, 134, 11, 0.05), transparent);
            opacity: 0;
            transition: opacity var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 12px 40px rgba(0, 0, 0, 0.1);
        }
        
        .card:hover::before {
            opacity: 1;
        }
        
        .card-header {
            background: transparent;
            border-bottom: 1px solid var(--glass-border);
            padding: 1.5rem;
            border-radius: 20px 20px 0 0 !important;
            position: relative;
        }
        
        .card-header::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 1px;
            background: linear-gradient(90deg, transparent, var(--accent-color), transparent);
            opacity: 0.5;
        }
        
        .table {
            margin-bottom: 0;
            color: var(--primary-color);
        }
        
        .table th {
            border-top: none;
            background: rgba(255, 255, 255, 0.8);
            font-weight: 600;
            color: var(--secondary-color);
            padding: 1rem;
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 1px;
        }
        
        .table td {
            padding: 1rem;
            vertical-align: middle;
            border-color: rgba(255, 107, 107, 0.1);
        }
        
        .table tbody tr:hover td {
            background: rgba(184, 134, 11, 0.05);
        }
        
        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            font-weight: 600;
            transition: all var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
            border: none;
            letter-spacing: 0.5px;
            position: relative;
            overflow: hidden;
        }
        
        .btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: translateX(-100%);
            transition: transform var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .btn:hover::before {
            transform: translateX(100%);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, var(--secondary-color), #ff8e8e);
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.2);
        }
        
        .btn-primary:hover {
            background: linear-gradient(135deg, #ff8e8e, var(--secondary-color));
            transform: translateY(-2px);
        }
        
        .btn-danger {
            background: linear-gradient(135deg, var(--danger-color), #c0392b);
            box-shadow: 0 4px 15px rgba(231, 76, 60, 0.1);
        }
        
        .btn-danger:hover {
            background: linear-gradient(135deg, #c0392b, var(--danger-color));
            transform: translateY(-2px);
        }
        
        .badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: 600;
            backdrop-filter: blur(5px);
            text-transform: uppercase;
            font-size: 0.7rem;
            letter-spacing: 1px;
        }
        
        .badge.bg-success {
            background: linear-gradient(135deg, var(--success-color), #27ae60) !important;
            box-shadow: 0 4px 15px rgba(46, 204, 113, 0.2);
        }
        
        .badge.bg-warning {
            background: linear-gradient(135deg, var(--warning-color), #f39c12) !important;
            box-shadow: 0 4px 15px rgba(241, 196, 15, 0.2);
        }
        
        .action-buttons .btn {
            padding: 0.5rem;
            width: 35px;
            height: 35px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            margin: 0 0.25rem;
        }
        
        /* Edit Modal Styles */
        .modal-content {
            border-radius: 20px;
            border: none;
            background: var(--glass-bg);
            backdrop-filter: blur(20px);
            border: 1px solid var(--glass-border);
            color: var(--primary-color);
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
        }
        
        .modal-header {
            background: rgba(255, 255, 255, 0.95);
            color: var(--secondary-color);
            border-radius: 20px 20px 0 0;
            padding: 1.5rem;
            border-bottom: 1px solid var(--glass-border);
        }
        
        .modal-body {
            padding: 2rem;
        }
        
        .form-control {
            border-radius: 12px;
            padding: 0.75rem 1rem;
            background: rgba(255, 255, 255, 0.8);
            border: 1px solid var(--glass-border);
            color: var(--primary-color);
            transition: all var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .form-control:focus {
            background: rgba(255, 255, 255, 0.9);
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(255, 107, 107, 0.1);
        }
        
        .form-label {
            font-weight: 600;
            color: var(--secondary-color);
            text-transform: uppercase;
            font-size: 0.8rem;
            letter-spacing: 1px;
            margin-bottom: 0.5rem;
        }
        
        /* Menu Toggle and Close Button Styles */
        .menu-toggle {
            display: none;
            position: fixed;
            top: 1.5rem;
            left: 1.5rem;
            z-index: 1001;
            background: var(--glass-bg);
            backdrop-filter: blur(5px);
            border: 1px solid var(--glass-border);
            color: var(--secondary-color);
            width: 45px;
            height: 45px;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
            align-items: center;
            justify-content: center;
        }
        
        .menu-toggle:hover {
            background: rgba(255, 107, 107, 0.1);
            transform: scale(1.1) rotate(90deg);
        }
        
        .menu-toggle i {
            font-size: 1.2rem;
            transition: transform var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .close-sidebar {
            display: none;
            position: absolute;
            top: 1.5rem;
            right: 1.5rem;
            background: var(--glass-bg);
            backdrop-filter: blur(5px);
            border: 1px solid var(--glass-border);
            color: var(--secondary-color);
            font-size: 1.2rem;
            cursor: pointer;
            z-index: 1001;
            transition: all var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
            width: 45px;
            height: 45px;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }
        
        .close-sidebar:hover {
            transform: rotate(90deg);
            background: rgba(255, 107, 107, 0.1);
        }
        
        .sidebar-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(5px);
            z-index: 999;
            transition: opacity var(--transition-speed) cubic-bezier(0.4, 0, 0.2, 1);
        }
        
        .sidebar-overlay.active {
            display: block;
        }
        
        /* Responsive Styles */
        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
                width: 280px;
                position: fixed;
                z-index: 1000;
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
                padding: 1rem;
                width: 100%;
                position: relative;
                z-index: 1;
            }
            
            .menu-toggle, .close-sidebar {
                display: flex;
            }
            
            .sidebar-overlay.active {
                display: block;
            }
            
            .page-header {
                margin-top: 4rem;
            }
        }
        
        @media (min-width: 993px) {
            .sidebar {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: var(--sidebar-width);
            }
            
            .menu-toggle, .close-sidebar {
                display: none;
            }
        }
        
        /* Fix for content overflow */
        .container-fluid {
            position: relative;
            width: 100%;
            overflow-x: hidden;
        }
        
        .row {
            margin: 0;
            width: 100%;
        }
        
        /* Fix for table responsiveness */
        .table-responsive {
            overflow-x: auto;
            -webkit-overflow-scrolling: touch;
        }
        
        /* Fix for modal positioning */
        .modal {
            backdrop-filter: blur(5px);
        }
        
        .modal-dialog {
            margin: 1.75rem auto;
        }
        
        @media (max-width: 576px) {
            .sidebar {
                width: 100%;
                padding: 1rem 0;
                position: fixed;
                z-index: 1000;
            }
            
            .sidebar-header {
                padding: 0 1rem;
                margin-bottom: 1rem;
            }
            
            .sidebar-header h4 {
                font-size: 1.2rem;
            }
            
            .sidebar .nav-link {
                padding: 0.75rem 1rem;
                margin: 0.25rem 0.5rem;
                font-size: 0.9rem;
            }
            
            .main-content {
                padding: 0.75rem;
                margin-top: 3.5rem;
                width: 100%;
                position: relative;
                z-index: 1;
            }
            
            .page-header {
                padding: 1rem;
                margin-top: 0;
                flex-direction: column;
                gap: 0.75rem;
            }
            
            .page-header h2 {
                font-size: 1.3rem;
                text-align: center;
            }
            
            .page-header .btn {
                width: 100%;
            }
            
            .card {
                margin-bottom: 1rem;
            }
            
            .card-header {
                padding: 1rem;
            }
            
            .card-header h5 {
                font-size: 1rem;
            }
            
            .table-responsive {
                margin: 0 -0.75rem;
                padding: 0 0.75rem;
            }
            
            .table th {
                font-size: 0.7rem;
                padding: 0.5rem;
                white-space: nowrap;
            }
            
            .table td {
                font-size: 0.8rem;
                padding: 0.5rem;
            }
            
            .action-buttons {
                display: flex;
                flex-direction: column;
                gap: 0.25rem;
            }
            
            .action-buttons .btn {
                width: 100%;
                height: auto;
                padding: 0.5rem;
                margin: 0;
            }
            
            .badge {
                padding: 0.25rem 0.5rem;
                font-size: 0.6rem;
            }
            
            .modal-dialog {
                margin: 0.5rem;
                max-width: calc(100% - 1rem);
            }
            
            .modal-body {
                padding: 1rem;
            }
            
            .form-label {
                font-size: 0.7rem;
            }
            
            .form-control {
                padding: 0.5rem;
                font-size: 0.9rem;
            }
            
            .menu-toggle, .close-sidebar {
                width: 40px;
                height: 40px;
                top: 1rem;
                z-index: 1001;
            }
            
            .menu-toggle {
                left: 1rem;
            }
            
            .close-sidebar {
                right: 1rem;
            }
        }
        
        @media (max-width: 400px) {
            .sidebar-header h4 i {
                font-size: 1.2rem;
            }
            
            .sidebar .nav-link i {
                font-size: 0.9rem;
                width: 20px;
            }
            
            .page-header {
                margin-top: 3rem;
            }
            
            .table th, .table td {
                font-size: 0.65rem;
            }
            
            .modal-dialog {
                margin: 0.25rem;
                max-width: calc(100% - 0.5rem);
            }
            
            .form-control {
                font-size: 0.8rem;
            }
        }
        
        /* Landscape mode adjustments */
        @media (max-height: 600px) and (orientation: landscape) {
            .sidebar {
                overflow-y: auto;
            }
            
            .sidebar-header {
                margin-bottom: 1rem;
            }
            
            .sidebar .nav-link {
                padding: 0.5rem 1rem;
                margin: 0.25rem 0.5rem;
            }
            
            .page-header {
                padding: 0.75rem;
            }
            
            .card {
                margin-bottom: 1rem;
            }
        }
        
        /* High DPI screens */
        @media (-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {
            .sidebar {
                backdrop-filter: blur(30px);
            }
            
            .card {
                backdrop-filter: blur(30px);
            }
            
            .modal-content {
                backdrop-filter: blur(30px);
            }
        }
        
        /* Print styles */
        @media print {
            .sidebar, .menu-toggle, .close-sidebar, .sidebar-overlay {
                display: none !important;
            }
            
            .main-content {
                margin-left: 0 !important;
                padding: 0 !important;
            }
            
            .card {
                box-shadow: none !important;
                border: 1px solid #ddd !important;
            }
            
            .btn {
                display: none !important;
            }
            
            .table {
                border: 1px solid #ddd;
            }
            
            .table th, .table td {
                border: 1px solid #ddd;
            }
        }
        
        /* Fix for iOS Safari */
        @supports (-webkit-touch-callout: none) {
            .sidebar {
                -webkit-overflow-scrolling: touch;
            }
            
            .table-responsive {
                -webkit-overflow-scrolling: touch;
            }
        }
        
        /* Fix for Android Chrome */
        @media screen and (-webkit-min-device-pixel-ratio: 0) {
            .sidebar {
                transform: translateZ(0);
            }
            
            .table-responsive {
                transform: translateZ(0);
            }
        }
        
        /* Fix for Edge */
        @supports (-ms-ime-align: auto) {
            .sidebar {
                transform: none;
            }
        }
        
        /* Fix for Firefox */
        @-moz-document url-prefix() {
            .sidebar {
                transform: none;
            }
        }
    </style>
</head>
<body>
    <div class="loading-spinner"></div>
    <div class="decorative-line decorative-line-1"></div>
    <div class="decorative-line decorative-line-2"></div>
    <div class="decorative-line decorative-line-3"></div>
    
    <button class="menu-toggle" id="menuToggle">
        <i class="fas fa-bars"></i>
    </button>
    
    <div class="sidebar-overlay" id="sidebarOverlay"></div>
    
    <div class="container-fluid p-0">
        <div class="row g-0">
            <!-- Sidebar -->
            <div class="sidebar">
                <button class="close-sidebar" id="closeSidebar">
                    <i class="fas fa-times"></i>
                </button>
                <div class="sidebar-header">
                    <h4><i class="fas fa-car-side"></i> Car Admin Dashboard</h4>
                </div>
                <ul class="nav flex-column">
                    <li class="nav-item">
                        <a class="nav-link active" href="#">
                            <i class="fas fa-tachometer-alt"></i> Dashboard
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-users"></i> User Management
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-car"></i> Car Inventory
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-shopping-cart"></i> Orders
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">
                            <i class="fas fa-cog"></i> Settings
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <div class="page-header">
                    <h2 class="mb-0"><i class="fas fa-users me-2"></i>User Management</h2>
                    <button class="btn btn-primary">
                        <i class="fas fa-plus me-2"></i> Add New User
                    </button>
                </div>

                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0"><i class="fas fa-list me-2"></i>Users List</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th>Status</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>John</td>
                                        <td>Doe</td>
                                        <td>john@example.com</td>
                                        <td>+1 234-567-8901</td>
                                        <td>Admin</td>
                                        <td><span class="badge bg-success">Active</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-primary me-1" data-bs-toggle="modal" data-bs-target="#editUserModal" data-user-id="1">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>2</td>
                                        <td>Jane</td>
                                        <td>Smith</td>
                                        <td>jane@example.com</td>
                                        <td>+1 234-567-8902</td>
                                        <td>User</td>
                                        <td><span class="badge bg-warning">Pending</span></td>
                                        <td class="action-buttons">
                                            <button class="btn btn-sm btn-primary me-1" data-bs-toggle="modal" data-bs-target="#editUserModal" data-user-id="2">
                                                <i class="fas fa-edit"></i>
                                            </button>
                                            <button class="btn btn-sm btn-danger">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit User Modal -->
    <div class="modal fade" id="editUserModal" tabindex="-1" aria-labelledby="editUserModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editUserModalLabel"><i class="fas fa-edit me-2"></i>Edit User</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="editUserForm">
                        <input type="hidden" id="userId" name="userId">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="firstName" class="form-label">First Name</label>
                                <input type="text" class="form-control" id="firstName" name="firstName" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="lastName" class="form-label">Last Name</label>
                                <input type="text" class="form-control" id="lastName" name="lastName" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="userEmail" class="form-label">Email</label>
                            <input type="email" class="form-control" id="userEmail" name="userEmail" required>
                        </div>
                        <div class="mb-3">
                            <label for="phoneNumber" class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" id="phoneNumber" name="phoneNumber" required>
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <div class="input-group">
                                <input type="password" class="form-control" id="password" name="password">
                                <button class="btn btn-outline-secondary" type="button" id="togglePassword">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                            <small class="text-muted">Leave blank to keep current password</small>
                        </div>
                        <div class="mb-3">
                            <label for="userRole" class="form-label">Role</label>
                            <select class="form-control" id="userRole" name="userRole" required>
                                <option value="Admin">Admin</option>
                                <option value="User">User</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="userStatus" class="form-label">Status</label>
                            <select class="form-control" id="userStatus" name="userStatus" required>
                                <option value="Active">Active</option>
                                <option value="Pending">Pending</option>
                                <option value="Inactive">Inactive</option>
                            </select>
                        </div>
                        <div class="text-end">
                            <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const sidebar = document.querySelector('.sidebar');
            const menuToggle = document.getElementById('menuToggle');
            const closeSidebar = document.getElementById('closeSidebar');
            const sidebarOverlay = document.getElementById('sidebarOverlay');
            const mainContent = document.querySelector('.main-content');
            const editUserModal = document.getElementById('editUserModal');
            const loadingSpinner = document.querySelector('.loading-spinner');
            
            function toggleSidebar() {
                sidebar.classList.toggle('active');
                sidebarOverlay.classList.toggle('active');
                document.body.classList.toggle('sidebar-open');
                
                // Prevent scrolling when sidebar is open on mobile
                if (window.innerWidth <= 576) {
                    document.body.style.position = sidebar.classList.contains('active') ? 'fixed' : '';
                }
            }
            
            function handleResize() {
                if (window.innerWidth > 992) {
                    sidebar.classList.remove('active');
                    sidebarOverlay.classList.remove('active');
                    document.body.classList.remove('sidebar-open');
                    document.body.style.position = '';
                }
            }
            
            // Improved touch handling for mobile
            let touchStartX = 0;
            let touchEndX = 0;
            
            document.addEventListener('touchstart', function(e) {
                touchStartX = e.changedTouches[0].screenX;
            }, false);
            
            document.addEventListener('touchend', function(e) {
                touchEndX = e.changedTouches[0].screenX;
                handleSwipe();
            }, false);
            
            function handleSwipe() {
                if (window.innerWidth <= 576) {
                    if (touchEndX < touchStartX && !sidebar.classList.contains('active')) {
                        toggleSidebar();
                    } else if (touchEndX > touchStartX && sidebar.classList.contains('active')) {
                        toggleSidebar();
                    }
                }
            }
            
            menuToggle.addEventListener('click', toggleSidebar);
            closeSidebar.addEventListener('click', toggleSidebar);
            sidebarOverlay.addEventListener('click', toggleSidebar);
            
            // Add click event to sidebar items
            document.querySelectorAll('.sidebar .nav-link').forEach(link => {
                link.addEventListener('click', function() {
                    if (window.innerWidth <= 992) {
                        toggleSidebar();
                    }
                });
            });
            
            // Handle window resize
            window.addEventListener('resize', handleResize);
            
            // Initialize sidebar state
            handleResize();
            
            // Fix for iOS Safari bounce effect
            document.body.addEventListener('touchmove', function(e) {
                if (sidebar.classList.contains('active')) {
                    e.preventDefault();
                }
            }, { passive: false });
            
            // Handle edit modal
            editUserModal.addEventListener('show.bs.modal', function(event) {
                const button = event.relatedTarget;
                const userId = button.getAttribute('data-user-id');
                const row = button.closest('tr');
                
                // Populate form with user data
                document.getElementById('userId').value = userId;
                document.getElementById('firstName').value = row.cells[1].textContent;
                document.getElementById('lastName').value = row.cells[2].textContent;
                document.getElementById('userEmail').value = row.cells[3].textContent;
                document.getElementById('phoneNumber').value = row.cells[4].textContent;
                document.getElementById('userRole').value = row.cells[5].textContent;
                document.getElementById('userStatus').value = row.cells[6].querySelector('.badge').textContent.trim();
            });
            
            // Handle form submission
            document.getElementById('editUserForm').addEventListener('submit', function(e) {
                e.preventDefault();
                loadingSpinner.style.display = 'block';
                
                // Simulate API call
                setTimeout(() => {
                    loadingSpinner.style.display = 'none';
                    const modal = bootstrap.Modal.getInstance(editUserModal);
                    modal.hide();
                }, 1500);
            });
            
            // Toggle password visibility
            const togglePassword = document.getElementById('togglePassword');
            const password = document.getElementById('password');
            
            togglePassword.addEventListener('click', function() {
                const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
                password.setAttribute('type', type);
                this.querySelector('i').classList.toggle('fa-eye');
                this.querySelector('i').classList.toggle('fa-eye-slash');
            });
            
            // Add hover effect to table rows
            document.querySelectorAll('.table tbody tr').forEach(row => {
                row.addEventListener('mouseenter', function() {
                    if (window.innerWidth > 576) {
                        this.style.transform = 'scale(1.01)';
                        this.style.transition = 'transform 0.3s ease';
                    }
                });
                
                row.addEventListener('mouseleave', function() {
                    this.style.transform = 'scale(1)';
                });
            });
        });
    </script>
</body>
</html> 