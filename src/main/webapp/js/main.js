// Navigation and Menu Functionality
document.addEventListener('DOMContentLoaded', () => {
    // Hamburger Menu Toggle
    const hamburger = document.getElementById('hamburger');
    const sideMenu = document.getElementById('sideMenu');
    const overlay = document.getElementById('overlay');

    hamburger.addEventListener('click', () => {
        hamburger.classList.toggle('active');
        sideMenu.classList.toggle('open');
        overlay.classList.toggle('hidden');
    });

    // Close menu when clicking overlay
    overlay.addEventListener('click', () => {
        hamburger.classList.remove('active');
        sideMenu.classList.remove('open');
        overlay.classList.add('hidden');
    });

    // Dropdown Menu Functionality
    const dropdowns = document.querySelectorAll('.dropdown');
    dropdowns.forEach(dropdown => {
        const toggle = dropdown.querySelector('.dropdown-toggle');
        const menu = dropdown.querySelector('.dropdown-menu');

        toggle.addEventListener('click', (e) => {
            e.preventDefault();
            menu.classList.toggle('hidden');
            const icon = toggle.querySelector('i');
            icon.classList.toggle('rotate-180');
        });
    });

    // Smooth Scrolling
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
});

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