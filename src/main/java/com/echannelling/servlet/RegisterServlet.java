package com.echannelling.servlet;

import com.echannelling.model.Register;
import com.echannelling.service.DoctorService;
import com.echannelling.service.RegisterService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

@WebServlet("/register")
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

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");
	        
	     
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("register") == null) {
	            response.sendRedirect(request.getContextPath() + "/register/DoctorRegister");
	            return;
	        }

	        // Add session variables to the request for use in JSP
	        request.setAttribute("name", session.getAttribute("name"));
	        request.setAttribute("email", session.getAttribute("email"));
	       

	        if (action == null) {
	            request.setAttribute("registers", registerService.getAllRegisters());
	            request.getRequestDispatcher("register/RegisterIndex.jsp").forward(request, response);
	        }  
	        else if (action.equals("view")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            Register register = registerService.getRegister(id);
	            request.setAttribute("register", register);
	            request.getRequestDispatcher("register/RegisterIndex.jsp").forward(request, response);
	        } 
	        else if (action.equals("edit")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            Register register = registerService.getRegister(id);
	            request.setAttribute("register", register);
	            request.getRequestDispatcher("register/ManageDoctorEdit.jsp").forward(request, response);
	        } 
	        else if (action.equals("delete")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            registerService.delete(id);
	            response.sendRedirect("register");
	        } 
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String action = request.getParameter("action");

	        if (action.equals("create")) {
	            String name = request.getParameter("name");
	            String password = request.getParameter("password");
	            String email = request.getParameter("email");
	           

	            

	            Register register = new Register();
	            register.setName(name);
	            register.setPassword(password);
	            register.setEmail(email);
	           
	           

	            if (registerService.createUser(register)) {
	                response.sendRedirect("register");
	            } else {
	                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            }
	        } else if (action.equals("update")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            String name = request.getParameter("name");
	            String password = request.getParameter("password");
	            String email = request.getParameter("email");
	           

	            Register register = new Register();
	            register.setId(id);
	            register.setName(name);
	            register.setPassword(password);
	            register.setEmail(email);

	            

	            if (registerService.updateUser(register)) {
	                response.sendRedirect("register");
	            } else {
	                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            }
	        } else if (action.equals("delete")) {
	            int id = Integer.parseInt(request.getParameter("id"));
	            if (registerService.delete(id)) {
	                response.sendRedirect("register");
	            } else {
	                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            }
	        }
	    }
	}

