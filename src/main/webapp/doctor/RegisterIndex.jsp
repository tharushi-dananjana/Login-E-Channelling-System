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
	</div>

	<div class="overflow-x-auto bg-white rounded shadow">
		<table class="min-w-full divide-y divide-gray-200">

			<!-- Table Header -->
			<thead class="bg-gray-50">
				<tr>
					<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
					<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Specialization</th>
					<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
					<th class="px-8 py-3 text-left text-xs font-medium text-gray-500 uppercase">Number</th>
					<th class="px-20 py-3 text-right text-xs font-medium text-gray-500 uppercase">licenseActive</th>
				</tr>
			</thead>

			<!-- Table Body -->
			<tbody class="divide-y divide-gray-100">
				<c:forEach var="doctor" items="${doctors}">
					<tr>
						<td class="px-6 py-4 whitespace-nowrap">${doctor.name}</td>
						<td class="border p-3 flex justify-center">${doctor.specialization}</td>
						<td class="px-6 py-4 whitespace-nowrap">${doctor.email}</td>
						<td class="px-6 py-4 whitespace-nowrap">${doctor.number}</td>
						<td class="px-6 py-4 whitespace-nowrap">${doctor.licenseActive}</td>
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
