<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.productImageModel" %>
<%@page import="models.productModel" %>
<%@page import="models.colorModel" %>

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
    <!-- Product Detail Section -->
    <%@include file="navbar.jsp" %>
    <section class="pt-32 pb-20">
        <div class="container mx-auto px-6">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
                <!-- Product Gallery -->
                <div class="product-gallery">
                    <div class="mb-4">
                        <% 
                        ArrayList<productImageModel> imageList = (ArrayList<productImageModel>) request.getAttribute("imageList");
                        if(imageList != null && !imageList.isEmpty()){
                            productImageModel firstImage = imageList.get(0); 
                        %>
                            <!-- main image -->
                            <img id="mainImage" src="<%= firstImage.getCar_images_path() %>" 
                                 alt="Lamborghini Aventador SVJ" 
                                 class="w-full h-auto rounded-lg main-image">
                        </div>
                        <div class="grid grid-cols-4 gap-4">
                            <% 
                            
                            for (productImageModel pim : imageList) {
                                String[] imagePaths = pim.getCar_images_path().split(",");
                                for (int i = 0; i < imagePaths.length; i++) {
                                    String imagePath = imagePaths[i].trim();
                            %>
                                <div class="thumbnail" data-image="<%= imagePath %>">
                                    <img src="<%= imagePath %>" 
                                         alt="Image" 
                                         class="w-full h-24 object-cover rounded-lg">
                                </div>
                            <% 
                                }
                            }
                            } else {
                            %>
                                <p>Error: No images found.</p>
                            <% 
                            } 
                            %>
                        </div>
                    </div>

                <!-- Product Information -->
                <div>
                 <% 
                        
                        if(imageList != null && !imageList.isEmpty()){
                            productImageModel firstImage = imageList.get(0); 
                        %>
                    <div class="mb-8">
                    
                        <h1 class="text-4xl font-bold mb-4"><%=firstImage.getCar_name() %></h1>
                        <div class="flex items-center space-x-4 mb-4">
                            <span class="text-2xl font-bold text-lambo-yellow">$<%=firstImage.getCar_price() %></span>
                            <span class="text-gray-400">Starting Price</span>
                        </div>
                        <p class="text-gray-400 mb-6"><%=firstImage.getCar_description() %></p>
                    </div>
					
                    <!-- Category -->
                    <div class="mb-8">
                    
                        <h3 class="text-xl font-bold mb-4">Category</h3>
                        <div class="flex space-x-4">
                        
                        	
                        
                            <span class="px-4 py-2 bg-lambo-gray rounded-full text-sm"><%=firstImage.getCategory_name() %></span>
                        </div>
                        <% 
                        	
					}else{
					%>
					<p>No category</p>
					<%
					}%>
                    </div>
					<%
						ArrayList<colorModel> colorList = (ArrayList<colorModel>) request.getAttribute("colorList");
						if(colorList != null && !colorList.isEmpty()){
							colorModel colors = colorList.get(0);
						
					%>
                    <!-- Color Options -->
                    <div class="mb-8">
                        <h3 class="text-xl font-bold mb-4">Available Colors</h3>
                        <div class="flex space-x-4">
                        <%
                        for (colorModel cm : colorList) {
                            String[] colorLists = cm.getColor_name().split(",");
                            for (int i = 0; i < colorLists.length; i++) {
                                String colorName = colorLists[i].trim();
                        %>
                            <div class="color-option <%=colorName %>" title="Rosso Mars"></div>
                            <%
                            }
                        }%>
                        </div>
                    </div>
				<%
				
				}else{
				%>
				<p>Not foound</p>
				<%}
				%>
                    <!-- Key Specifications -->
                   
                    <div class="mb-8">
                     
                        <h3 class="text-xl font-bold mb-4">Key Specifications</h3>
                        <% 
                        
                        if(imageList != null && !imageList.isEmpty()){
                            productImageModel firstImage = imageList.get(0); 
                        %>
                        <div class="space-y-4">
                            <div class="specs-item">
                                <h4 class="text-lg font-semibold">Engine</h4>
                                <p class="text-gray-400"><%=firstImage.getEngine_type() %></p>
                            </div>
                            <div class="specs-item">
                                <h4 class="text-lg font-semibold">Performance</h4>
                                <p class="text-gray-400"><%=firstImage.getPerformance() %></p>
                            </div>
                            <div class="specs-item">
                                <h4 class="text-lg font-semibold">Transmission</h4>
                                <p class="text-gray-400"><%=firstImage.getTransmission() %></p>
                            </div>
                        </div>
                        <% }else{
					%>
					<p>No category</p>
					<%
					}%>
                    </div>
						<% 
                        
                        if(imageList != null && !imageList.isEmpty()){
                            productImageModel firstImage = imageList.get(0); 
                        %>
                    <!-- Action Buttons -->
                    <div class="flex space-x-4">
                        <!-- <button class="flex-1 bg-lambo-yellow text-lambo-black px-8 py-3 rounded-full font-semibold hover:bg-opacity-90 transition-all">
                            Buy now
                        </button> -->

                        <form method="POST" action="${pageContext.request.contextPath}/cart">
							<input type="hidden" name="car_name" value="<%=firstImage.getCar_name() %>">
                        	<input type="hidden" name="car_id" value="<%=firstImage.getCar_id() %>">
                        	<input type="hidden" name="car_image" value="<%=firstImage.getCar_images_path() %>">
    						<input type="hidden" name="car_price" value="<%=firstImage.getCar_price() %>">
    						<input type="hidden" name="total" id="total" value="<%=firstImage.getCar_price() %>">
    						<input type="hidden" name="quantity" min="1" value="1" class="w-20 text-center border rounded">
                        	<button type="submit"  class="flex-1 border-2 border-white px-8 py-3 rounded-full font-semibold hover:bg-white hover:text-lambo-black transition-all">
                            Add to cart
                        	</button>
                        </form>
                    </div>
                    <% }else{
					%>
					<p>No category</p>
					<%
					}%>
                </div>
            </div>
        </div>
    </section>

    <%@include file="footer.jsp" %>

    <!-- JavaScript to handle image changing on thumbnail click -->
    <script>
        document.querySelectorAll('.thumbnail').forEach(function (thumbnail) {
            thumbnail.addEventListener('click', function () {
                var imagePath = this.getAttribute('data-image');
                document.getElementById('mainImage').src = imagePath;

                // Toggle active class for thumbnails
                document.querySelectorAll('.thumbnail').forEach(function (thumb) {
                    thumb.classList.remove('active');
                });
                this.classList.add('active');
            });
        });

        // Handle color selection
        document.querySelectorAll('.color-option').forEach(function (color) {
            color.addEventListener('click', function () {
                document.querySelectorAll('.color-option').forEach(function (opt) {
                    opt.classList.remove('active');
                });
                this.classList.add('active');
            });
        });
    </script>
      <script type="text/javascript" src="/CollegeTutorial/js/main.js"></script>
</body>
</html>
