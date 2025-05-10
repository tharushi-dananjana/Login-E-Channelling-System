<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Doctor Login</title>
    <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet" />

    <style>
        body {
            font-family: 'Inter', sans-serif;
        }
    </style>

    <script>
        function validateLoginForm() {
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value.trim();

            if (email === "" || password === "") {
                alert("Need the Email and Password");
                return false;
            }

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                alert("Email format is incorrect");
                return false;
            }

            return true;
        }
    </script>
</head>

<body class="bg-gray-100 min-h-screen flex flex-col">

<!-- Header -->
<header class="bg-white shadow">
   <%@ include file="./partials/header.jsp"%> 
</header>

<!-- Main Login Box -->
<main class="flex-grow flex items-center justify-center px-4">
    <div class="bg-white shadow-lg rounded-lg max-w-md w-full p-8 mt-10 mb-10">
        <div class="mb-6 text-center">
            <h1 class="text-3xl font-bold text-gray-900">Doctor Login</h1>
            <p class="text-gray-600">Please sign in to your dashboard</p>
        </div>

        <c:if test="${not empty error}">
            <div class="bg-red-500/10 text-red-600 border border-red-500 rounded p-4 mb-4 text-sm">
                <p>${error}</p>
            </div>
        </c:if>

        <form action="${pageContext.request.contextPath}/doctor/DoctorLogin" method="POST"
              onsubmit="return validateLoginForm()" class="space-y-6">

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                <input id="email" type="email" name="email" placeholder="you@example.com"
                       class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>

            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input id="password" type="password" name="password" placeholder="******"
                       class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>

            <div class="flex items-center justify-between text-sm">
                <label class="flex items-center space-x-2">
                    <input type="checkbox" class="accent-blue-600" />
                    <span>Remember me</span>
                </label>
                <a href="#" class="text-blue-600 hover:underline">Forgot Password?</a>
            </div>

            <button type="submit"
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded font-semibold">
                Login
            </button>
        </form>

        <p class="text-center text-sm text-gray-600 mt-6">
            Don’t have an account?
            <a href="${pageContext.request.contextPath}/DoctorRegister.jsp" class="text-blue-600 hover:underline">Register Now</a>
        </p>
    </div>
</main>

<!-- Footer -->
<footer class="bg-white border-t mt-auto">
    
        <%@ include file="./partials/footer.jsp" %>
    
</footer>

</body>
</html>
