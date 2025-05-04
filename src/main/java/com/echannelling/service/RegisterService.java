package com.echannelling.service;

import com.echannelling.model.Register; // Rename to Doctor if needed
import com.echannelling.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RegisterService {

	    // Create Register
	    public boolean createUser(Register register) {
	        String query = "INSERT INTO registerDash (name, email, password, filename) VALUES (?, ?, ?, ?)";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, register.getName());
	            stmt.setString(2, register.getEmail());
	            stmt.setString(3, register.getPassword());
	            
	            return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }

	    // Get Doctor by ID
	    public Register getRegister(int id) {
	        String query = "SELECT * FROM registerDash WHERE id = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	              stmt.setInt(1, id);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	            	Register register = new Register();
	            	register.setId(rs.getInt("id"));
	            	register.setName(rs.getString("name"));
	            	register.setEmail(rs.getString("email"));
	            	register.setPassword(rs.getString("password"));
	            	
	                return register;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	    
	 // Get Register by Email
	    public Register getRegisterByEmail(String email) {
	        String query = "SELECT * FROM registerDash WHERE email = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, email);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	            	Register register = new Register();
	            	register.setId(rs.getInt("id"));
	            	register.setName(rs.getString("name"));
	            	register.setEmail(rs.getString("email"));
	            	register.setPassword(rs.getString("password"));
	            	
	                return register;
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return null;
	    }
	    
	    


	    // Get All Doctors
	    public List<Register> getAllRegisters() {
	        List<Register> registers = new ArrayList<>();
	        String query = "SELECT * FROM registerDash";
	        try (Connection connection = DBConnection.getConnection();
	             Statement stmt = connection.createStatement()) {
	            ResultSet rs = stmt.executeQuery(query);
	            while (rs.next()) {
	            	Register register = new Register();
	            	register.setId(rs.getInt("id"));
	            	register.setName(rs.getString("name"));
	            	register.setEmail(rs.getString("email"));
	            	register.setPassword(rs.getString("password"));
	                
	            	registers.add(register);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return registers;
	    }

	    // Update Register
	    public boolean updateUser(Register register) {
	        String query = "UPDATE registerDash SET name = ?, email = ?, password = ? WHERE id = ?";
	        try (Connection connection = DBConnection.getConnection();
	             PreparedStatement stmt = connection.prepareStatement(query)) {
	            stmt.setString(1, register.getName());
	            stmt.setString(2, register.getEmail());
	            stmt.setString(3, register.getPassword());
	            stmt.setInt(5, register.getId());
	            return stmt.executeUpdate() > 0;
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return false;
	    }
	    
	    

	    // Delete Register
	    public boolean delete(int id) {
	        String query = "DELETE FROM registerDash WHERE id = ?";
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


