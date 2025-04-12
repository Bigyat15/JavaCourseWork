<%@ page import="java.util.ArrayList" %>
<%@ page import="models.productModel" %>
<html>
<head>
    <title>Store</title>
</head>
<body>
<%
    ArrayList<productModel> productList = (ArrayList<productModel>) request.getAttribute("productList");

    if (productList != null && !productList.isEmpty()) {
%>
    <h2>Car Image Gallery</h2>
    <div style="display: flex; flex-wrap: wrap;">
<%
        for (productModel pi : productList) {
%>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            
                <div class="bg-white rounded-lg shadow-md overflow-hidden">
                    <!-- Display product image (if available) -->
                    <img src="<%=pi.getCar_name() %>" alt="${product.car_name}" class="w-full h-64 object-cover">
                    
                    <div class="p-4">
                        <h2 class="text-xl font-semibold"><%=pi.getCar_name() %></h2>
                        <p class="text-gray-600">${product.car_description}</p>
                        <p class="text-lg font-bold text-green-500">${product.car_price} USD</p>
                        <a href="store?car_name=<%=pi.getCar_name() %>" class="mt-4 inline-block bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-700">View</a>
                    </div>
                </div>

        </div>
    </div>
<%
        }
%>
    </div>
<%
    } else {
%>
    <p>Error: No imadges found.</p>
<%
    }
%>
</body>
</html>
