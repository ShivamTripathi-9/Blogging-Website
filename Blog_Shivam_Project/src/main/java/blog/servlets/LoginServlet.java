package blog.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import blog.dau.UserDau;
import blog.entities.Message;
import blog.entities.User;
import blog.helper.ConnectionProvider;


public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter	out=response.getWriter();
	//	out.println("yes");
		
		String useEmail=request.getParameter("email");
		String userPassword=request.getParameter("password");
		
		UserDau dau=new UserDau(ConnectionProvider.getConnection());
		
		User u=dau.getUserByEmailPassword(useEmail, userPassword);
		
		if(u==null)
		{
			//login error message show 

		//	out.println("Invalid Details...try again");
			Message msg=new Message("Invalid Details...try again", "error", "alert-danger");
			
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			
			
			
			response.sendRedirect("login_page.jsp");
			
		}
		else
		{
			//login success
			
			HttpSession s=request.getSession();
			s.setAttribute("currentUser",u);
			
			response.sendRedirect("profile.jsp");
			
			
		}
		
		
		
	}

}
