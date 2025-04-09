<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Motors - Login</title>
    
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
                    },
                    keyframes: {
                        fadeIn: {
                            '0%': { opacity: '0' },
                            '100%': { opacity: '1' }
                        },
                        slideUp: {
                            '0%': { transform: 'translateY(100px)', opacity: '0' },
                            '100%': { transform: 'translateY(0)', opacity: '1' }
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
        .elegant-border {
            position: relative;
        }
        .elegant-border::after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 0;
            height: 1px;
            background: #b8860b;
            transition: width 0.3s ease;
        }
        .elegant-border:hover::after {
            width: 100%;
        }
        .input-focus:focus {
            border-color: #b8860b;
            box-shadow: 0 0 0 1px #b8860b;
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
        <div class="max-w-md w-full space-y-8 bg-primary/80 backdrop-blur-sm p-8 rounded-2xl border border-accent/20 shadow-2xl animate-fade-in">
            <!-- Logo -->
            <div class="text-center">
                <img src="/CollegeTutorial/images/aurelia white.png" alt="Luxury Motors Logo" class="mx-auto h-24 md:h-32">
                <h2 class="mt-6 text-3xl font-italiana text-accent tracking-widest">Welcome Back</h2>
                <p class="mt-2 text-sm text-gray-300">Enter your credentials to access your account</p>
            </div>

            <!-- Login Form -->
            <form class="mt-8 space-y-6" action="../login" method="POST">
                <div class="rounded-md shadow-sm space-y-4">
                    <!-- Email Input -->
                    <div>
                        <label for="email" class="sr-only">Email address</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-accent"></i>
                            </div>
                            <input id="email" name="email" type="email" required 
                                class="appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 border border-accent/20 bg-primary/50 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-accent/50 focus:border-accent/50 sm:text-sm input-focus"
                                placeholder="Email address">
                        </div>
                    </div>

                    <!-- Password Input -->
                    <div>
                        <label for="password" class="sr-only">Password</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-accent"></i>
                            </div>
                            <input id="password" name="password" type="password" required 
                                class="appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 border border-accent/20 bg-primary/50 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-accent/50 focus:border-accent/50 sm:text-sm input-focus"
                                placeholder="Password">
                        </div>
                    </div>
                </div>

                <!-- Remember Me & Forgot Password -->
                <div class="flex items-center justify-between">
                    <div class="flex items-center">
                        <input id="remember-me" name="remember-me" type="checkbox" 
                            class="h-4 w-4 text-accent focus:ring-accent border-accent/20 rounded bg-primary/50">
                        <label for="remember-me" class="ml-2 block text-sm text-gray-300">
                            Remember me
                        </label>
                    </div>

                    <div class="text-sm">
                        <a href="#" class="font-medium text-accent hover:text-white transition-colors duration-300 elegant-border">
                            Forgot your password?
                        </a>
                    </div>
                </div>

                <!-- Submit Button -->
                <div>
                    <button type="submit" 
                        class="group relative w-full flex justify-center py-3 px-4 border border-accent/50 text-sm font-medium rounded-lg text-primary bg-accent hover:bg-accent/80 hover:text-white focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-accent transition-all duration-300">
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
                    <a href="#" class="font-medium text-accent hover:text-white transition-colors duration-300 elegant-border">
                        Register now
                    </a>
                </p>
            </div>

            <!-- Social Login -->
            <div class="mt-6">
                <div class="relative">
                    <div class="absolute inset-0 flex items-center">
                        <div class="w-full border-t border-accent/20"></div>
                    </div>
                    <div class="relative flex justify-center text-sm">
                        <span class="px-2 bg-primary/80 text-gray-300">Or continue with</span>
                    </div>
                </div>

                <div class="mt-6 grid grid-cols-3 gap-3">
                    <div>
                        <a href="#" class="w-full inline-flex justify-center py-2 px-4 border border-accent/20 rounded-lg shadow-sm bg-primary/50 text-sm font-medium text-gray-300 hover:bg-accent/20 hover:text-accent transition-all duration-300">
                            <i class="fab fa-google text-accent"></i>
                        </a>
                    </div>
                    <div>
                        <a href="#" class="w-full inline-flex justify-center py-2 px-4 border border-accent/20 rounded-lg shadow-sm bg-primary/50 text-sm font-medium text-gray-300 hover:bg-accent/20 hover:text-accent transition-all duration-300">
                            <i class="fab fa-facebook-f text-accent"></i>
                        </a>
                    </div>
                    <div>
                        <a href="#" class="w-full inline-flex justify-center py-2 px-4 border border-accent/20 rounded-lg shadow-sm bg-primary/50 text-sm font-medium text-gray-300 hover:bg-accent/20 hover:text-accent transition-all duration-300">
                            <i class="fab fa-apple text-accent"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Back to Home -->
    <a href="http://localhost:8080/CollegeTutorial/car" class="fixed bottom-8 right-8 text-accent hover:text-white transition-colors duration-300">
        <i class="fas fa-arrow-left text-2xl"></i>
    </a>
</body>
</html>