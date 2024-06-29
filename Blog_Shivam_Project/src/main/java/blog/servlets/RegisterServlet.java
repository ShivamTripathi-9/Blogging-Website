package blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import org.apache.jasper.tagplugins.jstl.core.Out;

import blog.dau.UserDau;
import blog.entities.User;
import blog.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet
{
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	PrintWriter	out=response.getWriter();
	
		String  check=request.getParameter("check");
	//out.println(check);
		if(check==null)
		{
			out.println("box not checked");
		}
		else
		{
			String name=request.getParameter("user_name");
			String email=request.getParameter("user_email");
			String password=request.getParameter("user_password");
			String gender=request.getParameter("gender");
			String about=request.getParameter("about");
			
			//Create a user object and set all data to the object
			
			User user=new User(name,email,password,gender,null, about);
			
			
			
			
			//Create a userDau Object
			
			UserDau dau= new UserDau(ConnectionProvider.getConnection());
			if(dau.saveUser(user))
			{
				out.println("Done");
			}
			else
			{
				out.println("error");
			}
		}
		
	}

}

















