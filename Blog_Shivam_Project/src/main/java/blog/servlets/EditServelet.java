package blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import blog.dau.UserDau;
import blog.entities.Message;
import blog.entities.User;
import blog.helper.ConnectionProvider;
import blog.helper.Helper;
@MultipartConfig
public class EditServelet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		//featch all data from profile jsp edit wala
		
		String userEmail=request.getParameter("user_email");
		String userName=request.getParameter("user_name");
		String userpassword=request.getParameter("user_password");
		String userAbout=request.getParameter("user_about");
		
		Part part=request.getPart("image");
		
		String imageName=part.getSubmittedFileName();  //return us photo ka name with extenction 
		
		//get the user from the Session
		
		HttpSession s=request.getSession();
		
	User user=(User) s.getAttribute("currentUser");
	
	user.setName(userName);
	user.setEmail(userEmail);
	user.setPassword(userpassword);
	user.setAbout(userAbout);
	String oldfile=user.getProfile();
	user.setProfile(imageName);
	
	//Update database
	
	UserDau  userdau=new UserDau(ConnectionProvider.getConnection());
	
	boolean ans=userdau.updateUser(user);

	if(ans)
	{
		out.println("updated to DB");
	
		//String path=request.getRealPath
	
		String path =request.getServletContext().getRealPath("/") +"pic"+File.separator+user.getProfile();
	  
		//Delete code
		String oldpath =request.getServletContext().getRealPath("/") +"pic"+File.separator+oldfile;
		
		if(!oldfile.equals("default.png"))
		{
		
			Helper.deletefile(oldfile);
		}
		//save code
	  
		 if( Helper.savefile(part.getInputStream(),path))
		 {
			 out.println("Profile is uploaded..");
			 Message msg=new Message("Profile is uploaded..", "success", "alert-success");
			 s .setAttribute("msg", msg);
		 }
		 else
		 {
			 out.println("Profile i not uploaded..");
			 Message msg=new Message("Soething went wrong..", "error", "alert-danger");
			 s .setAttribute("msg", msg);
		 }	
	}
	else
	{
		out.println("not Updated");
		Message msg=new Message("Soething went wrong..", "error", "alert-danger");
		s .setAttribute("msg", msg);
	}
	
	response.sendRedirect("profile.jsp");
	
		
		
}

}
