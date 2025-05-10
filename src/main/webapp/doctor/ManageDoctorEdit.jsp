<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./partials/middle.jsp"%>
<%@ include file="./partials/top.jsp"%>

<title>Edit Doctor</title>

<!-- Form Container -->
<main class="flex-grow flex justify-center items-start p-8">
	<div class="bg-white p-6 rounded shadow-md w-full max-w-xl">
		<h2 class="text-2xl font-semibold text-gray-800 text-center mb-6">Doctor Profile</h2>
		<form action="doctor" method="POST" class="space-y-6" enctype="multipart/form-data" onsubmit="return validateForm(event)">
			<!-- Hidden Inputs for Action and Doctor ID -->
        	<input type="hidden" name="action" value="update">
        	<input type="hidden" name="id" value="${doctor.id}">
        	
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Name</label> 
				<input type="text" name="name" value="${doctor.name}" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
			</div>
			
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label> 
				<input type="email" name="email" value="${doctor.email}" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
			</div>
			
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Password</label> 
				<input type="password" name="password" value="${doctor.password}" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
			</div>
			
			
			
			<!-- File Input for Picture -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Profile Picture</label>
                <div class="relative w-full">
                    <input type="file" id="filename" value="${doctor.filename}" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                        name="filename" accept="image/*">
                </div>
            </div>
			
			<div class="flex justify-end space-x-3 pt-4">
				<button type="reset" class="bg-red-300 text-gray-700 px-6 py-2 rounded hover:bg-gray-300" onclick="window.location.href='doctor';">Cancel</button>
				<button type="submit" class="bg-blue-700 text-white px-6 py-2 rounded hover:bg-blue-300" onclick="window.location.href='doctor';">Save Record</button>
			</div>
		</form>
	</div>
</main>
<script>
    function validateForm(event) {
        const form = event.target;
        const name = form.name.value.trim();
        const email = form.email.value.trim();
        const password = form.password.value.trim();
        const fileInput = form.filename;

        if (!name) {
            alert("Enter your Name.");
            form.name.focus();
            event.preventDefault();
            return false;
        }

        if (!email || !email.includes("@")) {
            alert("Enter your Email completely and correctly.");
            form.email.focus();
            event.preventDefault();
            return false;
        }

        if (!password || password.length < 6) {
            alert("The password must be at least 6 characters long.");
            form.password.focus();
            event.preventDefault();
            return false;
        }

        // Optional: validate image file if necessary
        if (fileInput && fileInput.files.length > 0) {
            const file = fileInput.files[0];
            const allowedTypes = ["image/jpeg", "image/png"];
            if (!allowedTypes.includes(file.type)) {
                alert("please uplode .jpg, .png file only");
                event.preventDefault();
                return false;
            }
        }

        return true;
    }
</script>