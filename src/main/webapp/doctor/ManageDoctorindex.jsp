<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Doctor Dashboard</title>
    <script src="https://kit.fontawesome.com/9449774243.js" crossorigin="anonymous"></script>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

    <!-- Sidebar -->
    <div class="flex min-h-screen">
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
        <div class="flex-1 flex flex-col">

            <!-- Top Bar -->
            <header class="flex justify-between items-center bg-white p-4 shadow-md">
                <h1 class="text-xl font-semibold">Manage Record</h1>
                <div class="flex items-center space-x-4">
                    <div class="flex items-center space-x-2">
                        <img src="./asset/profile pic.jpg" alt="Admin Profile" class="w-11 h-11 rounded-full object-cover">
                        <span class="text-gray-700">Admin Name</span>
                    </div>
                    <button class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600">
                        Logout
                    </button>
                </div>
            </header>

            <!-- Page Content -->
            <main class="p-6">
                <div class="flex justify-between items-center mb-4">
                    <h2 class="text-2xl font-bold">Record list</h2>
                    <button class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">+ Create New Record</button>
                </div>

                <div class="overflow-x-auto bg-white rounded shadow">
                    <table class="min-w-full divide-y divide-gray-200">

                        <!-- Table Header -->
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
                                <th class="px-8 py-3 text-left text-xs font-medium text-gray-500 uppercase">Role</th>
                                <th class="px-20 py-3 text-right text-xs font-medium text-gray-500 uppercase">Actions
                                </th>
                            </tr>
                        </thead>

                        <!-- Table Body -->
                        <tbody class="divide-y divide-gray-100">
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">1</td>
                                <td class="px-6 py-4 whitespace-nowrap">Jane Doe</td>
                                <td class="px-6 py-4 whitespace-nowrap">jane@example.com</td>
                                <td class="px-6 py-4 whitespace-nowrap">Admin</td>
                                <td class="px-6 py-4 whitespace-nowrap text-right">
                                    <div class="flex justify-end items-center space-x-2">
                                        <button class="bg-blue-100 text-blue-600 px-3 py-1 rounded hover:bg-yellow-200 text-sm flex items-center space-x-1">
                                            <i class="fas fa-edit"></i>
                                            <span>Edit</span>
                                        </button>
                                        <button class="bg-red-100 text-red-600 px-3 py-1 rounded hover:bg-green-200 text-sm flex items-center space-x-1">
                                            <i class="fas fa-trash-alt"></i>
                                            <span>Delete</span>
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    </div>
</body>
</html>