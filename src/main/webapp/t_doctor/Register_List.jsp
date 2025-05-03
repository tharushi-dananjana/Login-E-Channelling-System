<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<title>Registered Doctor</title>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="icon" href="/favicon.ico" type="image/x-icon">
</head>
<body class="bg-gray-100 text-gray-800">

	<div class="flex min-h-screen">
		<aside class="w-64 bg-[#0f172a] text-white flex flex-col">
			<div class="p-4 text-xl font-semibold">Doctor Dashboard</div>
			<nav class="p-4 space-y-6">
				<!-- changed from space-y-4 to space-y-6 -->
				<a href="#" class="flex items-center space-x-2 hover:text-blue-400">
					<i class="fas fa-tachometer-alt"></i><span>Manage Doctors</span>
				</a> <a href="#" class="flex items-center space-x-2 hover:text-blue-400">
					<i class="fas fa-users"></i><span>Manage Users</span>
				</a> <a href="#" class="flex items-center space-x-2 hover:text-blue-400">
					<i class="fas fa-calendar-check"></i><span>Appointment
						Management</span>
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
				<h1 class="text-xl font-semibold">Registered Doctors</h1>

			</header>

			<main class="p-6">
				<div class="flex justify-between items-center mb-4">


					<table class="min-w-full divide-y divide-gray-200">
						<thead>
							<tr class="bg-gray-50">
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ID</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Full
									Name</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Specialization</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>

								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Picture</th>

								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Phone</th>
								<th
									class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">License
									Active</th>
							</tr>
						</thead>
						<tbody class="divide-y divide-gray-100">
							<c:forEach var="doctor" items="${doctors}">
								<tr>
									<td class="px-6 py-4 whitespace-nowrap">${t_doctor.id}</td>
									<td class="border px-4 py-2">${doctor.name}</td>
									<td class="border px-4 py-2">${doctor.specialization}</td>
									<td class="border px-4 py-2">${doctor.email}</td>
									<td>
									<img src="${pageContext.request.contextPath}/doctor/assets/picture/${doctor.filename}"
										alt="Doctor Profile" class="w-8 h-8 rounded-full object-cover">
									</td>
									<td class="border px-4 py-2">${doctor.phone}</td>
									<td class="border px-4 py-2"><c:choose>
											<c:when test="${doctor.licenseActive}">Yes</c:when>
											<c:otherwise>No</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</main>
</html>
