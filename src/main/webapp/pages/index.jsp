<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- CSS -->

  <link rel="stylesheet" href="/css/style.css">



  <!-- FONTS -->

  <!-- DM sans -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&display=swap" rel="stylesheet">

  <!-- space grotesk -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300..700&display=swap" rel="stylesheet">

  <!-- italiana -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Italiana&display=swap" rel="stylesheet">


  <!-- cinzel font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&family=Work+Sans:ital,wght@0,100..900;1,100..900&display=swap" rel="stylesheet">


  <!-- playfair font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Playfair:ital,opsz,wght@0,5..1200,300..900;1,5..1200,300..900&display=swap" rel="stylesheet">


  <!-- poppins -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">


  <!-- roboto flex -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto+Flex:opsz,wght@8..144,100..1000&display=swap" rel="stylesheet">





  <!-- ICONS LINK -->

  <script src="https://kit.fontawesome.com/c3ca5c064a.js" crossorigin="anonymous"></script>

  <title>Landing page</title>
</head>
<body>

<!-- LENIS / smooth scrolling -->
<script src="https://unpkg.com/@studio-freight/lenis@1.0.25/bundled/lenis.min.js"></script>




  
  <!-- FIRST SECTION -->

  <section class="first-section">



  <!-- BACKGROUND VIDEO -->
  <video autoplay loop muted class="background-video">
    <source src="/videos/new2.mp4" type="video/mp4">
    Your browser does not support the video tag.
  </video>



