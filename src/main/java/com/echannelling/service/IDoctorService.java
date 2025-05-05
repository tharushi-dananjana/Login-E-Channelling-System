package com.echannelling.service;

import com.echannelling.model.Doctor;
import java.util.List;

public interface IDoctorService {
    boolean createUser(Doctor doctor);
    Doctor getDoctor(int id);
    Doctor getDoctorByEmail(String email);
    
    List<Doctor> getAllDoctors();
    boolean updateUser(Doctor doctor);
    boolean delete(int id);
}
