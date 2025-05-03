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
	    	
	    	
	    	 if (action.equals("create")) {
		            String name = request.getParameter("name");
		            String password = request.getParameter("password");
		            String email = request.getParameter("email");
		            String specialization = request.getParameter("specialization");
		            String phone = request.getParameter("phone");
		            Part filePart = request.getPart("filename");

		            String fileName = handlePhotoUpload(filePart, "doctor/assets/picture");

		            Doctor doctor = new Doctor();
		            doctor.setName(name);
		            doctor.setPassword(password);
		            doctor.setEmail(email);
		            doctor.setSpecialization(specialization);
		            doctor.setPhone(phone);
		            doctor.setFilename(fileName);
		           

		            if (registerService.createUser(doctor)) {
		                response.sendRedirect("doctor");
		            } else {
		                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
		            }
		        } else if (action.equals("update")) {
		            int id = Integer.parseInt(request.getParameter("id"));
		            String name = request.getParameter("name");
		            String password = request.getParameter("password");
		            String email = request.getParameter("email");
		            Part filePart = request.getPart("filename");
		            String specialization = request.getParameter("specialization");
		            String phone = request.getParameter("phone");
		            String fileName = handlePhotoUpload(filePart, "assets/picture");
		            boolean licenseActive = Boolean.parseBoolean(request.getParameter("licenseActive"));
		           
		            Doctor doctor = new Doctor();
		            doctor.setId(id);
		            doctor.setName(name);
		            doctor.setPassword(password);
		            doctor.setEmail(email);
		            doctor.setSpecialization(specialization);
		            doctor.setPhone(phone);
		            doctor.setLicenseActive(licenseActive);
		            doctor.setLicenseActive(licenseActive);

		            if (fileName != null) {
		            	doctor.setFilename(fileName);
		            }

		        }
		    }
		}
