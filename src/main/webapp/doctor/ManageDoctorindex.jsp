<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./partials/top.jsp"%>

<!-- Title -->
<title>Doctor Dashboard</title>

<%@ include file="./partials/middle.jsp"%>

<!-- Page Content -->
<main class="p-6">
	<div class="flex justify-between items-center mb-4">
		<h2 class="text-2xl font-bold">Record list</h2>
		<button class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700" 
			onclick="window.location.href='doctor?action=create';">+ Create New Record</button>
	</div>

	<div class="overflow-x-auto bg-white rounded shadow">
		<table class="min-w-full divide-y divide-gray-200">

			<!-- Table Header -->
			<thead class="bg-gray-50">
				<tr>
					<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ID</th>
					<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Picture</th>
					<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
					<th class="px-8 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
					<th class="px-20 py-3 text-right text-xs font-medium text-gray-500 uppercase">Actions</th>
				</tr>
			</thead>

			<!-- Table Body -->
			<tbody class="divide-y divide-gray-100">
				<c:forEach var="doctor" items="${doctors}">
					<tr>
						<td class="px-6 py-4 whitespace-nowrap">${doctor.id}</td>
						
						<td class="border p-3 flex justify-center">
						<img src="${pageContext.request.contextPath}/doctor/assets/picture/${doctor.filename}"
							alt="Doctor Profile" class="w-8 h-8 rounded-full object-cover"></td>
						<td class="px-6 py-4 whitespace-nowrap">${doctor.name}</td>
						<td class="px-6 py-4 whitespace-nowrap">${doctor.email}</td>
						<!-- Add button -->
						<td class="px-6 py-4 whitespace-nowrap space-x-2">
							<button class="text-purple-400 hover:text-purple-300"
    							onclick="window.location.href='doctor?action=edit&id=${doctor.id}';">Edit</button>
						</td>
						<td class="px-6 py-4 whitespace-nowrap space-x-2">
							<button class="text-red-400 hover:text-red-300" 
								onclick="confirmRedirect('doctor?action=delete&id=${doctor.id}')">Delete</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</main>


<script>
	function confirmRedirect(url) {
		if (confirm("Are you sure you want to delete this doctor?")) {
			window.location.href = url;
		}
	}
</script>
