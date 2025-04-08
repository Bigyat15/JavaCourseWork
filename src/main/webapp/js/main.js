// Menu functionality
const hamburger = document.getElementById('hamburger');
const sideMenu = document.getElementById('sideMenu');
const overlay = document.getElementById('overlay');
const dropdownToggle = document.querySelectorAll('.dropdown-toggle');

// Toggle the hamburger and side menu on click
hamburger.addEventListener('click', () => {
  hamburger.classList.toggle('active');
  sideMenu.classList.toggle('open');
  overlay.classList.toggle('hidden');
});

// Close the side menu and hamburger when clicking the overlay
overlay.addEventListener('click', () => {
  hamburger.classList.remove('active');
  sideMenu.classList.remove('open');
  overlay.classList.add('hidden');
});

// Dropdown toggle on click (for mobile compatibility)
dropdownToggle.forEach((toggle) => {
  toggle.addEventListener('click', function (e) {
    e.preventDefault();
    const dropdownMenu = this.nextElementSibling;
    dropdownMenu.classList.toggle('hidden');
    this.querySelector('i').classList.toggle('rotate-180');
  });
});

// Close dropdown if it's open when clicking outside
document.addEventListener('click', (event) => {
  if (!event.target.closest('.dropdown')) {
    document.querySelectorAll('.dropdown-menu').forEach((menu) => {
      menu.classList.add('hidden');
    });
    document.querySelectorAll('.dropdown-toggle i').forEach((icon) => {
      icon.classList.remove('rotate-180');
    });
  }
});

// Smooth scrolling
const lenis = new Lenis({
  duration: 0.8,
  easing: (t) => Math.sin((t * Math.PI) / 2),
  smooth: true
});

function raf(time) {
  lenis.raf(time);
  requestAnimationFrame(raf);
}

requestAnimationFrame(raf);