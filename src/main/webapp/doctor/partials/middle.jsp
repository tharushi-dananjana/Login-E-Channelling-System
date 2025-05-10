<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="https://kit.fontawesome.com/9449774243.js" crossorigin="anonymous"></script>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="icon" href="/favicon.ico" type="image/x-icon">

<body class="bg-gray-100 text-gray-800">

	<div class="flex min-h-screen">
		<aside class="w-64 bg-[#0f172a] text-white flex flex-col">
			<div class="p-4 text-xl font-semibold">Doctor Dashboard</div>
			<nav class="p-4 space-y-6">
				<!-- changed from space-y-4 to space-y-6 -->
				<a href="" class="flex items-center space-x-2 hover:text-blue-400">
					<i class="fas fa-tachometer-alt"></i><span>Manage Doctors</span>
				</a> 
					
				<a href="" class="flex items-center space-x-2 hover:text-blue-400">
					<i class="fas fa-users"></i><span>Manage Users</span>
				</a> 
					
				<a href="#" class="flex items-center space-x-2 hover:text-blue-400"> 
					<i class="fas fa-calendar-check"></i><span>Appointment Management</span>
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
						<img src="doctor/assets/picture/${doctor.filename}" class="w-11 h-11 rounded-full object-cover">
							<span class="text-gray-700">${sessionScope.name}</span>
					</div>
					
					<button
						class="px-4 py-2 bg-green-600 text-white rounded hover:bg-green-600"
						onclick="window.location.href='doctor?action=logout';">Logout
					</button>
				</div>
			</header>