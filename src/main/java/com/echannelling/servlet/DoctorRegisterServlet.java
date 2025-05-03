package com.echannelling.servlet;

import com.echannelling.model.Doctor;

import com.echannelling.service.RegisterService;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/t_doctor/DoctorRegister")
public class DoctorRegisterServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
    private RegisterService registerService = new RegisterService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        boolean licenseActive = "true".equalsIgnoreCase(request.getParameter("license_active"));
        
        Part filePart = request.getPart("picture");
        String filename = "default.jpg";
        if (filePart != null && filePart.getSize() > 0) {
            filename = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "doctor/assets/picture";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            filePart.write(uploadPath + File.separator + filename);
        }

        // Create doctor object
        Doctor newDoctor = new Doctor();
        newDoctor.setName(name);
        newDoctor.setSpecialization(specialization);
        newDoctor.setEmail(email);
        newDoctor.setPassword(password);
        newDoctor.setFilename(filename);
        newDoctor.setPhone(phone);
        newDoctor.setLicenseActive(licenseActive);
        
        // Save to database
        boolean isCreated = registerService.createUser(newDoctor);

     // Check if session already exists
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("doctor") != null) {
            response.sendRedirect(request.getContextPath() + "/t_doctor");
            return;
        }

     // Authenticate doctor
        Doctor doctor = ( registerService).getDoctorByEmail(email);

        if (doctor != null) {
            // Create a new session for the authenticated doctor
            session = request.getSession(true);
            session.setAttribute("doctor", doctor);
            session.setAttribute("name", doctor.getName());
            session.setAttribute("email", doctor.getEmail());
            session.setAttribute("password", doctor.getPassword());
            session.setAttribute("specialization", doctor.getSpecialization());
            session.setAttribute("phone", doctor.getPhone());
            session.setAttribute("filename", doctor.getFilename());
            session.setMaxInactiveInterval(30 * 60); // Session expires after 30 minutes

            // Redirect to the dashboard
            response.sendRedirect(request.getContextPath() + "/t_doctor");
        } 
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check for existing error message (e.g., from invalid login attempt)
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("doctor") != null) {
            // Redirect authenticated user to the dashboard
            response.sendRedirect(request.getContextPath() + "/t_doctor");
        } else {
            // Redirect to login page
            request.getRequestDispatcher("/t_doctor/DoctorRegister.jsp").forward(request, response);
        }
    }
}
