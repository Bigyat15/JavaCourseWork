<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.categoryModel" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Luxury Motors - Premium Car Collection</title>
  
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
            'scroll': 'scroll 50s linear infinite',
            'fade-in': 'fadeIn 1s ease-in',
            'slide-up': 'slideUp 1s ease-out',
          },
          keyframes: {
            scroll: {
              '0%': { transform: 'translateX(0)' },
              '50%': { transform: 'translateX(-50%)' },
              '100%': { transform: 'translateX(-100%)' }
            },
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

  <!-- Lenis Smooth Scrolling -->
  <script src="https://unpkg.com/@studio-freight/lenis@1.0.25/bundled/lenis.min.js"></script>

  <!-- Font Awesome Icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

  <!-- Leaflet CSS -->
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin=""/>

  <!-- Leaflet JavaScript -->
  <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>

  <!-- Custom CSS -->
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
      background: #b8860b;
      transition: width 0.3s ease;
    }
    .elegant-border:hover::after {
      width: 100%;
    }
  </style>
</head>
<body class="bg-primary text-white">
  <!-- First Section -->
  <section class="relative h-screen overflow-hidden">
    <!-- Background Video -->
    <video autoplay loop muted class="absolute top-0 left-0 w-full h-full object-cover z-0">
      <source src="/CollegeTutorial/vedios/new2.mp4" type="video/mp4">
      <source src="/CollegeTutorial/vedios/luxury-car-showcase.mp4" type="video/mp4">
      <source src="/CollegeTutorial/vedios/exotic-car-drive.mp4" type="video/mp4">
      Your browser does not support the video tag.
    </video>

    <!-- Background Overlay -->
    <div class="absolute inset-0 bg-gradient-to-b from-primary/90 to-primary/40 z-10"></div>

    <!-- Main Title -->
    <div class="absolute top-1/2 left-4 md:left-24 -translate-y-1/2 text-white font-space-grotesk z-20 text-left animate-fade-in">
      <h3 class="text-sm md:text-lg lg:text-xl font-medium text-accent tracking-widest mb-4">LUXURY MOTORS: THE EPITOME OF LUXURY</h3>
      <h1 class="text-4xl md:text-5xl lg:text-7xl font-semibold mb-5 w-full md:w-4/5 tracking-widest">DRIVE THE EXTRAORDINARY</h1>
      <a href="#" class="text-4xl md:text-5xl lg:text-6xl text-accent hover:text-white transition-colors duration-300">
        <i class="fa-solid fa-angles-right"></i>
      </a>
    </div>

    <!-- Navigation -->
    <nav class="fixed top-0 left-0 w-full z-30 flex items-center justify-end p-4 bg-transparent">
      <div class="absolute left-1/2 -translate-x-1/2">
        <img src="/CollegeTutorial/images/aurelia white.png" alt="Logo" class="h-24 md:h-32 lg:h-36">
      </div>
      <div id="hamburger" class="hamburger w-8 h-6 relative cursor-pointer transition-all duration-300 z-40 group">
        <span class="absolute h-0.5 w-full bg-accent left-0 rounded transition-all duration-300 group-hover:bg-white"></span>
        <span class="absolute h-0.5 w-full bg-accent left-0 top-2 rounded transition-all duration-300 group-hover:bg-white"></span>
        <span class="absolute h-0.5 w-full bg-accent left-0 top-4 rounded transition-all duration-300 group-hover:bg-white"></span>
      </div>
    </nav>

    <!-- Side Menu -->
    <div id="sideMenu" class="fixed top-0 right-0 w-64 md:w-80 h-full bg-primary/95 transform translate-x-full transition-transform duration-300 ease-in-out z-50 border-l border-accent/20">
      <div class="p-6">
        <!-- Side Menu Logo -->
        <div class="mb-8">
          <img src="/CollegeTutorial/images/aurelia white.png" alt="Logo" class="h-24 md:h-32">
        </div>

        <!-- Navigation Links -->
        <nav class="space-y-4">
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">HOME</a>

          <!-- Dropdown Menu -->
          <div class="dropdown">
            <a href="#" class="dropdown-toggle text-white text-lg hover:text-accent transition-colors duration-300 flex items-center justify-between elegant-border">
              CARS
              <i class="fas fa-chevron-down ml-2 text-sm"></i>
            </a>
            <div class="dropdown-menu hidden pl-4 mt-2 space-y-2">
              <a href="#" class="block text-gray-300 hover:text-accent transition-colors duration-300 elegant-border">EXOTIC CARS</a>
              <a href="#" class="block text-gray-300 hover:text-accent transition-colors duration-300 elegant-border">HYPERCARS</a>
              <a href="#" class="block text-gray-300 hover:text-accent transition-colors duration-300 elegant-border">JDM CARS</a>
              <a href="#" class="block text-gray-300 hover:text-accent transition-colors duration-300 elegant-border">SPECIAL CARS</a>
            </div>
          </div>

          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">BLOG</a>
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">CART</a>
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">CLUB</a>
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">PODCAST</a>
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">DEALERS</a>
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">VISIT US</a>
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">CONTACT US</a>
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">AURELIA STORE</a>
          <a href="http://localhost:8080/CollegeTutorial/login" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">SIGN IN</a>
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">REGISTER</a>
          <a href="#" class="block text-white text-lg hover:text-accent transition-colors duration-300 elegant-border">HISTORY</a>
        </nav>

        <!-- Social Media Links -->
        <div class="mt-8 flex gap-4">
          <a href="#" class="text-gray-300 text-xl hover:text-accent transition-colors duration-300"><i class="fa-brands fa-facebook"></i></a>
          <a href="#" class="text-gray-300 text-xl hover:text-accent transition-colors duration-300"><i class="fa-brands fa-square-instagram"></i></a>
          <a href="#" class="text-gray-300 text-xl hover:text-accent transition-colors duration-300"><i class="fa-brands fa-x-twitter"></i></a>
          <a href="#" class="text-gray-300 text-xl hover:text-accent transition-colors duration-300"><i class="fa-brands fa-youtube"></i></a>
        </div>
      </div>
    </div>

    <!-- Overlay -->
    <div id="overlay" class="fixed inset-0 bg-black/80 z-40 hidden"></div>
  </section>

  <!-- HORIZONTAL SCROLLING -->
  <div class="relative w-full overflow-hidden bg-white z-20 py-2.5">
    <div class="whitespace-nowrap flex animate-scroll">
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
         <img src="/CollegeTutorial/images/Pagani-Logo-PNG-Clipart-Background.png" alt="pagani logo" class="h-6 md:h-8 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
       <img src="/CollegeTutorial/images/koenigsegg.png" alt="koenigsegg logo" class="h-16 md:h-24 lg:h-32 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
        <img src="/CollegeTutorial/images/lambo.png" alt="lamborghini logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
       <img src="/CollegeTutorial/images/bugatti.png" alt="bugatti logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
        <img src="/CollegeTutorial/images/ferrari.png" alt="ferrari logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
     <img src="/CollegeTutorial/images/Aurelia Logo-01.png" alt="aurelia logo" class="h-24 md:h-36 lg:h-45 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
        <img src="/CollegeTutorial/images/bmw.png" alt="bmw logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
         <img src="/CollegeTutorial/images/mercedes.png" alt="mercedes logo" class="h-8 md:h-10 lg:h-12 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
      <img src="/CollegeTutorial/images/nissan.png" alt="nissan logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
     <img src="/CollegeTutorial/images/toyota.png" alt="toyota logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
       <img src="/CollegeTutorial/images/mclaren.png" alt="mclaren logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
         <img src="/CollegeTutorial/images/porsche.png" alt="porsche logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>

      <!-- Duplicate for seamless scrolling -->
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
         <img src="/CollegeTutorial/images/Pagani-Logo-PNG-Clipart-Background.png" alt="pagani logo" class="h-6 md:h-8 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
        <img src="/CollegeTutorial/images/koenigsegg.png" alt="koenigsegg logo" class="h-16 md:h-24 lg:h-32 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
         <img src="/CollegeTutorial/images/lambo.png" alt="lamborghini logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
        <img src="/CollegeTutorial/images/bugatti.png" alt="bugatti logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
         <img src="/CollegeTutorial/images/ferrari.png" alt="ferrari logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
       <img src="/CollegeTutorial/images/Aurelia Logo-01.png" alt="aurelia logo" class="h-24 md:h-36 lg:h-45 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
        <img src="/CollegeTutorial/images/bmw.png" alt="bmw logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
         <img src="/CollegeTutorial/images/mercedes.png" alt="mercedes logo" class="h-8 md:h-10 lg:h-12 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
       <img src="/CollegeTutorial/images/nissan.png" alt="nissan logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
      <img src="/CollegeTutorial/images/toyota.png" alt="toyota logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
       <img src="/CollegeTutorial/images/mclaren.png" alt="mclaren logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
      <div class="inline-flex items-center justify-center text-lg md:text-2xl lg:text-3xl text-primary font-italiana tracking-widest font-semibold">
         <img src="/CollegeTutorial/images/porsche.png" alt="porsche logo" class="h-12 md:h-16 lg:h-20 mx-8 md:mx-12">
      </div>
    </div>
  </div>

  <!-- Second Section -->
  <section class="relative h-screen flex justify-center items-center text-center bg-cover bg-center bg-no-repeat" style="background-image: url('/CollegeTutorial/images/second_section_images/3.jpg');">
    <div class="absolute inset-0 bg-gradient-to-b from-primary/90 to-primary/40 z-10"></div>
    <div class="relative z-20 max-w-6xl mx-auto p-5 text-center text-white font-italiana animate-slide-up">
      <div class="flex flex-col md:flex-row items-center justify-center gap-8">
        <div class="w-full md:w-1/2">
          <h2 class="text-3xl md:text-4xl lg:text-6xl font-medium tracking-wider mb-10 text-accent">"Experience the Pinnacle of Performance, Luxury, and Exclusivity"</h2>
          <a href="#" class="inline-block px-6 md:px-12 py-2.5 md:py-3.5 text-lg md:text-2xl bg-accent/75 text-primary font-cinzel font-medium tracking-wider rounded-full transition-all duration-300 hover:bg-primary/75 hover:text-accent border border-accent/50">DISCOVER NOW</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Third Section -->
  <section class="h-[15vh] md:h-[20vh] bg-primary text-accent flex justify-center items-center font-dm-sans text-xl md:text-2xl lg:text-3xl tracking-widest border-y border-accent/20">
    <h1 class="font-medium">LUXURY MOTORS PRESENTS</h1>
  </section>

  <!-- Fourth Section -->
  <section class="relative h-screen overflow-hidden px-4 md:px-10 pb-10 flex items-center justify-center z-10 bg-primary">
    <video autoplay muted loop playsinline class="absolute top-0 left-0 md:left-[5%] w-full md:w-[90%] h-full object-cover -z-10 pointer-events-none">
      <source src="/CollegeTutorial/vedios/Lamborghini Revuelto – From Now On (1).mp4" type="video/mp4" />
      Your browser does not support the video tag.
    </video>
    <div class="absolute top-0 left-0 w-full h-full bg-gradient-to-b from-primary/90 to-primary/40 z-0"></div>
    <div class="z-20 text-white text-center max-w-4xl font-space-grotesk flex items-center justify-center flex-col animate-fade-in">
      <h1 class="text-2xl md:text-3xl lg:text-4xl font-normal mb-3.5 text-accent">A RECORD-BREAKING FORCE OF NATURE</h1>
      <p class="w-full md:w-4/5 text-base md:text-lg mb-8 leading-6 md:leading-8">Koenigsegg Shatters the 400km/hr Record. A triumph of passion, speed and performance.</p>
      <button class="bg-transparent text-accent border border-accent py-2 md:py-3 px-4 md:px-6 tracking-widest cursor-pointer transition-all duration-300 hover:bg-accent/20 hover:text-white">WATCH NOW</button>
    </div>
  </section>

  <!-- Fifth Section -->
  <section class="h-[25vh] md:h-[35vh] bg-primary text-accent flex justify-center items-end border-y border-accent/20">
    <div class="mb-8 text-center font-dm-sans">
      <h1 class="text-4xl md:text-5xl lg:text-7xl font-light tracking-widest mb-2.5">OUR LUXURY CARS</h1>
      <p class="text-base md:text-lg">The quintessence of luxury and speed</p>
    </div>
  </section>

  <!-- Sixth Section -->
  <section class="min-h-screen bg-gradient-to-b from-primary to-gray-900 flex items-center justify-center p-4 md:p-10 font-space-grotesk">
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 md:gap-8 max-w-7xl w-full">
      <% 
        ArrayList<categoryModel> categoryList = (ArrayList<categoryModel>) request.getAttribute("categoryList");
        if (categoryList != null && !categoryList.isEmpty()) {
            for (categoryModel cat : categoryList) {
      %>
      <div class="bg-gradient-to-b from-primary to-gray-900 text-white border-l border-t border-accent/20 transition-all duration-300 hover:shadow-2xl hover:border-accent/50">
        <div class="overflow-hidden relative h-48 md:h-64">
          <img src="<%= cat.getCategory_image_path() %>" alt="Exotic Sport Car" class="w-full h-full object-cover border-r border-b border-accent/20 transition-transform duration-300 hover:scale-110" />
        </div>
        <div class="p-4 md:p-5">
          <h2 class="text-xl md:text-2xl font-normal tracking-widest mb-5 text-accent"><%=cat.getCategory_name() %></h2>
          <p class="text-xs md:text-sm leading-5 md:leading-6 text-gray-300 tracking-widest mb-6">
            <%=cat.getCategory_description()!=null ? cat.getCategory_description():"No description found" %>
          </p>
          <button class="bg-accent/20 text-accent border-none py-2 md:py-2.5 px-6 md:px-8 text-xs md:text-sm tracking-widest rounded-full cursor-pointer transition-all duration-300 hover:bg-accent hover:text-primary">BROWSE</button>
        </div>
      </div>
      <% 
            }
        } else {
      %>
      <p>Error: No categories found.</p>
      <% 
        }
      %>
    </div>
