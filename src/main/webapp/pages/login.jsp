<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Motors - Login</title>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    
    <!-- Custom Tailwind Config -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        'dm-sans': ['DM Sans', 'sans-serif'],
                        'space-grotesk': ['Space Grotesk', 'sans-serif'],
                        'italiana': ['Italiana', 'serif'],
                        'cinzel': ['Cinzel', 'serif'],
                        'playfair': ['Playfair', 'serif'],
                        'poppins': ['Poppins', 'sans-serif'],
                        'roboto-flex': ['Roboto Flex', 'sans-serif']
                    },
                    colors: {
                        'luxury-gold': '#D4AF37',
                        'carbon-black': '#1A1A1A',
                        'racing-red': '#FF0000',
                        'metallic-silver': '#C0C0C0',
                        primary: '#1a1a1a',
                        secondary: '#e5e5e5',
                        accent: '#b8860b',
                    },
                    animation: {
                        'fade-in': 'fadeIn 1s ease-in',
                        'slide-up': 'slideUp 1s ease-out',
                        'float': 'float 3s ease-in-out infinite',
                        'glow': 'glow 2s ease-in-out infinite',
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: '0' },
                            '100%': { opacity: '1' }
                        },
                        slideUp: {
                            '0%': { transform: 'translateY(100px)', opacity: '0' },
                            '100%': { transform: 'translateY(0)', opacity: '1' }
                        },
                        float: {
                            '0%, 100%': { transform: 'translateY(0)' },
                            '50%': { transform: 'translateY(-10px)' }
                        },
                        glow: {
                            '0%, 100%': { boxShadow: '0 0 20px rgba(184, 134, 11, 0.2)' },
                            '50%': { boxShadow: '0 0 30px rgba(184, 134, 11, 0.4)' }
                        }
                    }
                }
            }
        }
    </script>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&family=Space+Grotesk:wght@300..700&family=Italiana&family=Cinzel:wght@400..900&family=Playfair:ital,opsz,wght@0,5..1200,300..900;1,5..1200,300..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto+Flex:opsz,wght@8..144,100..1000&display=swap" rel="stylesheet">

    <!-- Font Awesome -->
    <script src="https://kit.fontawesome.com/c3ca5c064a.js" crossorigin="anonymous"></script>

    <style>
        .glass-effect {
            background: rgba(26, 26, 26, 0.7);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(184, 134, 11, 0.1);
        }
        .modern-input {
            background: rgba(26, 26, 26, 0.5);
            border: 1px solid rgba(184, 134, 11, 0.2);
            transition: all 0.3s ease;
        }
        .modern-input:focus {
            background: rgba(26, 26, 26, 0.7);
            border-color: #b8860b;
            box-shadow: 0 0 0 2px rgba(184, 134, 11, 0.2);
        }
        .modern-button {
            background: linear-gradient(45deg, #b8860b, #d4af37);
            transition: all 0.3s ease;
        }
        .modern-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(184, 134, 11, 0.3);
        }
        .social-button {
            background: rgba(26, 26, 26, 0.5);
            border: 1px solid rgba(184, 134, 11, 0.2);
            transition: all 0.3s ease;
        }
        .social-button:hover {
            background: rgba(184, 134, 11, 0.1);
            transform: translateY(-2px);
        }
        .password-toggle {
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .password-toggle:hover {
            transform: scale(1.1);
        }
        .modern-checkbox {
            appearance: none;
            -webkit-appearance: none;
            width: 20px;
            height: 20px;
            border: 2px solid #b8860b;
            border-radius: 4px;
            background-color: transparent;
            cursor: pointer;
            position: relative;
            transition: all 0.3s ease;
        }
        .modern-checkbox:checked {
            background-color: #b8860b;
        }
        .modern-checkbox:checked::after {
            content: '✓';
            position: absolute;
            color: #1a1a1a;
            font-size: 14px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }
    </style>
</head>
<body class="bg-primary min-h-screen">
    <!-- Background Video -->
    <div class="fixed inset-0 w-full h-full overflow-hidden -z-10">
        <video autoplay loop muted class="absolute top-0 left-0 w-full h-full object-cover">
            <source src="/CollegeTutorial/vedios/new2.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
        <div class="absolute inset-0 bg-gradient-to-b from-primary/90 to-primary/40"></div>
    </div>

    <!-- Main Content -->
    <div class="min-h-screen flex items-center justify-center px-4 py-12">
        <div class="max-w-md w-full space-y-8 glass-effect p-8 rounded-2xl shadow-2xl animate-fade-in animate-glow">
            <!-- Logo -->
            <div class="text-center animate-float">
                <img src="/CollegeTutorial/images/aurelia white.png" alt="Luxury Motors Logo" class="mx-auto h-24 md:h-32">
                <h2 class="mt-6 text-3xl font-italiana text-accent tracking-widest">Welcome Back</h2>
                <p class="mt-2 text-sm text-gray-300">Enter your credentials to access your account</p>
            </div>

            <!-- Login Form -->
            <form class="mt-8 space-y-6" action="${pageContext.request.contextPath}/login" method="POST">
                <div class="rounded-md shadow-sm space-y-4">
                <% String error = request.getParameter("error"); %>
                <% if(error != null && error.equals("failed")){ %>
                	<p class="text-red-400 text-center flex items-center justify-center gap-2">
                        <i class="fas fa-exclamation-circle"></i>
                        Invalid email or password. Please try again.
                    </p>
                	<%} %>
                	

			<%-- <c:if test="${param.error == 'failed'}">
   				 <p class="text-red-400 text-center flex items-center justify-center gap-2">
        			<i class="fas fa-exclamation-circle"></i>
        			Invalid email or password. Please try again.
    			</p>
			</c:if> --%>
                	
                    <!-- Email Input -->
                    <div>
                        <label for="email" class="sr-only">Email address</label>
                        <div class="relative group">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-accent group-hover:text-white transition-colors duration-300"></i>
                            </div>
                            <input id="email" name="email" type="email" required 
                                class="modern-input appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 text-white placeholder-gray-400 focus:outline-none sm:text-sm"
                                placeholder="Email address">
                        </div>
                    </div>

                    <!-- Password Input -->
                    <div>
                        <label for="password" class="sr-only">Password</label>
                        <div class="relative group">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-accent group-hover:text-white transition-colors duration-300"></i>
                            </div>
                            <input id="password" name="password" type="password" required 
                                class="modern-input appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 pr-10 text-white placeholder-gray-400 focus:outline-none sm:text-sm"
                                placeholder="Password">
                            <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                <i class="fas fa-eye-slash text-accent password-toggle group-hover:text-white transition-colors duration-300" onclick="togglePassword()"></i>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Remember Me & Forgot Password -->
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <input id="remember-me" name="remember-me" type="checkbox" 
                            class="modern-checkbox">
                        <label for="remember-me" class="ml-2 block text-sm text-gray-300">
                            Remember me
                        </label>
                    </div>

                    <div class="text-sm">
                        <a href="#" class="font-medium text-accent hover:text-white transition-colors duration-300">
                            Forgot your password?
                        </a>
                    </div>
                </div>

                <!-- Submit Button -->
                <div>
                    <button type="submit" 
                        class="modern-button group relative w-full flex justify-center py-3 px-4 text-sm font-medium rounded-lg text-primary hover:text-white focus:outline-none">
                        <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                            <i class="fas fa-sign-in-alt text-primary group-hover:text-white transition-colors duration-300"></i>
                        </span>
                        Sign in
                    </button>
                </div>
            </form>

            <!-- Register Link -->
            <div class="text-center mt-6">
                <p class="text-sm text-gray-300">
                    Don't have an account?
                    <a href="${pageContext.request.contextPath}/register" class="font-medium text-accent hover:text-white transition-colors duration-300">
                        Register now
                    </a>
                </p>
            </div>

            <!-- Social Login -->
            
        </div>
    </div>

    <!-- Back to Home -->
    <a href="http://localhost:8080/CollegeTutorial/car" class="fixed bottom-8 right-8 text-accent hover:text-white transition-colors duration-300 transform hover:scale-110">
        <i class="fas fa-arrow-left text-2xl"></i>
    </a>

    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const toggleIcon = document.querySelector('.password-toggle');
            
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
            }
        }
    </script>
</body>
</html>