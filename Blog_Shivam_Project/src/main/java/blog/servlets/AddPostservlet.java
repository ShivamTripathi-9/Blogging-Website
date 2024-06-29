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

import blog.dau.PostDau;
import blog.entities.Post;
import blog.entities.User;
import blog.helper.ConnectionProvider;
import blog.helper.Helper;
@MultipartConfig
@WebServlet("/AddPostservlets")
public class AddPostservlet extends HttpServlet {
	
	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
	PrintWriter out=response.getWriter();
		
		//String pTitle=request.getParameter("pTitle");
		
		
		//int cid = Integer.parseInt(request.getParameter("cid"));
	int cid = Integer.parseInt(request.getParameter("cid").trim());
        String pTitle = request.getParameter("pTitle");
        String pContent = request.getParameter("pContent");
        String pCode = request.getParameter("pCode");
        Part part = request.getPart("pic");
        
        
//      getting currentuser id
        
      HttpSession session = request.getSession();
      User user = (User) session.getAttribute("currentUser");
        
        
       // out.println(part.getSubmittedFileName());
		//out.println("Your Title is "+pTitle);
      
      Post p = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
      
      PostDau dao = new PostDau(ConnectionProvider.getConnection());
      if (dao.savePost(p)) {

          
        
        //  String path =request.getServletContext().getRealPath("/") + "blog_pics" + File.separator + part.getSubmittedFileName();
          
        //  Helper.savefile(part.getInputStream(),path);
          out.println("done");
          
      } else {
          out.println("error");
      }
	
	
		
	}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }


}
