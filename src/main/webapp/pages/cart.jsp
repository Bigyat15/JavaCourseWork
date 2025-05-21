<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@page import = "java.util.ArrayList" %>
   <%@page import = "models.cartModel" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Luxury Motors - Cart</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@500&family=Montserrat:wght@300;500&display=swap" rel="stylesheet"/>
  <style>
    body {
      font-family: 'Montserrat', sans-serif;
    }
    h1, h3 {
      font-family: 'Playfair Display', serif;
    }
  </style>
</head>
<body class="bg-[#0a0a0a] text-[#e5e5e5]">
	<%@include file="navbar.jsp" %>
	<br>
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-16">
    <!-- Header -->
    <div class="border-b border-[#D4AF37]/60 pb-6 mb-14">
      <h1 class="text-5xl font-medium text-[#D4AF37] tracking-wide">Your Luxury Selection</h1>
    </div>

    <!-- Cart Items -->
    <%
    ArrayList<cartModel> cartList = (ArrayList<cartModel>) request.getAttribute("cartList");
    	if(cartList != null && !cartList.isEmpty() ){
    		
    	
    %>
    <div class="space-y-14">
      <!-- Cart Item -->
      <div class="grid grid-cols-1 md:grid-cols-[1fr_2fr] gap-10 items-center bg-[#111] rounded-xl shadow-xl p-6 transition hover:shadow-2xl duration-300">
      <%
        for(cartModel car: cartList){
        	
        %>
        <div class="aspect-video bg-[#1a1a1a] rounded-lg overflow-hidden">
        
          <img src="<%=car.getStore_image() %>" alt="Luxury Car" class="object-cover w-full h-full hover:scale-105 transition-transform duration-300" />
        </div>
        <div class="flex flex-col justify-between space-y-6">
          <div>
            <h3 class="text-3xl text-[#D4AF37] mb-2"><%=car.getCar_name() %></h3>
            <p class="text-[#999999] text-sm mb-4"><%=car.getCar_description() %></p>
            <div class="flex flex-wrap items-center gap-6">
              <div class="flex items-center border border-[#333] rounded-lg overflow-hidden">
                <form action="${pageContext.request.contextPath}/cart" method="POST">
              	<input name="car_id" type="hidden" value="<%=car.getCar_id() %>">
                <input name="car_name" type="hidden" value="<%=car.getCar_name() %>">
                <input name="quantity" type="hidden" value="<%=car.getQuantity() %>">
                <input name="car_price" type="hidden" value="<%=car.getCar_price() %>">
                <input type="hidden" name="total" value="<%=car.getTotalPrice() %>" />
                <input type="hidden" name="action" value="subtract">
              	<button class="px-4 py-2 text-[#D4AF37] hover:bg-[#1a1a1a] transition">−</button>
              </form>
                
                <span class="px-4"><%=car.getQuantity() %></span>
                <form method="POST" action="${pageContext.request.contextPath}/cart">
                <input name="car_id" type="hidden" value="<%=car.getCar_id() %>">
                <input name="car_name" type="hidden" value="<%=car.getCar_name() %>">
                <input name="quantity" type="hidden" value="<%=car.getQuantity() %>">
                <input name="car_price" type="hidden" value="<%=car.getCar_price() %>">
                <input type="hidden" name="total" value="<%=car.getTotalPrice() %>" />
                <input type="hidden" name="action" value="add">
                <button type="submit" class="px-4 py-2 text-[#D4AF37] hover:bg-[#1a1a1a] transition">+</button>
                </form>
              </div>
              <form action="${pageContext.request.contextPath}/cart" method="POST">
              	<input name="car_id" type="hidden" value="<%=car.getCar_id() %>">
                <input name="car_name" type="hidden" value="<%=car.getCar_name() %>">
                <input name="quantity" type="hidden" value="<%=car.getQuantity() %>">
                <input name="car_price" type="hidden" value="<%=car.getCar_price() %>">
                <input type="hidden" name="total" value="<%=car.getTotalPrice() %>" />
                
                <input type="hidden" name="action" value="delete">
              	<button type="submit" class="text-[#999999] hover:text-[#D4AF37] transition uppercase text-sm tracking-wider">Remove</button>
              </form>
              <%
              
              if(cartList != null && !cartList.isEmpty()){
              %>
                  <form action="${pageContext.request.contextPath}/cart" method="POST">
                      <input type="hidden" name="car_id" value="<%=car.getCar_id() %>">
                      <input type="hidden" name="cart_id" value="<%=car.getCart_id()%>">
                      <input type="hidden" name="user_id" value="<%=car.getUser_id() %>">
                      <input type="hidden" name="car_price" value="<%=car.getCar_price() %>">
                      <input type="hidden" name="total" value="<%=car.getTotalPrice() %>">
                      <input type="hidden" name="action" value="buyNow">
                      <button type="submit" class="flex-1 text-center bg-[#D4AF37] text-[#0a0a0a] py-4 px-6 rounded-lg shadow-md hover:bg-[#b69530] transition uppercase tracking-wider font-semibold">
                          Buy Now
                      </button>
                  </form>
              <%
              }
              %>
            </div>
          </div>
          <p class="text-2xl text-[#D4AF37] font-semibold">$<%=car.getTotalPrice() %></p>
          
        </div>
        <%
        }
          %>
      </div>
    </div>
	<%
    	}
    	else{
	%>
	<p>Cart Is empty</p>
	<%
	}
	%>
	
    <!-- Summary -->
    
    <%-- <div class="mt-20 border-t border-[#333] pt-12">
      <div class="max-w-lg ml-auto space-y-8">
      <%
        if(cartList != null && !cartList.isEmpty()){
        	cartModel cart = cartList.get(0);
        
        %>
        <div class="flex justify-between text-xl">
          <span>Subtotal</span>
          <span class="text-[#D4AF37]">$<%=cart.getTotalPrice() %></span>
        </div>
        <div class="flex justify-between text-2xl font-playfair-display text-[#D4AF37] pt-4 border-t border-[#333]">
          <span>Total</span>
          <span>$<%=cart.getTotalPrice() %></span>
        </div>

        <!-- Buttons -->
        
        <div class="flex flex-col sm:flex-row gap-4 pt-10">
        <form action="${pageContext.request.contextPath}/cart" method="POST">
        <input type="hidden" name="car_id" value="<%=cart.getCar_id() %>">
        <input type="hidden" name="cart_id" value="<%=cart.getCart_id()%>">
        <input type="hidden" name="user_id" value="<%=cart.getUser_id() %>">
        <input type="hidden" name="car_price" value="<%=cart.getCar_price() %>">
        <input type="hidden" name="total" value="<%=cart.getTotalPrice() %>">
        <input type="hidden" name="action" value="buyNow">
          <button type="submit" class="flex-1 text-center bg-[#D4AF37] text-[#0a0a0a] py-4 px-6 rounded-lg shadow-md hover:bg-[#b69530] transition uppercase tracking-wider font-semibold">
            Buy Now
          </button>
        </form>
          <a href="${pageContext.request.contextPath}/store" class="flex-1 text-center border border-[#D4AF37] text-[#D4AF37] py-4 px-6 rounded-lg hover:bg-[#D4AF37]/10 transition uppercase tracking-wider font-semibold">
            Continue Shopping
          </a>
        </div>
        <%
        }
        %>
      </div>
    </div> --%>
    
  </div>
  <div class="flex justify-end">
  <a href="${pageContext.request.contextPath}/store" 
     class="text-center border border-[#D4AF37] text-[#D4AF37] py-4 px-6 rounded-lg hover:bg-[#D4AF37]/10 transition uppercase tracking-wider font-semibold">
    Continue Shopping
  </a>
</div>

          <br>
          <br>
  <%@include file="footer.jsp" %>
  <script type="text/javascript" src="/CollegeTutorial/js/main.js"></script>
</body>
</html>