<!-- HORIZONTAL SCROLLING -->

  <div class="scrolling-brands">
    <div class="brands-wrapper">
      <div class="brands">PAGANI <img src="/images/Pagani-Logo-PNG-Clipart-Background.png" alt="pagani logo" class="pagani"> KOENIGSEGG <img src="/images/koenigsegg.png" alt="koenigsegg logo" class="koenigsegg"> LAMBORGHINI <img src="/images/lambo.png" alt="lamborghini logo" class="lambo"> BUGATTI <img src="/images/bugatti.png" alt="bugatti logo" class="bugatti"> </div>
      <div class="brands">  FERRARI <img src="/images/ferrari.png" alt="ferrari logo" class="ferrari"> APOLLO <img src="/images/Aurelia Logo-01.png" alt="aurelia logo" class="aurelia"> BMW <img src="/images/bmw.png" alt="bmw logo" class="bmw"> MERCEDES <img src="/images/mercedes.png" alt="mercedes logo" class="mercedes"></div>
      <div class="brands"> <img src="/images/nissan.png" alt="nissan logo" class="nissan"> NISSAN <img src="/images/toyota.png" alt="toyota logo" class="toyota"> TOYOTA <img src="/images/mclaren.png" alt="mclaren logo" class="mclaren"> MCLAREN <img src="/images/porsche.png" alt="porsche logo" class="porsche"> PORSCHE <img src="/images/Aurelia Logo-01.png" alt="aurelia logo" class="aurelia"></div> 

      <div class="brands">PAGANI <img src="/images/Pagani-Logo-PNG-Clipart-Background.png" alt="pagani logo" class="pagani"> KOENIGSEGG <img src="/images/koenigsegg.png" alt="koenigsegg logo" class="koenigsegg"> LAMBORGHINI <img src="/images/lambo.png" alt="lamborghini logo" class="lambo"> BUGATTI <img src="/images/bugatti.png" alt="bugatti logo" class="bugatti"> </div>
      <div class="brands">  FERRARI <img src="/images/ferrari.png" alt="ferrari logo" class="ferrari"> APOLLO <img src="/images/Aurelia Logo-01.png" alt="aurelia logo" class="aurelia"> BMW <img src="/images/bmw.png" alt="bmw logo" class="bmw"> MERCEDES <img src="/images/mercedes.png" alt="mercedes logo" class="mercedes"></div>
      <div class="brands"> <img src="/images/nissan.png" alt="nissan logo" class="nissan"> NISSAN <img src="/images/toyota.png" alt="toyota logo" class="toyota"> TOYOTA <img src="/images/mclaren.png" alt="mclaren logo" class="mclaren"> MCLAREN <img src="/images/porsche.png" alt="porsche logo" class="porsche"> PORSCHE <img src="/images/Aurelia Logo-01.png" alt="aurelia logo" class="aurelia"></div> 

    </div>
  </div>
  

  <!-- BACKGROUND OVERLAY -->
  <!-- this adds a glass like layer above the background video for better visuals -->
  <div class="background-overlay"></div>


  <!-- MAIN TITLE -->
  <!-- this is the title/text for landing page -->
  <div class="text-container">
    <h3>AULERIA MOTORS: THE EPITOME OF LUXURY</h3>
    <h1>DRIVE THE EXTRAORDINARY</h1>
    <a href="#" class="next-page-button"><i class="fa-solid fa-angles-right"></i></a>
  </div>
  


  <!-- NAVIGATION BAR -->
  <div class="navbar">
    <!-- Hamburger menu -->
    <div class="hamburger" id="hamburger">
      <span></span>
      <span></span>
      <span></span>
    </div>
  
    <!-- BRAND LOGO -->
    <div class="logo">
      <img src="/images/aurelia white.png" alt="Pagani Logo">
    </div>
  </div>
  
  <!-- NAVIGATION LINKS (SIDE-MENU) -->
  <div class="side-menu" id="sideMenu">
    <div>

      <!-- SIDE-MENU LOGO -->
      <div class="side-logo">
        <img src="/images/aurelia white.png" alt="Pagani Logo">
      </div>

      <!-- NAV LINKS -->
      <nav>
        <a href="#">HOME</a>

        <!-- DROP DOWN MENU -->
        <div class="dropdown">
          <a href="#" class="dropdown-toggle">CARS</a>
          <div class="dropdown-menu">
            <a href="#">EXOTIC CARS</a>
            <a href="#">HYPERCARS</a>
            <a href="#">JDM CARS</a>
            <a href="#">SPECIAL CARS</a>
          </div>
        </div>
      
        <a href="#">BLOG</a>
        <a href="#">CART</a>
        <a href="#">CLUB</a>
        <a href="#">PODCAST</a>
        <a href="#">DEALERS</a>
        <a href="#">VISIT US</a>
        <a href="#">CONTACT US</a>
        <a href="#">AURELIA STORE</a>
        <a href="#">SIGN IN</a>
        <a href="#">REGISTER</a>
        <a href="#">HISTORY</a>

      </nav>
      
    </div>

    <!-- HORIZONTAL LINE FOR DESIGN -->
    <div class="side-border"></div>

    <!-- LANGUAGE AND MEDIA LINKS -->
    <div class="bottom-section">
      <div class="language">
        <span>ITALIANO</span>
        <span>ENGLISH</span>
      </div>

      <!-- SOCIAL LINKS -->
      <div class="socials">
        <a href="#"><i class="fa-brands fa-facebook"></i></a>
        <a href="#"><i class="fa-brands fa-square-instagram"></i></a>
        <a href="#"><i class="fa-brands fa-x-twitter"></i></a>
        <a href="#"><i class="fa-brands fa-youtube"></i></a>
      </div>
    </div>
  </div>

<!-- SIDE-MENU ACTIVATED OVERLAY -->
<!-- this creates a layer of dark overlay when the side-menu is opened for better visual -->
  <div class="overlay" id="overlay"></div>


  <!-- footer text code for first section -->
  <div class="footer-text">
    2025 AURELIA SP. C rights reserved - PIVA 2048183unio- credits All rights reserved. VAT no. It 282008648212
  </div>

</section>

