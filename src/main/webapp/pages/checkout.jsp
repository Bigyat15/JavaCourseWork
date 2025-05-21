<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thank You</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#ffd700',
                        secondary: '#1a1a1a',
                        accent: '#ff4d4d',
                    },
                    fontFamily: {
                        'playfair': ['Playfair Display', 'serif'],
                        'poppins': ['Poppins', 'sans-serif'],
                    },
                }
            }
        }
    </script>
</head>
<body class="bg-black text-white font-poppins min-h-screen flex flex-col items-center justify-center">
    <div class="text-center p-8 max-w-2xl mx-auto">
        <h1 class="text-3xl sm:text-4xl md:text-5xl font-bold mb-6 text-primary">Thank You for Shopping!</h1>
        <p class="text-lg sm:text-xl mb-8">Your order has been received. We appreciate your business!</p>
        <a href="${pageContext.request.contextPath}/store" 
           class="inline-block px-8 py-3 bg-primary text-black font-bold uppercase tracking-wider hover:bg-white transition-colors">
           Continue Shopping
        </a>
    </div>
</body>
</html>