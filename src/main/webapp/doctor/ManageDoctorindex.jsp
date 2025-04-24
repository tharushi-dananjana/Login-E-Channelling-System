<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
String name = (String) session.getAttribute("name");
String picture = (String) session.getAttribute("filename");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Doctor Dashboard</title>
<script src="https://kit.fontawesome.com/9449774243.js"
	crossorigin="anonymous"></script>
<script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 text-gray-800">

	<!-- Sidebar -->
	<div class="flex min-h-screen">
		<aside class="w-64 bg-[#0f172a] text-white flex flex-col">
			<div class="p-4 text-xl font-semibold">Doctor Dashboard</div>
			<nav class="p-4 space-y-6">
				<!-- changed from space-y-4 to space-y-6 -->
				<a href="#" class="flex items-center space-x-2 hover:text-blue-400">
					<i class="fas fa-tachometer-alt"></i><span>Dashboard</span>
				</a> <a href="#" class="flex items-center space-x-2 hover:text-blue-400">
					<i class="fas fa-users"></i><span>Doctor</span>
				</a> <a href="#" class="flex items-center space-x-2 hover:text-blue-400">
					<i class="fas fa-cog"></i><span>Settings</span>
				</a>
			</nav>
		</aside>


		<!-- Main content area -->
		<div class="flex-1 flex flex-col">

			<!-- Top Bar -->
			<header
				class="flex justify-between items-center bg-white p-4 shadow-md">
				<h1 class="text-xl font-semibold">Manage Record</h1>
				<div class="flex items-center space-x-4">
					<div class="flex items-center space-x-2">
						<img src="doctor/assets/picture/<%= picture %>" alt="Admin Profile"
							class="w-11 h-11 rounded-full object-cover"> <span
							class="text-gray-700"><%= name %></span>
					</div>
					<button
						class="px-4 py-2 bg-red-500 text-white rounded hover:bg-red-600">Logout</button>
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
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ID</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Picture</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
								<th
									class="px-8 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
								<th
									class="px-20 py-3 text-right text-xs font-medium text-gray-500 uppercase">Actions</th>
							</tr>
						</thead>

						<!-- Table Body -->
						<tbody class="divide-y divide-gray-100">
							<c:forEach var="doctor" items="${doctors}">
								<tr>
									<td class="px-6 py-4 whitespace-nowrap">${doctor.id}</td>
									<td class="border p-3 flex justify-center"><img src="doctor/assets/picture/${doctor.filename}" alt="Doctor Profile"
							        class="w-8 h-8 rounded-full object-cover"></td>
									<td class="px-6 py-4 whitespace-nowrap">${doctor.name}</td>
									<td class="px-6 py-4 whitespace-nowrap">${doctor.email}</td>
									<td class="px-6 py-4 whitespace-nowrap space-x-2">
										<button class="text-purple-400 hover:text-purple-300"
											onclick="window.location.href='doctor?action=edit&id=${doctor.id}';">Edit</button>
									</td>
									<td class="px-6 py-4 whitespace-nowrap space-x-2">
										<button onclick="showDeleteModal('${doctor.id}')"
											class="text-red-400 hover:text-red-300">Delete</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</main>
		</div>
	</div>
</body>
</html>