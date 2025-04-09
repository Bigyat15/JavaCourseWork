// Menu functionality
const hamburger = document.getElementById('hamburger');
const sideMenu = document.getElementById('sideMenu');
const overlay = document.getElementById('overlay');
const dropdownToggles = document.querySelectorAll('.dropdown-toggle');

// Toggle mobile menu
hamburger.addEventListener('click', () => {
  hamburger.classList.toggle('active');
  sideMenu.classList.toggle('open');
  overlay.classList.toggle('hidden');
  document.body.classList.toggle('overflow-hidden');
});

// Close menu when clicking overlay
overlay.addEventListener('click', () => {
  hamburger.classList.remove('active');
  sideMenu.classList.remove('open');
  overlay.classList.add('hidden');
  document.body.classList.remove('overflow-hidden');
});

// Dropdown functionality
dropdownToggles.forEach(toggle => {
  toggle.addEventListener('click', (e) => {
    e.preventDefault(); // Prevent default link behavior
    e.stopPropagation(); // Stop event from bubbling up
    const dropdown = toggle.nextElementSibling;
    const arrow = toggle.querySelector('i');
    
    dropdown.classList.toggle('hidden');
    arrow.classList.toggle('rotate-180');
  });
});

// Smooth scrolling with Lenis
const lenis = new Lenis({
  duration: 1.2,
  easing: (t) => Math.min(1, 1.001 - Math.pow(2, -10 * t)),
  direction: 'vertical',
  gestureDirection: 'vertical',
  smooth: true,
  smoothTouch: false,
  touchMultiplier: 2,
});

function raf(time) {
  lenis.raf(time);
  requestAnimationFrame(raf);
}

requestAnimationFrame(raf);

// Close menu when clicking outside the menu
document.addEventListener('click', (e) => {
  // Check if the click is outside both the side menu and hamburger
  // Also check if the click is not on a dropdown menu item
  if (!sideMenu.contains(e.target) && 
      !hamburger.contains(e.target) && 
      !e.target.closest('.dropdown-menu')) {
    hamburger.classList.remove('active');
    sideMenu.classList.remove('open');
    overlay.classList.add('hidden');
    document.body.classList.remove('overflow-hidden');
  }
}); 