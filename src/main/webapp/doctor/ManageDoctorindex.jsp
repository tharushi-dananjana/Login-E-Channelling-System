<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="./partials/header.jsp"%>

<%@ include file="./partials/top.jsp"%>

<!-- Title -->
<title>Doctor Dashboard</title>


<%@ include file="./partials/middle.jsp"%>


<!-- Page Content -->
<main class="p-6">
	<div class="flex justify-between items-center mb-4">
		<h2 class="text-2xl font-bold">Record list</h2>
		<button class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-600" 
			onclick="window.location.href='doctor?action=create';">+ Create New Record</button>
	</div>

	<!-- ✅ Search Form -->
	
		<input type="text" id="searchInput" placeholder="Search Doctor by Name"
			class="border px-3 py-2 rounded mr-2" />
		<button type="submit"
			class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-600">Search</button>
	
	
	

	<div class="overflow-x-auto bg-white rounded shadow">
		<table class="min-w-full divide-y divide-gray-200">

			<!-- Table Header -->
			<thead class="bg-gray-50">
				<tr>
					<th class="px-6 py-3 text-left text-xs font-medium text-gray-600 uppercase">ID</th>
					<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Picture</th>
					<th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
					<th class="px-8 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
					
					<th class="px-8 py-3 text-right text-xs font-medium text-gray-500 uppercase">Actions</th>
				</tr>
			</thead>

			<!-- Table Body -->
			<tbody class="divide-y divide-gray-100">
				<c:forEach var="doctor" items="${doctors}">
					<tr>
						<td class="px-6 py-4 whitespace-nowrap">${doctor.id}</td>

						<td class="border p-3 flex justify-center"><img
							src="${pageContext.request.contextPath}/doctor/assets/picture/${doctor.filename}"
							alt="Doctor Profile" class="w-10 h-10 rounded-full object-cover">
						</td>

						<td class="px-6 py-4 whitespace-nowrap">${doctor.name}</td>
						<td class="px-6 py-4 whitespace-nowrap">${doctor.email}</td>
						

						<td class="px-8 py-4 whitespace-nowrap">
							<div class="flex justify-end space-x-2">
								<button
									class="bg-green-600 text-white px-3 py-1 rounded hover:bg-green-600 transition"
									onclick="promptPasswordAndRedirect(${doctor.id});">
									Edit</button>

								<button
									class="bg-blue-600 text-white px-3 py-1 rounded hover:bg-blue-600 transition"
									onclick="promptPasswordAndDelete(${doctor.id});">
									Delete</button>

							</div>
						</td>

					</tr>

				</c:forEach>
			</tbody>
		</table>
		
	</div>
</main>



<script>
function promptPasswordAndRedirect(doctorId) {
    const password = prompt("Please enter your password to edit this record:");
    if (password === null) return; // User clicked Cancel

    fetch('doctor?action=verify&id=' + doctorId + '&password=' + encodeURIComponent(password))
        .then(response => {
            if (response.ok) {
                window.location.href = 'doctor?action=edit&id=' + doctorId;
            } else if (response.status === 401) {
                alert("Password incorrect. You are not allowed to edit this record.");
            } else {
                alert("An error occurred.");
            }
        });
}
</script>

<script>
function promptPasswordAndDelete(doctorId) {
    const password = prompt("Please enter your password to delete this record:");
    if (password === null) return; // Cancel clicked

    fetch('doctor?action=verifyAndDelete&id=' + doctorId + '&password=' + encodeURIComponent(password))
        .then(response => {
            if (response.ok) {
                alert("Record deleted successfully.");
                location.reload(); // Reload the page to reflect deletion
            } else if (response.status === 401) {
                alert("Incorrect password. Deletion not allowed.");
            } else {
                alert("An error occurred while deleting.");
            }
        });
}
</script>


<script>
function filterTable() {
    var input = document.getElementById("searchInput");
    var filter = input.value.toUpperCase();
    var table = document.querySelector("table");
    var tr = table.getElementsByTagName("tr");

    for (var i = 1; i < tr.length; i++) { // skip header
        var td = tr[i].getElementsByTagName("td");
        var rowMatches = false;

        for (var j = 0; j < td.length; j++) {
            if (td[j]) {
                var txtvalue = td[j].textContent || td[j].innerText;
                if (txtvalue.toUpperCase().indexOf(filter) > -1) {
                    rowMatches = true;
                    break;
                }
            }
        }

        tr[i].style.display = rowMatches ? "" : "none";
    }
}
document.getElementById("searchInput").addEventListener("input" , filterTable);	
</script>

<script>
	function confirmRedirect(url) {
		if (confirm("Are you sure you want to delete this doctor?")) {
			window.location.href = url;
		}
	}
</script>

<%@ include file="./partials/footer.jsp"%>