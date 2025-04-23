<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Doctor</title>
    <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
    <script src="https://kit.fontawesome.com/9449774243.js" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
</head>

<body class="bg-gray-100 text-gray-800 min-h-screen flex">

    <!-- Sidebar -->
    <aside class="w-64 bg-[#0f172a] text-white flex flex-col">
        <div class="p-4 text-xl font-semibold">Doctor Dashboard</div>
        <nav class="p-4 space-y-6"> <!-- changed from space-y-4 to space-y-6 -->
            <a href="#" class="flex items-center space-x-2 hover:text-blue-400">
                <i class="fas fa-tachometer-alt"></i><span>Dashboard</span>
            </a>
            <a href="#" class="flex items-center space-x-2 hover:text-blue-400">
                <i class="fas fa-users"></i><span>Users</span>
            </a>
            <a href="#" class="flex items-center space-x-2 hover:text-blue-400">
                <i class="fas fa-cog"></i><span>Settings</span>
            </a>
        </nav>
    </aside>



    <!-- Main content area -->
    <div class="flex-1 flex flex-col min-h-screen overflow-auto">

        <!-- Top Bar -->
        <header class="flex justify-between items-center bg-white p-4 shadow-md">
            <h1 class="text-xl font-semibold">Edit Record</h1>
            <div class="flex items-center space-x-4">
                <div class="flex items-center space-x-2">
                    <img src="./asset/profile pic.jpg" alt="Admin Profile" class="w-11 h-11 rounded-full object-cover">
                    <span class="text-gray-700">Admin Name</span>
                </div>
                <button class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600">Logout</button>
            </div>
        </header>

        <!-- Form Container -->
        <main class="flex-grow flex justify-center items-start p-8">
            <div class="bg-white p-6 rounded shadow-md w-full max-w-xl">
                <h2 class="text-2xl font-semibold text-gray-800 text-center mb-6">Edit New Record</h2>
                <form action="#" method="POST" class="space-y-6">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                        <input type="text"
                            class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                        <input type="email"
                            class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Phone Number</label>
                        <input type="tel"
                            class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-1">Status</label>
                        <select
                            class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500">
                            <option value="active">Active</option>
                            <option value="inactive">Inactive</option>
                        </select>
                    </div>
                    <div class="flex justify-end space-x-4 pt-4">
                        <button type="reset"
                            class="bg-red-500 text-gray-700 px-4 py-2 rounded hover:bg-gray-300">Clear</button>
                        <button type="submit"
                            class="bg-blue-900 text-white px-6 py-2 rounded hover:bg-blue-300">Create</button>
                    </div>
                </form>
            </div>
        </main>
    </div>

</body>

</html>