<!-- FIRST SECTION ENDS HERE -->









  <!-- SECOND SECTION OF MAIN PAGE -->



  <section class="second-section">
    <div class="second-container">

      <h2 class="second-heading">"Experience the Pinnacle of Performance,Luxury, and Exclusivity"</h2>
      <a href="#" class="discover-button">DISCOVER NOW</a>


      <div class="nilu">
        Nilu 27 – Born for the Bold, Engineered to Leave the Rest Behind
      </div>

    </div>
  </section>

  <!-- SECOND SECTION OF MAIN PAGE ENDS HERE -->





  <!-- THIRD SECTION -->

  <section class="third-section">
    <h1>AURELIA PRESENTS</h1>
  </section>

  <!-- THIRD SECTION END -->






  <!-- FOURTH SECTION -->

  <section class="fourth-section">

    <video autoplay muted loop playsinline class="bg-video">
      <source src="/videos/KOENIGSEGG Jesko Absolut.mp4" type="video/mp4" />
      Your browser does not support the video tag.
    </video>

    <div class="video-overlay"></div>

      <div class="fourth-content">
        <h1>A RECORD-BREAKING FORCE OF NATURE</h1>
        <p>Koenigsegg Shatters the 400km/hr Record. A triumph of passion,speed and performance.</p>
        <button class="watch-fourth-section">WATCH NOW</button>
      </div>

  </section>

  <!-- FOURTH SECTION END -->







  <!-- FIFTH SECTION CODE -->

  <section class="fifth-section">

    <div class="fifth-content">
      <h1>OUR LUXURY CARS</h1>
      <p>The quintessence of luxury and speed</p>
    </div>

  </section>

  <!-- FIFTH SECTION CODE END -->








  <!-- SIXTH SECTION CODE -->

  <section class="sixth-section">

    <div class="car-cards-container">

      <!-- card 1 -->
      <div class="car-card">
        <div class="car-image-container">
          <img src="/images/sixth section images/1.jpg" alt="Nilu 27" class="car-image" />
        </div>
  
        <div class="car-info">
          <h2 class="car-title">EXOTIC SPORT</h2>
          <p class="car-description">
            A perfect mix of style, agility, and power, delivering an exhilarating yet refined drive.
          </p>
          <button class="discover-btn">BROWSE</button>
        </div>
      </div>


      <!-- card 2 -->
      <div class="car-card">
        <div class="car-image-container">
          <img src="/images/sixth section images/2.jpg" alt="Nilu 27" class="car-image" />
        </div>
  
        <div class="car-info">
          <h2 class="car-title">EXOTIC CARS</h2>
          <p class="car-description">
            Ultra-rare, high-performance masterpieces that combines luxury and innovation.
          </p>
          <button class="discover-btn">BROWSE</button>
        </div>
      </div>


      <!-- card 3 -->
      <div class="car-card">
        <div class="car-image-container">
          <img src="/images/sixth section images/3.jpg" alt="Nilu 27" class="car-image" />
        </div>
  
        <div class="car-info">
          <h2 class="car-title">SUPER CARS</h2>
          <p class="car-description">
            Blazing speed, cutting-edge aerodynamics, and track-ready performance in an elite package.
          </p>
          <button class="discover-btn">BROWSE</button>
        </div>
      </div>

    </div>

  </section>

  <!-- SIXTH SECTION CODE ENDS HERE -->









  <!-- SEVENTH SECTION CODE -->

  <section class="seventh-section">

    <div class="seventh-content">
      <h1>AULERIA</h1>
    </div>

  </section>







  <!-- EIGHTH SECTION CODE -->
  <section class="eighth-section">
    <div class="footer-container">
      <div class="footer-left">
        <h3>Discover</h3>
        <ul>
          <li><a href="#">DISCOVER Auleria</a></li>
          <li><a href="#">Exotic Sports Cars</a></li>
          <li><a href="#">Exotic Super Cars</a></li>
          <li><a href="#">Super Cars</a></li>
          <li><a href="#">Customer Service</a></li>
        </ul>
      </div>
  
      <div class="footer-center">
        <h3>Legal</h3>
        <ul>
          <li><a href="#">Legal Notices</a></li>
          <li><a href="#">Privacy Policy</a></li>
          <li><a href="#">Cookie Policy</a></li>
          <li><a href="#">Contact Us</a></li>
        </ul>
      </div>
  
      <div class="footer-right">
        <h3>Additional Links</h3>
        <ul>
          <li><a href="#">Blog</a></li>
          <li><a href="#">Cart</a></li>
          <li><a href="#">Sign In</a></li>
          <li><a href="#">History</a></li>
        </ul>
  
        <div class="social-icons">
          <a href="#" class="social-icon"><i class="fa-brands fa-facebook"></i></a>
          <a href="#" class="social-icon"><i class="fa-brands fa-square-instagram"></i></a>
          <a href="#" class="social-icon"><i class="fa-brands fa-x-twitter"></i></a>
          <a href="#" class="social-icon"><i class="fa-brands fa-youtube"></i></a>
        </div>
      </div>
    </div>
  
    <div class="footer-bottom">
      <p>© 2025 AULERIA Automobiles S.A.S. All rights reserved. Copyright ©</p>
    </div>
  </section>
  
  
  



  <!-- JAVASCRIPT LINK -->
  <script src="/js/main.js"></script>




  
</body>


</html>