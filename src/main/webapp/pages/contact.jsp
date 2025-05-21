<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Luxury Cars</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        .focus\:ring-gold:focus {
            box-shadow: 0 0 0 2px #FFD700;
        }
    </style>
</head>
<body class="bg-gray-900 text-white font-sans antialiased">

    
    <section class="py-24 text-center bg-gradient-to-r from-black via-gray-800 to-black">
        <div class="container mx-auto">
            <h2 class="text-5xl font-bold text-gold mb-4 tracking-tight">Get In Touch</h2>
            <p class="text-lg text-gray-400 mb-12">We’d love to hear from you! Whether you have a question or need support, reach out to us.</p>
        </div>
    </section>

    <!-- Contact Form Section -->
    <section class="py-16 bg-gray-800">
        <div class="container mx-auto text-center">
            <h3 class="text-3xl font-semibold text-white mb-8">Contact Us</h3>

            <form action="#" method="POST" class="w-full max-w-xl mx-auto bg-gray-700 p-8 rounded-xl shadow-lg">
                <!-- Name Field -->
                <div class="mb-6">
                    <label for="name" class="block text-lg text-gray-200 mb-2">Your Full Name</label>
                    <input type="text" id="name" name="name" class="w-full px-4 py-3 rounded-lg bg-gray-600 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gold transition duration-300" placeholder="John Doe" required>
                </div>

                <!-- Email Field -->
                <div class="mb-6">
                    <label for="email" class="block text-lg text-gray-200 mb-2">Email Address</label>
                    <input type="email" id="email" name="email" class="w-full px-4 py-3 rounded-lg bg-gray-600 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gold transition duration-300" placeholder="youremail@domain.com" required>
                </div>

                <!-- Message Field -->
                <div class="mb-6">
                    <label for="message" class="block text-lg text-gray-200 mb-2">Your Message</label>
                    <textarea id="message" name="message" rows="4" class="w-full px-4 py-3 rounded-lg bg-gray-600 text-white placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-gold transition duration-300" placeholder="Your message here..." required></textarea>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="w-full py-3 bg-gold text-black font-semibold rounded-lg hover:bg-yellow-500 transition duration-300 focus:outline-none">
                    Send Message
                </button>
            </form>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-black py-6 mt-24 text-center">
        <p class="text-gray-400">© 2025 Luxury Cars. All rights reserved.</p>
    </footer>

</body>
</html>
