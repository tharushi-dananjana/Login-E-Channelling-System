<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Doctor Registration | E-Channelling</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
</head>

<body class="bg-gray-100 min-h-screen flex items-center justify-center">
  <div class="bg-white shadow rounded p-4 max-w-sm w-full text-sm">
    <h2 class="text-xl font-semibold mb-4 text-center text-blue-600">Doctor Registration</h2>
    
       <c:if test="${not empty error}">
            <div class="bg-red-500/20 text-red-400 border border-red-500 rounded-lg p-4 mb-6">
                <p>${error}</p>
            </div>
        </c:if>

    <form action="${pageContext.request.contextPath}/t_doctor/DoctorRegister" method="POST" class="space-y-3" enctype="multipart/form-data">

      <!-- Full Name -->
      <div>
        <label class="block text-gray-700 mb-1">Full Name</label>
        <input type="text" name="full_name" required
               class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-1 focus:ring-blue-500"/>
      </div>

      <!-- Specialization -->
      <div>
        <label class="block text-gray-700 mb-1">Specialization</label>
        <input type="text" name="specialization" required
               class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-1 focus:ring-blue-500"/>
      </div>

      <!-- Email -->
      <div>
        <label class="block text-gray-700 mb-1">Email</label>
        <input type="email" name="email" required
               class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-1 focus:ring-blue-500"/>
      </div>
      
      <!-- Password -->
      <div>
        <label class="block text-gray-700 mb-1">Password</label>
        <input type="password" name="password" required
               class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-1 focus:ring-blue-500"/>
      </div>

			<!-- File Input for Picture -->
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Profile
					Picture</label>
				<div class="relative w-full">
					<input type="file" id="filename"
						class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500"
						name="filename" accept="image/*">
				</div>
			</div>

			<!-- Phone Number -->
      <div>
        <label class="block text-gray-700 mb-1">Phone Number</label>
        <input type="tel" name="phone" required
               class="w-full border border-gray-300 rounded px-2 py-1 focus:outline-none focus:ring-1 focus:ring-blue-500"/>
      </div>

      <!-- License Active Status -->
      <div>
        <span class="block text-gray-700 mb-1">Is your license active?</span>
        <div class="flex items-center space-x-4">
          <label class="inline-flex items-center">
            <input type="radio" name="license_active" value="yes" required
                   class="form-radio text-blue-600 focus:ring-blue-500 h-4 w-4" />
            <span class="ml-1 text-gray-700">Yes</span>
          </label>
          <label class="inline-flex items-center">
            <input type="radio" name="license_active" value="no" required
                   class="form-radio text-blue-600 focus:ring-blue-500 h-4 w-4" />
            <span class="ml-1 text-gray-700">No</span>
          </label>
        </div>
      </div>

      <!-- Submit Button -->
      <div class="text-center">
        <button type="submit" class="bg-blue-600 text-white px-4 py-1.5 rounded hover:bg-blue-700 text-sm">Register</button>
      </div>
     
    </form>
  </div>
</body>
</html>
