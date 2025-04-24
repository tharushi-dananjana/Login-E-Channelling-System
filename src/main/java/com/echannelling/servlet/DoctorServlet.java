package com.echannelling.servlet;

import com.echannelling.model.Doctor;
import com.echannelling.service.DoctorService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/admin")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB


public class DoctorServlet extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	    private DoctorService doctorService;

	    @Override
	    public void init() throws ServletException {
	        super.init();
	        doctorService = new DoctorService();
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
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("admin") == null) {
	            response.sendRedirect(request.getContextPath() + "/admin/login");
	            return;
	        }

	        // Add session variables to the request for use in JSP
	        request.setAttribute("name", session.getAttribute("name"));
	        request.setAttribute("email", session.getAttribute("email"));
	        request.setAttribute("fileName", session.getAttribute("fileName"));

	        if (action == null) {
	            request.setAttribute("doctors", doctorService.getAllUsers());
	            request.getRequestDispatcher("doctor/ManageDoctorindex.jsp").forward(request, response);
	        } else if (action.equals("create")) {
	            request.getRequestDispatcher("doctor/ManageDoctorCreate.jsp").forward(request, response);
	        } else if (action.equals("view")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            Doctor doctor = doctorService.getDoctor(id);
	            request.setAttribute("doctor", doctor);
	            request.getRequestDispatcher("doctor/ManageDoctorindex.jsp").forward(request, response);
	        } else if (action.equals("edit")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            Doctor doctor = doctorService.getDoctor(id);
	            request.setAttribute("doctor", doctor);
	            request.getRequestDispatcher("doctor/ManageDoctorEdit.jsp").forward(request, response);
	        } else if (action.equals("delete")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            doctorService.deleteUser(id);
	            response.sendRedirect("doctor");
	        } else if (action.equals("logout")) {
	            session.invalidate();
	            response.sendRedirect(request.getContextPath() + "/doctor/login");
	        }
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        if (action.equals("create")) {
	            String name = request.getParameter("name");
	            String password = request.getParameter("password");
	            String email = request.getParameter("email");
	            Part filePart = request.getPart("fileName");

	            String picture = handlePhotoUpload(filePart, "doctor/picture");

	            Doctor doctor = new Doctor();
	            doctor.setName(name);
	            doctor.setPassword(password);
	            doctor.setEmail(email);
	            doctor.setFilename(picture);
	           

	            if (doctorService.createUser(doctor)) {
	                response.sendRedirect("doctor");
	            } else {
	                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            }
	        } else if (action.equals("update")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            String name = request.getParameter("name");
	            String password = request.getParameter("password");
	            String email = request.getParameter("email");
	            Part filePart = request.getPart("fileName");

	            String picture = handlePhotoUpload(filePart, "doctor/pictures");

	            Doctor doctor = new Doctor();
	            doctor.setId(id);
	            doctor.setName(name);
	            doctor.setPassword(password);
	            doctor.setEmail(email);

	            if (picture != null) {
	            	doctor.setFilename(picture);
	            }

	            if (doctorService.updateUser(doctor)) {
	                response.sendRedirect("admin");
	            } else {
	                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            }
	        } else if (action.equals("delete")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            if (doctorService.deleteUser(id)) {
	                response.sendRedirect("admin");
	            } else {
	                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            }
	        }
	    }
	}

