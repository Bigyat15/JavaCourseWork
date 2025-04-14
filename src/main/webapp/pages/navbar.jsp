<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.loginModel" %>
<%@ page session="true" %>

<style>
    .hamburger.active span:nth-child(1) {
        transform: rotate(45deg) translate(5px, 5px);
    }
    .hamburger.active span:nth-child(2) {
        opacity: 0;
    }
    .hamburger.active span:nth-child(3) {
        transform: rotate(-45deg) translate(7px, -6px);
    }
    #sideMenu {
        transform: translateX(100%);
        transition: transform 0.3s ease-in-out;
    }
    #sideMenu.open {
        transform: translateX(0);
    }
    .rotate-180 {
        transform: rotate(180deg);
    }
    .dropdown-menu {
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.3s ease-in-out;
    }
    .dropdown-menu:not(.hidden) {
        max-height: 500px;
    }
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
        background: #ffffff;
        transition: width 0.3s ease;
    }
    .elegant-border:hover::after {
        width: 100%;
    }
</style>

<!-- Navigation -->
<nav class="fixed top-0 left-0 w-full z-30 flex items-center justify-end p-4 bg-transparent">
  <div class="absolute left-1/2 -translate-x-1/2">
    <img src="/CollegeTutorial/images/aurelia white.png" alt="Logo" class="h-24 md:h-32 lg:h-36">
  </div>
  <div id="hamburger" class="hamburger w-8 h-6 relative cursor-pointer transition-all duration-300 z-40 group">
    <span class="absolute h-0.5 w-full bg-white left-0 rounded transition-all duration-300"></span>
    <span class="absolute h-0.5 w-full bg-white left-0 top-2 rounded transition-all duration-300"></span>
    <span class="absolute h-0.5 w-full bg-white left-0 top-4 rounded transition-all duration-300"></span>
  </div>
</nav>

<!-- Side Menu -->
<div id="sideMenu" class="fixed top-0 right-0 w-64 md:w-80 h-full bg-black/50 backdrop-blur-md transform translate-x-full transition-transform duration-300 ease-in-out z-50">
  <div class="p-6">
    <!-- Side Menu Logo -->
    <div class="mb-8">
      <img src="/CollegeTutorial/images/aurelia white.png" alt="Logo" class="h-24 md:h-32">
    </div>

    <!-- Navigation Links -->
    <nav class="space-y-4">
      <a href="${pageContext.request.contextPath}/car" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">HOME</a>

      <!-- Dropdown Menu -->
      <div class="dropdown">
        <a href="#" class="dropdown-toggle text-white text-lg hover:text-white/80 transition-colors duration-300 flex items-center justify-between elegant-border">
          CARS
          <i class="fas fa-chevron-down ml-2 text-sm"></i>
        </a>
        <div class="dropdown-menu hidden pl-4 mt-2 space-y-2">
          <a href="#" class="block text-white/80 hover:text-white transition-colors duration-300 elegant-border">EXOTIC CARS</a>
          <a href="#" class="block text-white/80 hover:text-white transition-colors duration-300 elegant-border">HYPERCARS</a>
          <a href="#" class="block text-white/80 hover:text-white transition-colors duration-300 elegant-border">JDM CARS</a>
          <a href="#" class="block text-white/80 hover:text-white transition-colors duration-300 elegant-border">SPECIAL CARS</a>
        </div>
      </div>

      <a href="#" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">BLOG</a>
      <a href="#" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">CART</a>
      <a href="#" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">CLUB</a>
      <a href="#" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">PODCAST</a>
      <a href="#" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">DEALERS</a>
      <a href="#" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">VISIT US</a>
      <a href="#" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">CONTACT US</a>
      <a href="${pageContext.request.contextPath}/store" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">AURELIA STORE</a>

      <!-- Conditional Links Based on User Session -->
      <%
        String userEmail = (String) session.getAttribute("email");
        if (userEmail != null) {
      %>
        <a href="${pageContext.request.contextPath}/profile" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">PROFILE</a>
        <a href="${pageContext.request.contextPath}/logout" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">SIGN OUT</a>
      <%
        } else {
      %>
        <a href="${pageContext.request.contextPath}/login" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">SIGN IN</a>
        <a href="${pageContext.request.contextPath}/register" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">REGISTER</a>
      <%
        }
      %>

      <a href="#" class="block text-white text-lg hover:text-white/80 transition-colors duration-300 elegant-border">HISTORY</a>
    </nav>

    <!-- Social Media Links -->
    <div class="mt-8 flex gap-4">
      <a href="#" class="text-white/80 text-xl hover:text-white transition-colors duration-300"><i class="fa-brands fa-facebook"></i></a>
      <a href="#" class="text-white/80 text-xl hover:text-white transition-colors duration-300"><i class="fa-brands fa-square-instagram"></i></a>
      <a href="#" class="text-white/80 text-xl hover:text-white transition-colors duration-300"><i class="fa-brands fa-x-twitter"></i></a>
      <a href="#" class="text-white/80 text-xl hover:text-white transition-colors duration-300"><i class="fa-brands fa-youtube"></i></a>
    </div>
  </div>
</div>

<!-- Overlay -->
<div id="overlay" class="fixed inset-0 bg-black/80 z-40 hidden"></div>

<!-- JavaScript for Navbar -->
<script>
document.addEventListener('DOMContentLoaded', function() {
  const hamburger = document.getElementById('hamburger');
  const sideMenu = document.getElementById('sideMenu');
  const overlay = document.getElementById('overlay');
  const dropdownToggles = document.querySelectorAll('.dropdown-toggle');
  const dropdownMenus = document.querySelectorAll('.dropdown-menu');

  // Toggle side menu
  hamburger.addEventListener('click', function() {
    hamburger.classList.toggle('active');
    sideMenu.classList.toggle('open');
    overlay.classList.toggle('hidden');
  });

  // Close side menu when clicking overlay
  overlay.addEventListener('click', function() {
    hamburger.classList.remove('active');
    sideMenu.classList.remove('open');
    overlay.classList.add('hidden');
  });

  // Handle dropdown menus
  dropdownToggles.forEach((toggle, index) => {
    toggle.addEventListener('click', function(e) {
      e.preventDefault();
      const menu = dropdownMenus[index];
      menu.classList.toggle('hidden');
      
      // Toggle chevron icon
      const icon = this.querySelector('i');
      icon.classList.toggle('rotate-180');
    });
  });

  // Close menu when clicking outside
  document.addEventListener('click', function(event) {
    if (sideMenu && !sideMenu.contains(event.target) && !hamburger.contains(event.target)) {
      hamburger.classList.remove('active');
      sideMenu.classList.remove('open');
      overlay.classList.add('hidden');
    }
  });
});
</script> 
