<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Register</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://kit.fontawesome.com/9449774243.js" crossorigin="anonymous"></script>
    <link rel="icon" href="/favicon.ico" type="image/x-icon">
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">



<!-- Main Content -->
<main class="flex-grow flex items-center justify-center p-6">
    <div class="bg-white p-6 rounded-lg shadow-md w-full max-w-md">
        <h2 class="text-2xl font-bold text-gray-800 text-center mb-6">Doctor Register</h2>

        <form action="${pageContext.request.contextPath}/doctorRegister?action=create"
              method="POST"
              enctype="multipart/form-data"
              onsubmit="return validateForm(event)"
              class="space-y-4">

            <input type="hidden" name="action" value="create">

            <!-- Full Name -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
                <input type="text" name="name" required
                       class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
            </div>

            <!-- Email -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Email Address</label>
                <input type="email" name="email" required
                       class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
            </div>

            <!-- Password -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                <input type="password" name="password" required minlength="6"
                       class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
            </div>

            <!-- Profile Picture -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-1">Profile Picture</label>
                <input type="file" name="filename" accept="image/jpeg,image/png"
                       class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
            </div>

            <!-- Buttons -->
            <div class="flex justify-between pt-4">
                <button type="reset" class="bg-red-300 text-gray-800 px-4 py-2 rounded hover:bg-red-400">Cancel</button>
                <button type="submit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">Create Record</button>
            </div>
        </form>
    </div>
</main>



<!-- JavaScript Form Validation -->
<script>
    function validateForm(event) {
        const form = event.target;
        const name = form.name.value.trim();
        const email = form.email.value.trim();
        const password = form.password.value.trim();
        const fileInput = form.filename;

        if (!name) {
            alert("Enter your Name");
            form.name.focus();
            event.preventDefault();
            return false;
        }

        if (!email || !email.includes("@")) {
            alert("Please enter a valid email address.");
            form.email.focus();
            event.preventDefault();
            return false;
        }

        if (!password || password.length < 6) {
            alert("Password must be at least 6 characters.");
            form.password.focus();
            event.preventDefault();
            return false;
        }

        if (fileInput && fileInput.files.length > 0) {
            const file = fileInput.files[0];
            const allowedTypes = ["image/jpeg", "image/png"];
            if (!allowedTypes.includes(file.type)) {
                alert("Please upload a .jpg or .png image.");
                event.preventDefault();
                return false;
            }
        }

        return true;
    }
</script>

</body>
</html>
