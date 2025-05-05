package com.echannelling.service;
import com.echannelling.model.Doctor;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.echannelling.util.DBConnection;

public class RegisterService {
	
	private static boolean isSuccess;
	private static Connection con=null;
	private static Statement stmt=null;
	private static ResultSet rs=null;
	
	public static boolean insertdata(String name, String email, String password, String fileName) {
		isSuccess = false;
		
		try {
				//DB CONNECTION CALL
			con=DBConnection.getConnection();
			stmt=con.createStatement();
			
				//SQL QUERY			
			String sql = "INSERT INTO doctorDash VALUES(0,'" + name + "', '" +email +"', '" +password + "','" + fileName + "')";
			System.out.println("Executing SQL : " +sql);
			int rs = stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
}