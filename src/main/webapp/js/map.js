// Initialize the map
function initMap() {
    // Create a map centered on a default location (e.g., New York)
    const map = L.map('map').setView([40.7128, -74.0060], 13);

    // Add OpenStreetMap tiles
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    // Add a marker for the showroom location
    const showroomMarker = L.marker([40.7128, -74.0060]).addTo(map);
    showroomMarker.bindPopup("<b>Luxury Car Showroom</b><br>Visit our exclusive collection");
}

// Call the initialization function when the page loads
document.addEventListener('DOMContentLoaded', initMap); 