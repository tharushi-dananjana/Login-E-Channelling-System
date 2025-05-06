package REGISTER;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import REGISTER.RegisterService;

@WebServlet("/doctorRegister")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
                 
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Define your upload path
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("create".equalsIgnoreCase(action)) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            

            // Handle file upload
            Part filePart = request.getPart("filename");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

            // Get upload path on server
            String appPath = request.getServletContext().getRealPath("");
            String uploadPath = appPath + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdir();

            // Save the file
            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            // Call service to insert into DB
            boolean isInserted = RegisterService.insertdata(name, email, password, fileName);

            if (isInserted) {
                response.sendRedirect("./doctor/DoctorLogin.jsp"); //Redirect to success page
            } else {
                response.sendRedirect("error.jsp"); //Redirect to error page
            }
        }
    }
}
