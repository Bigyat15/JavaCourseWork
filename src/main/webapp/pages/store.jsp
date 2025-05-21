<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.productModel" %>
<%@ page import="models.categoryModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Car Gallery</title>
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
    <style>
        @media (max-width: 640px) {
            .car-card {
                height: 300px;
            }
        }
        @media (min-width: 641px) and (max-width: 1024px) {
            .car-card {
                height: 400px;
            }
        }
        @media (min-width: 1025px) {
            .car-card {
                height: 500px;
            }
        }
    </style>
</head>
<body class="bg-black text-white font-poppins min-h-screen overflow-x-hidden">
    <!-- Search Section -->
   <br>
    <section class="relative py-6 sm:py-8 md:py-12 px-4 bg-gradient-to-r from-black/90 to-black/70">
        <div class="max-w-3xl mx-auto">
        <form method='GET' action="${pageContext.request.contextPath}/store">
            <div class="relative">
                <input type="text" 
                	name="search"
                    class="w-full px-4 sm:px-6 py-3 bg-white/5 border border-white/10 text-white text-sm sm:text-base md:text-lg rounded-full pl-10 sm:pl-12 pr-12 sm:pr-16 focus:outline-none focus:border-primary transition-all" 
                    placeholder="Search for your dream car..."
                    value="<%=request.getParameter("search") != null ? request.getParameter("search") : "" %>"
                    >
                <button type="submit" 
                    class="absolute right-2 top-1/2 -translate-y-1/2 p-2 sm:p-3 text-primary hover:text-white transition-colors">
                    <i class="fas fa-search text-base sm:text-lg md:text-xl"></i>
                </button>
            </div>
            </form>
        </div>
    </section>

    <!-- Car Showcase -->
    <section id="models" class="relative p-4 sm:p-6 md:p-8 lg:p-16">
        <div class="flex flex-wrap justify-center gap-2 sm:gap-3 md:gap-4 mb-6 sm:mb-8 md:mb-12">
    <a href="${pageContext.request.contextPath}/store"
       class="px-3 sm:px-4 md:px-8 py-2 sm:py-3 
              <%= (request.getParameter("category") == null) ? "bg-primary text-black" : "bg-transparent text-white border border-white/20 hover:bg-primary hover:text-black hover:border-primary" %> 
              uppercase tracking-wider text-xs sm:text-sm transition-all">
       All Models
    </a>
    <%
    ArrayList<categoryModel> categoryList = (ArrayList<categoryModel>) request.getAttribute("categoryList");
    String selectedCategory = request.getParameter("category");
    if (categoryList != null && !categoryList.isEmpty()) {
        for (categoryModel cm : categoryList) {
            String categoryName = cm.getCategory_name();
            boolean isSelected = categoryName.equals(selectedCategory);
    %>
    <a href="${pageContext.request.contextPath}/store?category=<%=categoryName %>"
       class="px-3 sm:px-4 md:px-8 py-2 sm:py-3 
              <%= isSelected ? "bg-primary text-black" : "bg-transparent text-white border border-white/20 hover:bg-primary hover:text-black hover:border-primary" %> 
              uppercase tracking-wider text-xs sm:text-sm transition-all">
        <%= categoryName %>
    </a>
    <%
        }
    } else {
    %>
    <p>No category Found</p>
    <% } %>
</div>


        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 sm:gap-6 md:gap-8 mt-6 sm:mt-8 md:mt-16">
            <%
            ArrayList<productModel> productList = (ArrayList<productModel>) request.getAttribute("productList");
            if(productList != null && !productList.isEmpty()){
                for(productModel pro:productList){
            %>
            <div class="car-card relative overflow-hidden cursor-pointer group">
                <img src="<%=pro.getStore_images() %>" 
                    alt="<%=pro.getCar_name() %>" 
                    class="w-full h-full object-cover object-center transition-transform duration-700 ease-[cubic-bezier(0.4,0,0.2,1)] group-hover:scale-110">
                
                <div class="absolute bottom-0 left-0 w-full p-4 sm:p-6 md:p-8 bg-gradient-to-t from-black/90 to-transparent translate-y-full transition-transform duration-400 ease-in-out group-hover:translate-y-0">
                    <h3 class="text-base sm:text-lg md:text-xl lg:text-2xl font-semibold mb-1 sm:mb-2"><%=pro.getCar_name() %></h3>
                    <p class="text-sm sm:text-base md:text-lg lg:text-xl text-primary font-playfair mb-2 sm:mb-4">$<%=pro.getCar_price() %></p>
                    <div class="flex flex-wrap gap-2 sm:gap-3 md:gap-4 mb-3 sm:mb-4 md:mb-6">
                        <div class="flex items-center gap-1 sm:gap-2 px-2 sm:px-3 md:px-4 py-1 sm:py-2 bg-white/10 rounded-full">
                            <i class="fas fa-bolt text-primary text-xs sm:text-sm md:text-base"></i>
                            <span class="text-xs sm:text-sm">986 HP</span>
                        </div>
                        <div class="flex items-center gap-1 sm:gap-2 px-2 sm:px-3 md:px-4 py-1 sm:py-2 bg-white/10 rounded-full">
                            <i class="fas fa-tachometer-alt text-primary text-xs sm:text-sm md:text-base"></i>
                            <span class="text-xs sm:text-sm">2.5s</span>
                        </div>
                        <div class="flex items-center gap-1 sm:gap-2 px-2 sm:px-3 md:px-4 py-1 sm:py-2 bg-white/10 rounded-full">
                            <i class="fas fa-gauge-high text-primary text-xs sm:text-sm md:text-base"></i>
                            <span class="text-xs sm:text-sm">211 MPH</span>
                        </div>
                    </div>
                    <a href="${pageContext.request.contextPath}/productDetail?car_name=<%=pro.getCar_name()%>" 
                        class="inline-block px-3 sm:px-4 md:px-6 py-2 sm:py-3 bg-transparent text-white border border-white text-xs sm:text-sm uppercase tracking-wider transition-all hover:bg-white hover:text-black">View Details</a>
                </div>
            </div>
            <%
                }
            } else { 
            %>
            <p class="col-span-full text-center text-sm sm:text-base md:text-lg">No cars available</p>
            <%
            }
            %>
        </div>
    </section>
</body>
</html> 