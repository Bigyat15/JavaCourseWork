<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.carModel" %>
<%
	ArrayList<String> carList = (ArrayList<String>) request.getAttribute("carList");
	if(carList != null && !carList.isEmpty()){
		for( carModel cl: carList ){
			
		
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lamborghini Aventador SVJ | Product Details</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        lambo: {
                            yellow: '#FFD700',
                            black: '#000000',
                            red: '#FF0000',
                            gray: '#1A1A1A'
                        }
                    }
                }
            }
        }
    </script>
    <style>
        .product-gallery {
            position: relative;
            overflow: hidden;
        }
        .main-image {
            transition: transform 0.3s ease;
        }
        .thumbnail {
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .thumbnail:hover {
            transform: scale(1.05);
        }
        .thumbnail.active {
            border: 2px solid #FFD700;
        }
        .color-option {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            transition: transform 0.3s ease;
        }
        .color-option:hover {
            transform: scale(1.1);
        }
        .color-option.active {
            border: 2px solid #FFD700;
        }
        .specs-item {
            position: relative;
            padding-left: 1.5rem;
        }
        .specs-item::before {
            content: '';
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 8px;
            height: 8px;
            background: #FFD700;
            border-radius: 50%;
        }
    </style>
</head>
<body class="bg-lambo-black text-white">
    <!-- Navigation -->
    <!-- <nav class="fixed top-0 left-0 right-0 z-50 bg-transparent transition-all duration-300">
        <div class="container mx-auto px-6 py-4">
            <div class="flex items-center justify-between">
                <div class="flex items-center space-x-8">
                    <a href="#" class="text-2xl font-bold text-lambo-yellow">LAMBORGHINI</a>
                    <div class="hidden lg:flex space-x-8">
                        <a href="#" class="text-sm uppercase tracking-wider hover:text-lambo-yellow transition-colors">Models</a>
                        <a href="#" class="text-sm uppercase tracking-wider hover:text-lambo-yellow transition-colors">Customization</a>
                        <a href="#" class="text-sm uppercase tracking-wider hover:text-lambo-yellow transition-colors">Ownership</a>
                        <a href="#" class="text-sm uppercase tracking-wider hover:text-lambo-yellow transition-colors">Dealers</a>
                    </div>
                </div>
                <div class="flex items-center space-x-6">
                    <button class="text-sm uppercase tracking-wider hover:text-lambo-yellow transition-colors">
                        <i class="fas fa-globe"></i>
                    </button>
                    <button class="text-sm uppercase tracking-wider hover:text-lambo-yellow transition-colors">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
        </div>
    </nav>
 -->
    <!-- Product Detail Section -->
    <section class="pt-32 pb-20">
        <div class="container mx-auto px-6">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
                <!-- Product Gallery -->
                <div class="product-gallery">
                    <div class="mb-4">
                        <img id="mainImage" src="<%=cl.getCar_images_id()%>" 
                             alt="Lamborghini Aventador SVJ" 
                             class="w-full h-auto rounded-lg main-image">
                    </div>
                    <div class="grid grid-cols-4 gap-4">
                        <div class="thumbnail active" data-image="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/models_gw/images-s/2023/03_29/gate_family_s_01_m.jpg">
                            <img src="" 
                                 alt="Front View" 
                                 class="w-full h-24 object-cover rounded-lg">
                        </div>
                        <div class="thumbnail" data-image="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/models_gw/images-s/2023/03_29/gate_family_s_04_m.jpg">
                            <img src="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/models_gw/images-s/2023/03_29/gate_family_s_04_m.jpg" 
                                 alt="Side View" 
                                 class="w-full h-24 object-cover rounded-lg">
                        </div>
                        <div class="thumbnail" data-image="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/models_gw/images-s/2023/03_29/gate_family_s_05_m.jpg">
                            <img src="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/models_gw/images-s/2023/03_29/gate_family_s_05_m.jpg" 
                                 alt="Rear View" 
                                 class="w-full h-24 object-cover rounded-lg">
                        </div>
                        <div class="thumbnail" data-image="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/models_gw/images-s/2023/03_29/gate_family_s_06_m.jpg">
                            <img src="https://www.lamborghini.com/sites/it-en/files/DAM/lamborghini/facelift_2019/models_gw/images-s/2023/03_29/gate_family_s_06_m.jpg" 
                                 alt="Interior View" 
                                 class="w-full h-24 object-cover rounded-lg">
                        </div>
                    </div>
                </div>

                <!-- Product Information -->
                <div>
                    <div class="mb-8">
                        <h1 class="text-4xl font-bold mb-4">Lamborghini Aventador SVJ</h1>
                        <div class="flex items-center space-x-4 mb-4">
                            <span class="text-2xl font-bold text-lambo-yellow">$500,000</span>
                            <span class="text-gray-400">Starting Price</span>
                        </div>
                        <p class="text-gray-400 mb-6">The Aventador SVJ represents the purest essence of a Lamborghini super sports car. With its naturally aspirated V12 engine and innovative aerodynamics, it delivers an unparalleled driving experience.</p>
                    </div>

                    <!-- Category -->
                    <div class="mb-8">
                        <h3 class="text-xl font-bold mb-4">Category</h3>
                        <div class="flex space-x-4">
                            <span class="px-4 py-2 bg-lambo-gray rounded-full text-sm">Super Sports Car</span>
                            <span class="px-4 py-2 bg-lambo-gray rounded-full text-sm">Limited Edition</span>
                            <span class="px-4 py-2 bg-lambo-gray rounded-full text-sm">V12</span>
                        </div>
                    </div>

                    <!-- Color Options -->
                    <div class="mb-8">
                        <h3 class="text-xl font-bold mb-4">Available Colors</h3>
                        <div class="flex space-x-4">
                            <div class="color-option active bg-red-600" title="Rosso Mars"></div>
                            <div class="color-option bg-yellow-400" title="Giallo Inti"></div>
                            <div class="color-option bg-blue-600" title="Blu Caelum"></div>
                            <div class="color-option bg-black" title="Nero Noctis"></div>
                            <div class="color-option bg-white" title="Bianco Isis"></div>
                        </div>
                    </div>

                    <!-- Key Specifications -->
                    <div class="mb-8">
                        <h3 class="text-xl font-bold mb-4">Key Specifications</h3>
                        <div class="space-y-4">
                            <div class="specs-item">
                                <h4 class="text-lg font-semibold">Engine</h4>
                                <p class="text-gray-400">V12, 6.5 L, 770 HP @ 8,500 rpm</p>
                            </div>
                            <div class="specs-item">
                                <h4 class="text-lg font-semibold">Performance</h4>
                                <p class="text-gray-400">0-100 km/h in 2.9s, Top Speed 350 km/h</p>
                            </div>
                            <div class="specs-item">
                                <h4 class="text-lg font-semibold">Transmission</h4>
                                <p class="text-gray-400">7-speed ISR automated manual</p>
                            </div>
                        </div>
                    </div>

                    <!-- Action Buttons -->
                    <div class="flex space-x-4">
                        <button class="flex-1 bg-lambo-yellow text-lambo-black px-8 py-3 rounded-full font-semibold hover:bg-opacity-90 transition-all">
                            Configure Now
                        </button>
                        <button class="flex-1 border-2 border-white px-8 py-3 rounded-full font-semibold hover:bg-white hover:text-lambo-black transition-all">
                            Book a Test Drive
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-lambo-black py-12">
        <div class="container mx-auto px-6">
            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <div>
                    <h4 class="text-xl font-bold mb-4">LAMBORGHINI</h4>
                    <p class="text-gray-400">Experience the ultimate in automotive excellence.</p>
                </div>
                <div>
                    <h4 class="text-xl font-bold mb-4">Models</h4>
                    <ul class="space-y-2">
                        <li><a href="#" class="text-gray-400 hover:text-lambo-yellow">Aventador</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-lambo-yellow">Huracán</a></li>
                        <li><a href="#" class="text-gray-400 hover:text-lambo-yellow">Urus</a></li>
                    </ul>
                </div>
                <div>
                    <h4 class="text-xl font-bold mb-4">Contact</h4>
                    <ul class="space-y-2">
                        <li class="text-gray-400">+1 (555) 123-4567</li>
                        <li class="text-gray-400">info@lamborghini.com</li>
                    </ul>
                </div>
                <div>
                    <h4 class="text-xl font-bold mb-4">Follow Us</h4>
                    <div class="flex space-x-4">
                        <a href="#" class="text-gray-400 hover:text-lambo-yellow">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-lambo-yellow">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-lambo-yellow">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
            </div>
            <div class="border-t border-lambo-gray mt-12 pt-8 text-center text-gray-400">
                <p>&copy; 2024 Automobili Lamborghini S.p.A. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        // Image gallery functionality
        document.querySelectorAll('.thumbnail').forEach(thumb => {
            thumb.addEventListener('click', () => {
                // Remove active class from all thumbnails
                document.querySelectorAll('.thumbnail').forEach(t => t.classList.remove('active'));
                
                // Add active class to clicked thumbnail
                thumb.classList.add('active');
                
                // Update main image
                document.getElementById('mainImage').src = thumb.dataset.image;
            });
        });

        // Color selection functionality
        document.querySelectorAll('.color-option').forEach(color => {
            color.addEventListener('click', () => {
                // Remove active class from all colors
                document.querySelectorAll('.color-option').forEach(c => c.classList.remove('active'));
                
                // Add active class to clicked color
                color.classList.add('active');
            });
        });
    </script>
</body>
</html>
<% 
            }
        } else {
      %>
      <p>Error: No categories found.</p>
      <% 
        }
      %>