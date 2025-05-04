package com.echannelling.servlet;

import com.echannelling.model.Register;
import com.echannelling.service.DoctorService;
import com.echannelling.service.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/register/DoctorRegister")
@MultipartConfig
public class DoctorRegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private RegisterService registerService = new RegisterService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String name = request.getParameter("name");
    	String identifier = request.getParameter("email"); // Can be email
        String password = request.getParameter("password");
        
        
        

        // Check if session already exists
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("register") != null) {
            response.sendRedirect(request.getContextPath() + "/register");
            return;
        }

        // Authenticate doctor
        Register register = registerService.getRegisterByEmail(identifier);

        if (register != null) {
            // Create a new session for the authenticated doctor
            session = request.getSession(true);
            session.setAttribute("register", register);
            session.setAttribute("name", register.getName());
            session.setAttribute("email", register.getEmail());
            
            session.setMaxInactiveInterval(30 * 60); // Session expires after 30 minutes

            // Redirect to the dashboard
            response.sendRedirect(request.getContextPath() + "/register");
        } 
    }

    private Register authenticateRegister(String identifier, String password) {
        for (Register register : registerService.getAllRegisters()) {
            if ((register.getEmail().equalsIgnoreCase(identifier) || register.getName().equalsIgnoreCase(identifier)) 
                    && register.getPassword().equals(password)) {
                return register;
            }
        }
        return null;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Check for existing error message (e.g., from invalid login attempt)
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("register") != null) {
            // Redirect authenticated user to the dashboard
            response.sendRedirect(request.getContextPath() + "/register");
        } else {
            // Redirect to login page
            request.getRequestDispatcher("/register/DoctorRegister.jsp").forward(request, response);
        }
    }
}

  