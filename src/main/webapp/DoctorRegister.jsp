<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<script src="https://kit.fontawesome.com/9449774243.js" crossorigin="anonymous"></script>
<script src="https://cdn.tailwindcss.com"></script>
<link rel="icon" href="/favicon.ico" type="image/x-icon">

</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
<!-- Form Container -->
<main class="flex-grow flex justify-center items-start p-6">
	<div class="bg-white p-5 rounded shadow-md w-full max-w-md">
		<h2 class="text-2xl font-semibold text-gray-800 text-center mb-6">Doctor Register</h2>

		<form action="${pageContext.request.contextPath}/doctorRegister?action=create" method="POST" class="space-y-3" enctype="multipart/form-data">
			
			<!-- Hidden input for action -->
			<input type="hidden" name="action" value="create">
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label> 
				<input type="text" name="name" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
			</div>
			
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label> 
				<input type="email" name="email" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
			</div>
			
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Password</label> 
				<input type="tel" name="password" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
			</div>
			
			<!-- File Input for Picture -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Profile Picture</label>
                <div class="relative w-full">
                    <input type="file" id="filename" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                     name="filename" accept="image/*">
                </div>
            </div>			
			<div class="flex justify-end space-x-3 pt-4">
				<button type="reset" class="bg-red-300 text-gray-700 px-6 py-2 rounded hover:bg-gray-300">Cancel</button>
				<button type="submit" class="bg-blue-700 text-white px-6 py-2 rounded hover:bg-blue-300" onclick="window.location.href='doctor';">Create Record</button>
			</div>
			
		</form>
	</div>
</main>
</body>
</html>