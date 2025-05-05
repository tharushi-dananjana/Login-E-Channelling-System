<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Doctor Register</title>
    <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
</head>

<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white shadow-lg rounded-lg max-w-md w-full p-8">
        <div class="mb-6 text-center">
            <h1 class="text-3xl font-bold text-black">Doctor Register</h1>
        </div>

	   <c:if test="${not empty error}">
            <div class="bg-red-500/20 text-red-400 border border-red-500 rounded-lg p-4 mb-6">
                <p>${error}</p>
            </div>
        </c:if>


		<form action="#" method="POST" class="space-y-6" enctype="multipart/form-data">

			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Name</label>
				<input type="text" name="password" placeholder=""
					class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
			</div>

			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Email
					Address</label> <input type="email" name="email" placeholder=""
					class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
			</div>

			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
				<input type="password" name="password" placeholder=""
					class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
			</div>

			<!-- File Input for Picture -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Profile Picture</label>
                <div class="relative w-full">
                    <input type="file" id="filename" class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
                        name="filename" accept="image/*">
                </div>
            </div>

			<button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded font-semibold">Register</button>
			
        </form>
        
        <p class="text-center text-sm text-gray-600 mt-6">Is registration complete ?
        	<a href="${pageContext.request.contextPath}/doctor/DoctorRegister.jsp" class="text-blue-600 hover:underline">Login</a>
        </p>
        
    </div>
</body>
</html>