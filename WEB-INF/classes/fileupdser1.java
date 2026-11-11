import java.io.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;


@WebServlet(urlPatterns="/fileupdser1")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,   // 1 MB
        maxFileSize = 10 * 1024 * 1024,     // 10 MB
        maxRequestSize = 20 * 1024 * 1024   // 20 MB
)
public class fileupdser1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession ss = request.getSession(true);
		int uid= (Integer) ss.getAttribute("mid");
		Part file=request.getPart("image");

		File uploadDir = new File("D:\\Tomcat 11.0\\webapps\\medicine\\images\\med");
        	if (!uploadDir.exists()) {
            		uploadDir.mkdirs();
        	}

		String imageFileName=file.getSubmittedFileName();  // get selected image file name
        	int indx = imageFileName.lastIndexOf(".");
        	String ext = imageFileName.substring(indx);
		System.out.println("Selected Image File Name : "+imageFileName);

        	imageFileName = uid+ext;
		System.out.println("Image File Name to be stored: "+imageFileName);
		
		// location + path
		String filePath = uploadDir+File.separator+imageFileName;
		System.out.println("Upload Path & file : "+filePath);

		// Uploading our selected image into the images folder		
		try{
			file.write(filePath);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//getting database connection (jdbc code)
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/medicine","root","root@123");
			String query="update photo set  image=? where medicineid=?";
			System.out.println(query);

			PreparedStatement stmt=connection.prepareStatement(query);
			stmt.setString(1,imageFileName);
			stmt.setInt(2,uid);
			int row=stmt.executeUpdate(); // it returns no of rows affected.
			connection.close();

			if(row>0){
				System.out.println("Image Uploaded into database successfully.");
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/admin_update_medicines_photo1.jsp");
    dispatcher.forward(request, response);	
		}catch (Exception e){
			System.out.println(e);
		}	
	}
}