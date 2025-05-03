package com.echannelling.servlet;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.echannelling.model.Doctor;
import com.echannelling.service.RegisterService;


@WebServlet("/t_doctor")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB

public class RegisterServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    private RegisterService registerService;

	    @Override
	    public void init() throws ServletException {
	        super.init();
	        registerService = new RegisterService();
	    }

	    private String handlePhotoUpload(Part filePart, String uploadDirectory) throws IOException {
	        if (filePart != null && filePart.getSize() > 0) {
	            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
	            String uploadPath = getServletContext().getRealPath("") + File.separator + uploadDirectory;

	            // Ensure directory exists
	            File uploadDir = new File(uploadPath);
	            if (!uploadDir.exists()) {
	                uploadDir.mkdirs();
	            }

	            // Save the file to the specified directory
	            String filePath = uploadPath + File.separator + fileName;
	            filePart.write(filePath);

	            return fileName;
	        }
	        return null;
	    }
	    
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	String action = request.getParameter("action");
	    	
	    	
	    	// Get form parameters
	        String name = request.getParameter("name");
	        String specialization = request.getParameter("specialization");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String phone = request.getParameter("phone");
	        boolean licenseActive = "yes".equalsIgnoreCase(request.getParameter("licenseActive"));

	        Part filePart = request.getPart("filename");
	        String filename = (filePart != null && filePart.getSize() > 0)
	                ? handlePhotoUpload(filePart, "doctor/assets/picture")
	                : "default.jpg";

	        // Create new Doctor object
	        Doctor newDoctor = new Doctor();
	        newDoctor.setName(name);
	        newDoctor.setSpecialization(specialization);
	        newDoctor.setEmail(email);
	        newDoctor.setPassword(password);
	        newDoctor.setPhone(phone);
	        newDoctor.setFilename(filename);
	        newDoctor.setLicenseActive(licenseActive);

	        boolean success = registerService.createUser(newDoctor);

	        // Redirect to the list view
	        if (success) {
	            response.sendRedirect(request.getContextPath() + "/t_doctor");
	        } else {
	            request.setAttribute("error", "Registration failed. Try again.");
	            request.getRequestDispatcher("/t_doctor/DoctorRegister.jsp").forward(request, response);
	        }
	    }
	    

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");
	        
	     
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("t_doctor") == null) {
	            response.sendRedirect(request.getContextPath() + "/t_doctor/DoctorRegister");
	            return;
	        }

	        // Add session variables to the request for use in JSP
	        request.setAttribute("name", session.getAttribute("name"));
	        request.setAttribute("specialization", session.getAttribute("specialization"));
	        request.setAttribute("email", session.getAttribute("email"));
	        request.setAttribute("filename", session.getAttribute("filename"));
	        request.setAttribute("phone", session.getAttribute("phone"));
	        request.setAttribute("licenseActive", session.getAttribute("licenseActive"));
	        

	        if (action == null) {
	            request.setAttribute("doctors", registerService.getAllDoctors());
	            request.getRequestDispatcher("t_doctor/Register_List.jsp").forward(request, response);
	        } else if (action.equals("view")) {
	            int ID = Integer.parseInt(request.getParameter("id"));
	            Doctor doctor = registerService.getDoctor(ID);
	            request.setAttribute("doctor", doctor);
	            request.getRequestDispatcher("t_doctor/Register_List.jsp").forward(request, response);
	        }   
	        
	    }
}
	    
	    