</section>


  <!-- Seventh Section -->
  <section class="h-[20vh] md:h-[30vh] bg-gradient-to-t from-primary to-gray-900 text-accent flex justify-center items-end border-t border-accent/20">
    <div class="mb-5 text-center font-dm-sans">
      <h1 class="text-4xl md:text-5xl lg:text-7xl font-light tracking-widest font-italiana">LUXURY MOTORS<br>Showroom Location</h1>
    </div>
  </section>

  <!-- Map Section -->
  <section class="min-h-screen bg-primary relative overflow-hidden">
    <!-- Background Pattern -->
    <div class="absolute inset-0 bg-[url('/CollegeTutorial/images/pattern.png')] opacity-5 z-0"></div>
    
    <!-- Gradient Overlay -->
    <div class="absolute inset-0 bg-gradient-to-b from-primary/90 via-primary/50 to-primary/90 z-10"></div>
    
    <!-- Content -->
    <div class="relative z-20 max-w-7xl mx-auto px-4 md:px-8 py-12 md:py-20">
      <!-- Section Header -->
      <div class="text-center mb-12 md:mb-20">
        <h2 class="text-3xl md:text-4xl lg:text-5xl font-italiana text-accent tracking-widest mb-4">Discover Our Showrooms</h2>
        <p class="text-gray-300 text-lg md:text-xl max-w-3xl mx-auto">Experience luxury at its finest in our exclusive showrooms across the United States</p>
      </div>

      <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 md:gap-12">
        <!-- Map Container -->
        <div class="relative h-[400px] sm:h-[500px] md:h-[600px] lg:h-[700px] rounded-2xl overflow-hidden shadow-2xl border border-accent/20 group hover:border-accent/50 transition-all duration-300">
          <div id="map" class="w-full h-full"></div>
          <!-- Map Overlay Effect -->
          <div class="absolute inset-0 bg-gradient-to-t from-primary/20 to-transparent pointer-events-none"></div>
        </div>
        
        <!-- Location Information -->
        <div class="text-white space-y-8">
          <!-- Location Cards Container -->
          <div class="space-y-6 md:space-y-8">
            <!-- New York Showroom -->
            <div class="location-card bg-primary/50 p-6 md:p-8 rounded-2xl border border-accent/20 hover:border-accent/50 transition-all duration-300 cursor-pointer group hover:shadow-2xl hover:shadow-accent/10">
              <div class="flex items-start justify-between">
                <div>
                  <h3 class="text-xl md:text-2xl font-cinzel text-accent mb-3 group-hover:text-white transition-colors duration-300">New York Showroom</h3>
                  <p class="text-gray-300 mb-2 flex items-center">
                    <i class="fas fa-map-marker-alt text-accent mr-2"></i>
                    123 Luxury Avenue, Manhattan, NY 10001
                  </p>
                  <p class="text-gray-300 mb-2 flex items-center">
                    <i class="fas fa-phone text-accent mr-2"></i>
                    +1 (212) 555-0123
                  </p>
                  <p class="text-gray-300 mb-4 flex items-center">
                    <i class="fas fa-clock text-accent mr-2"></i>
                    Open: Mon-Sat 9:00 AM - 8:00 PM
                  </p>
                </div>
                <div class="text-accent text-2xl group-hover:scale-110 transition-transform duration-300">
                  <i class="fas fa-chevron-right"></i>
                </div>
              </div>
              <div class="border-t border-accent/20 pt-4">
                <h4 class="text-sm font-semibold text-accent mb-3">Features:</h4>
                <ul class="grid grid-cols-2 gap-2 text-xs text-gray-300">
                  <li class="flex items-center">
                    <i class="fas fa-star text-accent mr-2"></i>
                    Exclusive Showroom
                  </li>
                  <li class="flex items-center">
                    <i class="fas fa-car text-accent mr-2"></i>
                    Test Drive Center
                  </li>
                  <li class="flex items-center">
                    <i class="fas fa-couch text-accent mr-2"></i>
                    VIP Lounge
                  </li>
                </ul>
              </div>
            </div>
            
            <!-- Los Angeles Showroom -->
            <div class="location-card bg-primary/50 p-6 md:p-8 rounded-2xl border border-accent/20 hover:border-accent/50 transition-all duration-300 cursor-pointer group hover:shadow-2xl hover:shadow-accent/10">
              <div class="flex items-start justify-between">
                <div>
                  <h3 class="text-xl md:text-2xl font-cinzel text-accent mb-3 group-hover:text-white transition-colors duration-300">Los Angeles Showroom</h3>
                  <p class="text-gray-300 mb-2 flex items-center">
                    <i class="fas fa-map-marker-alt text-accent mr-2"></i>
                    456 Prestige Boulevard, Beverly Hills, CA 90210
                  </p>
                  <p class="text-gray-300 mb-2 flex items-center">
                    <i class="fas fa-phone text-accent mr-2"></i>
                    +1 (310) 555-0123
                  </p>
                  <p class="text-gray-300 mb-4 flex items-center">
                    <i class="fas fa-clock text-accent mr-2"></i>
                    Open: Mon-Sat 9:00 AM - 8:00 PM
                  </p>
                </div>
                <div class="text-accent text-2xl group-hover:scale-110 transition-transform duration-300">
                  <i class="fas fa-chevron-right"></i>
                </div>
              </div>
              <div class="border-t border-accent/20 pt-4">
                <h4 class="text-sm font-semibold text-accent mb-3">Features:</h4>
                <ul class="grid grid-cols-2 gap-2 text-xs text-gray-300">
                  <li class="flex items-center">
                    <i class="fas fa-paint-brush text-accent mr-2"></i>
                    Customization Center
                  </li>
                  <li class="flex items-center">
                    <i class="fas fa-door-open text-accent mr-2"></i>
                    Private Viewing Rooms
                  </li>
                  <li class="flex items-center">
                    <i class="fas fa-couch text-accent mr-2"></i>
                    Luxury Lounge
                  </li>
                </ul>
              </div>
            </div>
            
            <!-- Miami Showroom -->
            <div class="location-card bg-primary/50 p-6 md:p-8 rounded-2xl border border-accent/20 hover:border-accent/50 transition-all duration-300 cursor-pointer group hover:shadow-2xl hover:shadow-accent/10">
              <div class="flex items-start justify-between">
                <div>
                  <h3 class="text-xl md:text-2xl font-cinzel text-accent mb-3 group-hover:text-white transition-colors duration-300">Miami Showroom</h3>
                  <p class="text-gray-300 mb-2 flex items-center">
                    <i class="fas fa-map-marker-alt text-accent mr-2"></i>
                    789 Ocean Drive, Miami Beach, FL 33139
                  </p>
                  <p class="text-gray-300 mb-2 flex items-center">
                    <i class="fas fa-phone text-accent mr-2"></i>
                    +1 (305) 555-0123
                  </p>
                  <p class="text-gray-300 mb-4 flex items-center">
                    <i class="fas fa-clock text-accent mr-2"></i>
                    Open: Mon-Sat 9:00 AM - 8:00 PM
                  </p>
                </div>
                <div class="text-accent text-2xl group-hover:scale-110 transition-transform duration-300">
                  <i class="fas fa-chevron-right"></i>
                </div>
              </div>
              <div class="border-t border-accent/20 pt-4">
                <h4 class="text-sm font-semibold text-accent mb-3">Features:</h4>
                <ul class="grid grid-cols-2 gap-2 text-xs text-gray-300">
                  <li class="flex items-center">
                    <i class="fas fa-umbrella-beach text-accent mr-2"></i>
                    Beachfront Location
                  </li>
                  <li class="flex items-center">
                    <i class="fas fa-ship text-accent mr-2"></i>
                    Yacht Club Access
                  </li>
                  <li class="flex items-center">
                    <i class="fas fa-calendar-star text-accent mr-2"></i>
                    VIP Events
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-primary px-6 md:px-12 pt-8 md:pt-12 pb-4 font-space-grotesk border-t border-accent/20">
    <div class="grid grid-cols-1 md:grid-cols-3 gap-8 md:gap-0 text-white">
      <div class="w-full">
        <h3 class="text-base font-semibold mb-2.5 text-accent">Discover</h3>
        <ul>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">DISCOVER Luxury Motors</a></li>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Exotic Sports Cars</a></li>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Exotic Super Cars</a></li>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Super Cars</a></li>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Customer Service</a></li>
        </ul>
      </div>

      <div class="w-full">
        <h3 class="text-base font-semibold mb-2.5 text-accent">Legal</h3>
        <ul>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Legal Notices</a></li>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Privacy Policy</a></li>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Cookie Policy</a></li>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Contact Us</a></li>
        </ul>
      </div>

      <div class="w-full flex flex-col">
        <h3 class="text-base font-semibold mb-2.5 text-accent">Additional Links</h3>
        <ul>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Blog</a></li>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Cart</a></li>
          <li class="mb-2.5"><a href="lhttp://localhost:8080/CollegeTutorial/login" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">Sign In</a></li>
          <li class="mb-2.5"><a href="#" class="text-gray-300 text-sm hover:text-accent transition-colors duration-300 elegant-border">History</a></li>
        </ul>

        <div class="flex gap-5 mt-2.5">
          <a href="#" class="text-gray-300 text-xl md:text-2xl hover:text-accent transition-colors duration-300"><i class="fa-brands fa-facebook"></i></a>
          <a href="#" class="text-gray-300 text-xl md:text-2xl hover:text-accent transition-colors duration-300"><i class="fa-brands fa-square-instagram"></i></a>
          <a href="#" class="text-gray-300 text-xl md:text-2xl hover:text-accent transition-colors duration-300"><i class="fa-brands fa-x-twitter"></i></a>
          <a href="#" class="text-gray-300 text-xl md:text-2xl hover:text-accent transition-colors duration-300"><i class="fa-brands fa-youtube"></i></a>
        </div>
      </div>
    </div>

    <div class="text-center mt-5 text-accent">
      <p class="text-xs">© 2024 LUXURY MOTORS. All rights reserved.</p>
    </div>
  </footer>

  <!-- JavaScript -->
  <script src="/CollegeTutorial/js/main.js"></script>
  <script src="/CollegeTutorial/js/map.js"></script>
</body>
</html> 