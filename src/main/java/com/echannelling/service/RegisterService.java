package com.echannelling.service;

import com.echannelling.model.Doctor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class RegisterService {

    private final String jdbcURL = "jdbc:mysql://localhost:3306/echannelling_db";
    private final String jdbcUsername = "root";
    private final String jdbcPassword = "IT23688568"; 

    private static final String INSERT_DOCTOR_SQL =
            "INSERT INTO doctors (name, specialization, email, phone, license_active) VALUES (?, ?, ?, ?, ?)";

    public boolean saveDoctor(Doctor doctor) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            PreparedStatement statement = connection.prepareStatement(INSERT_DOCTOR_SQL);
            statement.setString(1, doctor.getName());
            statement.setString(2, doctor.getSpecialization());
            statement.setString(3, doctor.getEmail());
            statement.setString(4, doctor.getPhone());
            statement.setBoolean(5, doctor.isLicenseActive());

            int rowsInserted = statement.executeUpdate();

            statement.close();
            connection.close();

            return rowsInserted > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
