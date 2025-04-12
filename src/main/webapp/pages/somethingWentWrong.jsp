<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Something Went Wrong</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .error-container {
            background: linear-gradient(135deg, rgba(0,0,0,0.9) 0%, rgba(0,0,0,0.7) 100%);
            backdrop-filter: blur(10px);
        }
        .error-icon {
            animation: float 3s ease-in-out infinite;
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-20px); }
            100% { transform: translateY(0px); }
        }
        .error-button {
            position: relative;
            overflow: hidden;
        }
        .error-button::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: #ffd700;
            transform: translateX(-100%);
            transition: transform 0.3s ease;
        }
        .error-button:hover::after {
            transform: translateX(0);
        }
    </style>
</head>
<body class="min-h-screen bg-black text-white">
    <!-- Include Navbar -->
  

    <!-- Main Content -->
    <main class="min-h-screen flex items-center justify-center px-4 sm:px-6 lg:px-8">
        <div class="error-container max-w-2xl w-full p-8 sm:p-12 rounded-lg shadow-2xl">
            <div class="text-center">
                <div class="error-icon mb-8">
                    <i class="fas fa-exclamation-triangle text-6xl sm:text-7xl text-yellow-500"></i>
                </div>
                <h1 class="text-4xl sm:text-5xl font-bold mb-4 font-playfair">Oops! Something Went Wrong</h1>
                <p class="text-lg sm:text-xl text-gray-300 mb-8">
                    We apologize for the inconvenience. Our team has been notified and is working to fix the issue.
                </p>
                <div class="space-y-4 sm:space-y-0 sm:space-x-4">
                    <a href="${pageContext.request.contextPath}/car" 
                       class="error-button inline-block px-6 py-3 bg-yellow-500 text-black font-semibold rounded-lg hover:bg-yellow-400 transition-colors duration-300">
                        <i class="fas fa-home mr-2"></i>Return Home
                    </a>
                    <a href="${pageContext.request.contextPath}/store" 
                       class="error-button inline-block px-6 py-3 border border-yellow-500 text-yellow-500 font-semibold rounded-lg hover:bg-yellow-500/10 transition-colors duration-300">
                        <i class="fas fa-arrow-left mr-2"></i>Go to Store
                    </a>
                </div>
            </div>
        </div>
    </main>

    

    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        'playfair': ['Playfair Display', 'serif'],
                    },
                }
            }
        }
    </script>
    
</body>
</html>