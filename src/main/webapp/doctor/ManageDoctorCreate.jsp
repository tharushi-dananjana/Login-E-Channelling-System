<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./partials/top.jsp"%>

<title>Create Doctor</title>

<%@ include file="./partials/middle.jsp"%>

<!-- Form Container -->
<main class="flex-grow flex justify-center items-start p-6">
	<div class="bg-white p-6 rounded shadow-md w-full max-w-xl">
		<h2 class="text-2xl font-semibold text-gray-800 text-center mb-6">Create
			New Record</h2>

		<form action="#" method="POST" class="space-y-6">
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Full
					Name</label> <input type="text"
					class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
			</div>
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Email
					Address</label> <input type="email"
					class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
			</div>
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Phone
					Number</label> <input type="tel"
					class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500" />
			</div>
			<div>
				<label class="block text-sm font-medium text-gray-700 mb-1">Status</label>
				<select
					class="w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-orange-500">
					<option value="active">Active</option>
					<option value="inactive">Inactive</option>
				</select>
			</div>
			<div class="flex justify-end space-x-4 pt-4">
				<button type="reset"
					class="bg-red-500 text-gray-700 px-4 py-2 rounded hover:bg-gray-300">Clear</button>
				<button type="submit"
					class="bg-blue-900 text-white px-6 py-2 rounded hover:bg-blue-300">Create</button>
			</div>
		</form>
	</div>
</main>

