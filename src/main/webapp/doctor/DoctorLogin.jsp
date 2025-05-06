<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Doctor Login</title>
    <link rel="shortcut icon" href="./assets/favicon.png" type="image/x-icon">
    <script src="https://cdn.tailwindcss.com"></script>
    
    <script>
        function validateLoginForm() {
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value.trim();

            if (email === "" || password === "") {
                alert(" Need the Email and Password ");
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

<body class="bg-gray-100 flex items-center justify-center min-h-screen">

    <div class="bg-white shadow-lg rounded-lg max-w-md w-full p-8">
        <div class="mb-6 text-center">
            <h1 class="text-3xl font-bold text-black">Doctor Login</h1>

            <p class="text-gray-600">Please sign in to your dashboard</p>
        </div>

	   <c:if test="${not empty error}">
            <div class="bg-red-500/20 text-red-400 border border-red-500 rounded-lg p-4 mb-6">
                <p>${error}</p>
            </div>
        </c:if>


		<form action="${pageContext.request.contextPath}/doctor/DoctorLogin" method="POST" class="space-y-6">
        
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                <input type="email" name="email" placeholder="you@example.com"
                    class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>
            
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input type="password" name="password" placeholder=""
                    class="w-full px-4 py-2 border border-gray-300 rounded focus:outline-none focus:ring-2 focus:ring-blue-500" />
            </div>
            
            <div class="flex items-center justify-between text-sm">
                <label class="flex items-center space-x-2">
                    <input type="checkbox" class="accent-blue-600" />
                    <span>Remember me</span>
                </label>
                <a href="#" class="text-blue-600 hover:underline">Forgot Password?</a>
            </div>
            
            <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white py-2 rounded font-semibold">Login</button>

        </form>

        <p class="text-center text-sm text-gray-600 mt-6"> Don’t have an account?
            <a href="${pageContext.request.contextPath}/DoctorRegister.jsp" class="text-blue-600 hover:underline">Sign up</a>
        </p>
        
    </div>
</body>
</html>