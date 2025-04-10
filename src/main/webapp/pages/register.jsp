<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Motors - Register</title>
    
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
                        'pulse-slow': 'pulse 4s cubic-bezier(0.4, 0, 0.6, 1) infinite',
                        'bounce-slow': 'bounce 3s infinite',
                        'spin-slow': 'spin 3s linear infinite',
                        'shimmer': 'shimmer 2s infinite',
                        'wave': 'wave 2s ease-in-out infinite',
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
                        },
                        shimmer: {
                            '0%': { backgroundPosition: '-1000px 0' },
                            '100%': { backgroundPosition: '1000px 0' }
                        },
                        wave: {
                            '0%, 100%': { transform: 'rotate(0deg)' },
                            '25%': { transform: 'rotate(-5deg)' },
                            '75%': { transform: 'rotate(5deg)' }
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
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }
        .modern-input {
            background: rgba(26, 26, 26, 0.5);
            border: 1px solid rgba(184, 134, 11, 0.2);
            transition: all 0.3s ease;
            backdrop-filter: blur(5px);
            -webkit-backdrop-filter: blur(5px);
        }
        .modern-input:focus {
            background: rgba(26, 26, 26, 0.7);
            border-color: #b8860b;
            box-shadow: 0 0 0 2px rgba(184, 134, 11, 0.2);
            transform: translateY(-2px);
        }
        .modern-button {
            background: linear-gradient(45deg, #b8860b, #d4af37);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .modern-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: 0.5s;
        }
        .modern-button:hover::before {
            left: 100%;
        }
        .modern-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(184, 134, 11, 0.3);
        }
        .form-group {
            position: relative;
            margin-bottom: 1.5rem;
            animation: slideUp 0.5s ease-out forwards;
            opacity: 0;
            transform-origin: bottom;
            min-height: 60px;
        }
        .form-group.md\:col-span-2 {
            margin-bottom: 2rem;
        }
        .form-group:hover {
            transform: scale(1.02);
        }
        .form-group:nth-child(1) { animation-delay: 0.1s; }
        .form-group:nth-child(2) { animation-delay: 0.2s; }
        .form-group:nth-child(3) { animation-delay: 0.3s; }
        .form-group:nth-child(4) { animation-delay: 0.4s; }
        .form-group:nth-child(5) { animation-delay: 0.5s; }
        .form-group:nth-child(6) { animation-delay: 0.6s; }
        .form-group:nth-child(7) { animation-delay: 0.7s; }
        
        .input-icon {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: #b8860b;
            transition: all 0.3s ease;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
        }
        
        .input-label {
            position: absolute;
            left: 3.5rem;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.7);
            transition: all 0.3s ease;
            pointer-events: none;
        }
        
        .modern-input:focus + .input-label,
        .modern-input:not(:placeholder-shown) + .input-label {
            top: 0;
            left: 1rem;
            font-size: 0.75rem;
            color: #b8860b;
            background: rgba(26, 26, 26, 0.9);
            padding: 0 0.5rem;
            border-radius: 0.25rem;
        }
        
        .password-toggle {
            position: absolute;
            right: 1rem;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #b8860b;
            transition: all 0.3s ease;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            z-index: 10;
        }
        
        .password-toggle:hover {
            transform: translateY(-50%) scale(1.1);
            color: #d4af37;
        }
        
        .progress-bar {
            position: absolute;
            bottom: -1.25rem;
            left: 0;
            width: 100%;
            height: 4px;
            background: rgba(184, 134, 11, 0.2);
            border-radius: 2px;
            overflow: hidden;
        }
        
        .progress-bar-fill {
            height: 100%;
            background: #b8860b;
            transition: width 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        
        .progress-bar-fill::after {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            animation: shimmer 2s infinite;
        }
        
        .password-strength {
            font-size: 0.75rem;
            color: rgba(255, 255, 255, 0.7);
            margin-top: 0.25rem;
            transition: all 0.3s ease;
            position: absolute;
            bottom: -1.25rem;
            left: 0;
            width: 100%;
        }

        .modern-checkbox {
            appearance: none;
            width: 20px;
            height: 20px;
            border: 2px solid #b8860b;
            border-radius: 4px;
            background: rgba(26, 26, 26, 0.5);
            cursor: pointer;
            position: relative;
            transition: all 0.3s ease;
        }

        .modern-checkbox:checked {
            background: #b8860b;
        }

        .modern-checkbox:checked::after {
            content: '✓';
            position: absolute;
            color: white;
            font-size: 14px;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
        }

        @media (max-width: 640px) {
            .glass-effect {
                margin: 1rem;
                padding: 1.5rem;
            }
            .form-group {
                margin-bottom: 1rem;
            }
            .input-icon {
                left: 0.75rem;
                width: 18px;
                height: 18px;
                font-size: 0.9rem;
            }
            .input-label {
                left: 3rem;
            }
        }

        @media (max-width: 480px) {
            .glass-effect {
                margin: 0.5rem;
                padding: 1rem;
            }
            .modern-input {
                padding-left: 2.5rem;
            }
            .input-icon {
                left: 0.75rem;
                width: 16px;
                height: 16px;
                font-size: 0.8rem;
            }
            .input-label {
                left: 2.75rem;
            }
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
        <div class="max-w-2xl w-full glass-effect p-8 rounded-2xl shadow-2xl animate-fade-in animate-glow">
            <!-- Logo and Title -->
            <div class="text-center mb-8">
                <img src="/CollegeTutorial/images/aurelia white.png" alt="Luxury Motors Logo" class="mx-auto h-24 md:h-32">
                <h2 class="mt-6 text-3xl font-italiana text-accent tracking-widest">Join Luxury Motors</h2>
                <p class="mt-2 text-sm text-gray-300">Create your account to access exclusive features</p>
            </div>

            <!-- Registration Form -->
            <form class="space-y-6" action="${pageContext.request.contextPath}/register" method="POST">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- First Name -->
                    <div class="form-group">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" id="first_name" name="first_name" required 
                            class="modern-input appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 text-white placeholder-transparent"
                            placeholder="First Name">
                        <label for="first_name" class="input-label">First Name</label>
                    </div>

                    <!-- Last Name -->
                    <div class="form-group">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" id="last_name" name="last_name" required 
                            class="modern-input appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 text-white placeholder-transparent"
                            placeholder="Last Name">
                        <label for="last_name" class="input-label">Last Name</label>
                    </div>

                    <!-- Date of Birth -->
                    <div class="form-group">
                        <i class="fas fa-calendar input-icon"></i>
                        <input type="date" id="dob" name="dob" required 
                            class="modern-input appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 text-white placeholder-transparent"
                            placeholder="Date of Birth">
                        <label for="dob" class="input-label">Date of Birth</label>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <i class="fas fa-envelope input-icon"></i>
                        <input type="email" id="email" name="email" required 
                            class="modern-input appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 text-white placeholder-transparent"
                            placeholder="Email">
                        <label for="email" class="input-label">Email</label>
                    </div>

                    <!-- Phone Number -->
                    <div class="form-group">
                        <i class="fas fa-phone input-icon"></i>
                        <input type="tel" id="phone_number" name="phone_number" required 
                            class="modern-input appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 text-white placeholder-transparent"
                            placeholder="Phone Number">
                        <label for="phone_number" class="input-label">Phone Number</label>
                    </div>

                    <!-- Password -->
                    <div class="form-group md:col-span-2">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" id="password" name="password" required 
                            class="modern-input appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 pr-10 text-white placeholder-transparent"
                            placeholder="Password" onkeyup="checkPasswordStrength(this.value)">
                        <label for="password" class="input-label">Password</label>
                        <i class="fas fa-eye-slash password-toggle" onclick="togglePassword('password')"></i>
                        <div class="progress-bar">
                            <div id="password-strength-bar" class="progress-bar-fill" style="width: 0%"></div>
                        </div>
                        <div id="password-strength-text" class="password-strength">Password Strength</div>
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group md:col-span-2">
                        <i class="fas fa-lock input-icon"></i>
                        <input type="password" id="confirm_password" name="confirm_password" required 
                            class="modern-input appearance-none rounded-lg relative block w-full px-3 py-3 pl-10 pr-10 text-white placeholder-transparent"
                            placeholder="Confirm Password" onkeyup="checkPasswordMatch()">
                        <label for="confirm_password" class="input-label">Confirm Password</label>
                        <i class="fas fa-eye-slash password-toggle" onclick="togglePassword('confirm_password')"></i>
                        <div id="password-match-text" class="password-strength"></div>
                    </div>
                </div>

                <!-- Terms and Conditions -->
                <div class="flex items-center mt-6">
                    <input type="checkbox" id="terms" name="terms" required 
                        class="modern-checkbox">
                    <label for="terms" class="ml-2 text-sm text-gray-300">
                        I agree to the <a href="#" class="text-accent hover:text-white transition-colors duration-300">Terms and Conditions</a>
                    </label>
                </div>

                <!-- Submit Button -->
                <div class="mt-8">
                    <button type="submit" 
                        class="modern-button group relative w-full flex justify-center py-3 px-4 text-sm font-medium rounded-lg text-primary hover:text-white focus:outline-none">
                        <span class="absolute left-0 inset-y-0 flex items-center pl-3">
                            <i class="fas fa-user-plus text-primary group-hover:text-white transition-colors duration-300"></i>
                        </span>
                        Create Account
                    </button>
                </div>
            </form>

            <!-- Login Link -->
            <div class="text-center mt-6">
                <p class="text-sm text-gray-300">
                    Already have an account?
                    <a href="login.jsp" class="font-medium text-accent hover:text-white transition-colors duration-300">
                        Sign in
                    </a>
                </p>
            </div>
        </div>
    </div>

    <!-- Back to Home -->
    <a href="http://localhost:8080/CollegeTutorial/car" class="fixed bottom-8 right-8 text-accent hover:text-white transition-colors duration-300 transform hover:scale-110">
        <i class="fas fa-arrow-left text-2xl"></i>
    </a>

    <script>
        function togglePassword(fieldId) {
            const passwordInput = document.getElementById(fieldId);
            const toggleIcon = passwordInput.nextElementSibling;
            
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

        function checkPasswordMatch() {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirm_password').value;
            const matchText = document.getElementById('password-match-text');
            
            if (confirmPassword === '') {
                matchText.textContent = '';
                matchText.style.color = 'rgba(255, 255, 255, 0.7)';
            } else if (password === confirmPassword) {
                matchText.textContent = 'Passwords match';
                matchText.style.color = '#00C851';
            } else {
                matchText.textContent = 'Passwords do not match';
                matchText.style.color = '#ff4444';
            }
        }

        function checkPasswordStrength(password) {
            const strengthBar = document.getElementById('password-strength-bar');
            const strengthText = document.getElementById('password-strength-text');
            const confirmPassword = document.getElementById('confirm_password');
            
            let strength = 0;
            let text = '';
            
            if (password.length >= 8) strength += 25;
            if (password.match(/[a-z]+/)) strength += 25;
            if (password.match(/[A-Z]+/)) strength += 25;
            if (password.match(/[0-9]+/)) strength += 25;
            
            strengthBar.style.width = strength + '%';
            
            if (strength < 25) {
                text = 'Very Weak';
                strengthBar.style.background = '#ff4444';
            } else if (strength < 50) {
                text = 'Weak';
                strengthBar.style.background = '#ffbb33';
            } else if (strength < 75) {
                text = 'Medium';
                strengthBar.style.background = '#00C851';
            } else {
                text = 'Strong';
                strengthBar.style.background = '#007E33';
            }
            
            strengthText.textContent = text;
            
            // Check password match if confirm password is not empty
            if (confirmPassword.value !== '') {
                checkPasswordMatch();
            }
        }

        // Animate form groups on load
        document.addEventListener('DOMContentLoaded', () => {
            const formGroups = document.querySelectorAll('.form-group');
            formGroups.forEach(group => {
                group.style.opacity = '1';
            });
        });
    </script>
</body>
</html> 