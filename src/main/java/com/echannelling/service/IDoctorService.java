package com.echannelling.service;
import java.util.List;

import com.echannelling.model.Doctor;

public interface IDoctorService {
    boolean createUser(Doctor doctor);
    Doctor getDoctor(int id);
    Doctor getDoctorByEmail(String email);
    
    List<Doctor> getAllDoctors();
    boolean updateUser(Doctor doctor);
    boolean delete(int id);
}
