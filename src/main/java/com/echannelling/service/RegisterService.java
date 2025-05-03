package com.echannelling.service;

import com.echannelling.model.Doctor; // Rename to Doctor if needed
import com.echannelling.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RegisterService {

	    // Create Doctor
	    public boolean createUser(Doctor doctor) {
	        String query = "INSERT INTO doctorList (name, specialization, email, password, filename, , phone, licenseActive) "
	        		+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, doctor.getName());
	            stmt.setString(5, doctor.getSpecialization());
	            stmt.setString(2, doctor.getEmail());
	            stmt.setString(3, doctor.getPassword());
	            stmt.setString(4, doctor.getFilename());	            
	            stmt.setString(6, doctor.getPhone());
	            stmt.setBoolean(7, doctor.isLicenseActive());
	            return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    // Get Doctor by ID
	    public Doctor getDoctor(int id) {
	        String query = "SELECT * FROM doctorList WHERE id = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	              stmt.setInt(1, id);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	            	Doctor doctor = new Doctor();
	            	doctor.setId(rs.getInt("id"));
	            	doctor.setName(rs.getString("name"));
	            	doctor.setSpecialization(rs.getString("specialization"));
	            	doctor.setEmail(rs.getString("email"));
	            	doctor.setPassword(rs.getString("password"));
	            	doctor.setFilename(rs.getString("filename"));
	            	doctor.setPhone(rs.getString("phone"));
	            	doctor.setLicenseActive(rs.getBoolean("licenseActive"));
	                return doctor;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	    
	 // Get Doctor by Email
	    public Doctor getDoctorByEmail(String email) {
	        String query = "SELECT * FROM doctorList WHERE email = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, email);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	            	Doctor doctor = new Doctor();
	            	doctor.setId(rs.getInt("id"));
	            	doctor.setName(rs.getString("name"));
	            	doctor.setSpecialization(rs.getString("specialization"));
	            	doctor.setEmail(rs.getString("email"));
	            	doctor.setPassword(rs.getString("password"));
	            	doctor.setFilename(rs.getString("filename") != null ? rs.getString("filename") : "default.png");
	            	doctor.setPhone(rs.getString("phone"));
	            	doctor.setLicenseActive(rs.getBoolean("licenseActive"));
	                return doctor;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	 
	    // Get All Doctors
	    public List<Doctor> getAllDoctors() {
	        List<Doctor> doctors = new ArrayList<>();
	        String query = "SELECT * FROM doctorList";
	        try (Connection connection = DBConnection.getConnection();
	             Statement stmt = connection.createStatement()) {
	            ResultSet rs = stmt.executeQuery(query);
	            while (rs.next()) {
	            	Doctor doctor = new Doctor();
	                doctor.setId(rs.getInt("id"));
	                doctor.setName(rs.getString("name"));
	                doctor.setSpecialization(rs.getString("specialization"));
	                doctor.setEmail(rs.getString("email"));
	                doctor.setPassword(rs.getString("password"));
	                doctor.setFilename(rs.getString("filename"));
	                doctor.setPhone(rs.getString("phone"));
	            	doctor.setLicenseActive(rs.getBoolean("licenseActive"));
	                doctors.add(doctor);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return doctors;
	    }
	 // Update Doctor
	    public boolean updateUser(Doctor doctor) {
	        String query = "UPDATE doctorDash SET name = ?, email = ?, password = ?, filename = ? WHERE id = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, doctor.getName());
	            stmt.setString(1, doctor.getSpecialization());
	            stmt.setString(2, doctor.getEmail());
	            stmt.setString(3, doctor.getPassword());
	            stmt.setString(4, doctor.getFilename());
	            stmt.setString(4, doctor.getPhone());
	            stmt.setBoolean(4, doctor.isLicenseActive());
	            stmt.setInt(5, doctor.getId());
	            return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    // Delete Doctor
	    public boolean delete(int id) {
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


