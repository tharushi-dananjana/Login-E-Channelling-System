package com.echannelling.servlet;

import com.echannelling.model.Doctor;
import com.echannelling.service.DoctorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet("/doctor/login")
public class DoctorLoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private DoctorService doctorService = new DoctorService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String identifier = request.getParameter("email"); // Can be email
        String password = request.getParameter("password");

        // Check if session already exists
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("doctor") != null) {
            response.sendRedirect(request.getContextPath() + "/doctor");
            return;
        }

        // Authenticate doctor
        Doctor doctor = doctorService.getDoctorByEmail(password);

        if (doctor != null) {
            // Create a new session for the authenticated doctor
            session = request.getSession(true);
            session.setAttribute("doctor", doctor);
            session.setAttribute("name", doctor.getName());
            session.setAttribute("email", doctor.getEmail());
            session.setAttribute("filename", doctor.getFilename());
            session.setMaxInactiveInterval(30 * 60); // Session expires after 30 minutes

            // Redirect to the dashboard
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            // Authentication failed, redirect back to login page with error
            request.setAttribute("error", "Invalid email/username or password");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }

    private Doctor authenticateAdmin(String identifier, String password) {
        for (Doctor doctor : doctorService.getAllUsers()) {
            if ((doctor.getEmail().equalsIgnoreCase(identifier) || doctor.getName().equalsIgnoreCase(identifier)) 
                    && doctor.getPassword().equals(password)) {
                return doctor;
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check for existing error message (e.g., from invalid login attempt)
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("admin") != null) {
            // Redirect authenticated user to the dashboard
            response.sendRedirect(request.getContextPath() + "/admin");
        } else {
            // Redirect to login page
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}

















  