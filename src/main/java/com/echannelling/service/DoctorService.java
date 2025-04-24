package com.echannelling.service;

import com.echannelling.model.Doctor; // Rename to Doctor if needed
import com.echannelling.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DoctorService {

	    // Create Doctor
	    public boolean createUser(Doctor doctor) {
	        String query = "INSERT INTO doctorDash (name, email, password, fileName) VALUES (?, ?, ?, ?)";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, doctor.getName());
	            stmt.setString(2, doctor.getEmail());
	            stmt.setString(3, doctor.getPassword());
	            stmt.setString(4, doctor.getFilename());
	            return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    // Get User by ID
	    public Doctor getUser(int id) {
	        String query = "SELECT * FROM doctorDash WHERE id = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setInt(1, id);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	            	Doctor user = new Doctor();
	                user.setId(rs.getInt("id"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));
	                user.setPassword(rs.getString("password"));
	                user.setFilename(rs.getString("fileName"));
	                return user;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	    
	 // Get Doctor by Email
	    public Doctor getDoctorByEmail(String email) {
	        String query = "SELECT * FROM doctorDash WHERE email = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, email);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	            	Doctor doctor = new Doctor();
	            	doctor.setId(rs.getInt("id"));
	            	doctor.setName(rs.getString("name"));
	            	doctor.setEmail(rs.getString("email"));
	            	doctor.setPassword(rs.getString("password"));
	            	doctor.setFilename(rs.getString("fileName") != null ? rs.getString("fileName") : "default.png");
	                return doctor;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }


	    // Get All Doctor
	    public List<Doctor> getAllUsers() {
	        List<Doctor> users = new ArrayList<>();
	        String query = "SELECT * FROM doctorDash";
	        try (Connection connection = DBConnection.getConnection();
	             Statement stmt = connection.createStatement()) {
	            ResultSet rs = stmt.executeQuery(query);
	            while (rs.next()) {
	            	Doctor user = new Doctor();
	                user.setId(rs.getInt("id"));
	                user.setName(rs.getString("name"));
	                user.setEmail(rs.getString("email"));
	                user.setPassword(rs.getString("password"));
	                user.setFilename(rs.getString("fileName"));
	                users.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return users;
	    }

	    // Update Doctor
	    public boolean updateUser(Doctor user) {
	        String query = "UPDATE doctorDash SET name = ?, email = ?, password = ?, fileName = ? WHERE id = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, user.getName());
	            stmt.setString(2, user.getEmail());
	            stmt.setString(3, user.getPassword());
	            stmt.setString(4, user.getFilename());
	            stmt.setInt(5, user.getId());
	            return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    // Delete Doctor
	    public boolean deleteUser(int id) {
	        String query = "DELETE FROM doctorDash WHERE id = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setInt(1, id);
	            return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
	}


