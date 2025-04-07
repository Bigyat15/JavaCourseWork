<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gradient-to-br from-purple-300 to-blue-400 flex justify-center items-center min-h-screen">
<% String error = request.getParameter("error"); %>
	<div class="bg-white bg-opacity-20 backdrop-blur-lg shadow-lg rounded-2xl p-8 w-96 flex flex-col items-center">
		<h2 class="text-2xl font-extrabold text-white mb-6">Create an Account</h2>
		
		<form class="flex flex-col space-y-4 w-full" action="../register" method="POST">
			<div class="flex flex-col">
    <label class="text-sm font-medium text-white">First Name</label>
    <input type="text" name="first_name" placeholder="Enter First Name" 
           class="border border-white/50 focus:border-white/80 bg-transparent text-white placeholder-white/70 rounded-lg p-3 w-full outline-none transition duration-200" >
    <% if (error != null && error.equals("firstName")) { %>
        <p class="text-red-400">Invalid First Name</p>
    <% } %>
</div>

			<div class="flex flex-col">
				<label class="text-sm font-medium text-white">Last Name</label>
				<input type="text" name="last_name" placeholder="Enter Last Name" 
				       class="border border-white/50 focus:border-white/80 bg-transparent text-white placeholder-white/70 rounded-lg p-3 w-full outline-none transition duration-200" >
				<% if (error != null && error.equals("lastName")) { %>
    				<p class="text-red-400">Invalid Last Name</p>
				<% } %> 
			</div>

			<div class="flex flex-col">
				<label class="text-sm font-medium text-white">Dob</label>
				<input type="date" name="dob" placeholder="Enter Date of Birth" 
				       class="border border-white/50 focus:border-white/80 bg-transparent text-white placeholder-white/70 rounded-lg p-3 w-full outline-none transition duration-200" >
			</div>

			<div class="flex flex-col">
				<label class="text-sm font-medium text-white">Email</label>
				<input type="email" name="email" placeholder="Enter your email" class="border border-white/50 focus:border-white/80 bg-transparent text-white placeholder-white/70 rounded-lg p-3 w-full outline-none transition duration-200" >
				<% if(error != null && error.equals("email")) {%>
					<p class="text-red-400">Invalid Email</p>
				<% } %> 
			</div>

			<div class="flex flex-col">
				<label class="text-sm font-medium text-white">Phone Number</label>
				<input type="text" name="phone_number" placeholder="Enter your phone number" class="border border-white/50 focus:border-white bg-transparent text-white placeholder-white/70 rounded-lg p-3 w-full outline-none transition duration-200" >
				<% if(error != null && error.equals("phoneNumber")) {%>
					<p class="text-red-400">Invalid Phone Number</p>
				<% } %>
			</div>

			<div class="flex flex-col">
				<label class="text-sm font-medium text-white">Password</label>
				<input type="password" name="password" placeholder="Enter your Password" class="border border-white/50 focus:border-white/80 bg-transparent text-white placeholder-white/70 rounded-lg p-3 w-full outline-none transition duration-200" >
			</div>

			<div class="flex flex-col">
				<label class="text-sm font-medium text-white">Confirm Password</label>
				<input type="password" name="confirm_password" placeholder="Re-enter Password" 
				       class="border border-white/50 focus:border-white/80 bg-transparent text-white placeholder-white/70 rounded-lg p-3 w-full outline-none transition duration-200" >
			</div>

			<button type="submit" 
			        class="p-3 bg-gradient-to-r from-pink-500 to-purple-500 hover:from-pink-600 hover:to-purple-600 text-white font-semibold rounded-lg shadow-md transition duration-300 w-full">
				Sign Up
			</button>
		</form>
	</div>
</body>
</html>
