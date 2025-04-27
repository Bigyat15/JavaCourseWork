<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-black min-h-screen">
<%@ include file="navbar.jsp" %>
<br>
<br>
    <div class="max-w-4xl mx-auto p-6">
        <div class="bg-white rounded-xl shadow-lg overflow-hidden">
            <div class="p-8">
                <h1 class="text-2xl font-bold text-gray-900 mb-6">User Profile</h1>
                
                <div class="space-y-6">
                    <!-- Name Field -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Full Name</label>
                        <p id="display-name" class="mt-1 text-sm text-gray-900">John Doe</p>
                        <input
                            id="input-name"
                            type="text"
                            class="mt-1 hidden w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2"
                            value="John Doe"
                        />
                    </div>

                    <!-- Email Field -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Email</label>
                        <p id="display-email" class="mt-1 text-sm text-gray-900">john.doe@example.com</p>
                        <input
                            id="input-email"
                            type="email"
                            class="mt-1 hidden w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2"
                            value="john.doe@example.com"
                        />
                    </div>

                    <!-- Phone Field -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Phone</label>
                        <p id="display-phone" class="mt-1 text-sm text-gray-900">+1 (555) 123-4567</p>
                        <input
                            id="input-phone"
                            type="tel"
                            class="mt-1 hidden w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2"
                            value="+1 (555) 123-4567"
                        />
                    </div>

                    <!-- Address Field -->
                    <div>
                        <label class="block text-sm font-medium text-gray-700">Address</label>
                        <p id="display-address" class="mt-1 text-sm text-gray-900">123 Main St, City, Country</p>
                        <input
                            id="input-address"
                            type="text"
                            class="mt-1 hidden w-full rounded-md border-gray-300 shadow-sm focus:border-indigo-500 focus:ring-indigo-500 sm:text-sm p-2"
                            value="123 Main St, City, Country"
                        />
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="mt-8 flex justify-end space-x-4">
                    <button
                        id="edit-button"
                        class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                        Edit Profile
                    </button>
                    <button
                        id="save-button"
                        class="hidden items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md shadow-sm text-white bg-indigo-600 hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                        Save
                    </button>
                    <button
                        id="cancel-button"
                        class="hidden items-center px-4 py-2 border border-gray-300 text-sm font-medium rounded-md shadow-sm text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                    >
                        Cancel
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        const editButton = document.getElementById('edit-button');
        const saveButton = document.getElementById('save-button');
        const cancelButton = document.getElementById('cancel-button');

        const fields = [
            { display: 'display-name', input: 'input-name' },
            { display: 'display-email', input: 'input-email' },
            { display: 'display-phone', input: 'input-phone' },
            { display: 'display-address', input: 'input-address' }
        ];

        let originalValues = {};

        editButton.addEventListener('click', () => {
            // Store original values
            fields.forEach(field => {
                const input = document.getElementById(field.input);
                originalValues[field.input] = input.value;
                document.getElementById(field.display).classList.add('hidden');
                input.classList.remove('hidden');
            });

            editButton.classList.add('hidden');
            saveButton.classList.remove('hidden');
            cancelButton.classList.remove('hidden');
        });

        saveButton.addEventListener('click', () => {
            // Update display with input values
            fields.forEach(field => {
                const input = document.getElementById(field.input);
                document.getElementById(field.display).textContent = input.value;
                document.getElementById(field.display).classList.remove('hidden');
                input.classList.add('hidden');
            });

            editButton.classList.remove('hidden');
            saveButton.classList.add('hidden');
            cancelButton.classList.add('hidden');
        });

        cancelButton.addEventListener('click', () => {
            // Restore original values
            fields.forEach(field => {
                const input = document.getElementById(field.input);
                input.value = originalValues[field.input];
                document.getElementById(field.display).classList.remove('hidden');
                input.classList.add('hidden');
            });

            editButton.classList.remove('hidden');
            saveButton.classList.add('hidden');
            cancelButton.classList.add('hidden');
        });
    </script>
</body>
</html>