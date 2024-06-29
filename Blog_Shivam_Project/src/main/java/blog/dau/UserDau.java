package blog.dau;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import blog.entities.User;
import java.sql.*;


//isme User Class ka object pass karege

public class UserDau {
	
	 private Connection con;
	 
	 public UserDau(Connection con)
	 {
		 this.con=con;
		 
	 }
	 
	 // method to insert user to data base
	 
	 public boolean saveUser(User  user)
	 {
		 boolean f=false;
		 try
		 {
			 //user -->database
			 String query="insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			 
			 
			 
			PreparedStatement pstmt= this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());
			
			pstmt.executeUpdate();			 
			
			f=true;
		 }
		 catch (Exception e)
		 {
			e.printStackTrace();
		}
		return f;
	 }
	 
	 
	 //get user by uername email and password
	 
	 public User getUserByEmailPassword(String email,String password)
	 {
		 User user=null;
		 
		 try
		 {
			 String query="select * from user where email=? and password=?";
			 PreparedStatement pstm=con.prepareStatement(query);
			 pstm.setString(1, email);
			 pstm.setString(2, password);
			 
			 ResultSet set=pstm.executeQuery();
			 
			 if(set.next())
			 {
				 user= new User();
				 //get data from database
				 String name=set.getString("name");
				 
				 //set user to object
				 
				 user.setName(name);
				 
				 user.setId(set.getInt("id"));
				 
				 user.setEmail(set.getString("email"));
				 
				 user.setPassword(set.getString("password"));
				 user.setGender(set.getString("gender"));
				 user.setAbout(set.getString("about"));
				 
				user.setDatetime(set.getTimestamp("rdate"));
				 
				user.setProfile(set.getString("profile"));
				 
			 }
			 
			 
		 }
		  catch (Exception e) {
		
		}
		 
		 
		 
		return user;
		 
	 }
	 
	 
	 //another method update 
	 
	 public boolean updateUser(User user)
	 {
		 boolean f=false;
		 try
		 {
			 String query="update user set name=? , email=? ,  password=? , gender=?,about=?,profile=? where id=?";
			 
			 PreparedStatement p=con.prepareStatement(query);
			 
			 p.setString(1, user.getName());
			 p.setString(2, user.getEmail());
			 p.setString(3, user.getPassword());
			 p.setString(4, user.getGender());
			 p.setString(5, user.getAbout());
			 p.setString(6, user.getProfile());
			 p.setInt(7, user.getId());
			 
			 p.executeUpdate();
			 
			 f=true;
			 
			 
		 }
		 catch (Exception e) {
			e.printStackTrace();
			
		}
		return f;
		 
	 }
	 
	 public User getUserByUserId(int userId) {
	        User user = null;
	        try {
	            String q = "select * from user where id=?";
	            PreparedStatement ps = this.con.prepareStatement(q);
	            ps.setInt(1, userId);
	            ResultSet set = ps.executeQuery();
	            if (set.next()) {
	                user = new User();

//	             data from db
	                String name = set.getString("name");
//	             set to user object
	                user.setName(name);

	                user.setId(set.getInt("id"));
	                user.setEmail(set.getString("email"));
	                user.setPassword(set.getString("password"));
	                user.setGender(set.getString("gender"));
	                user.setAbout(set.getString("about"));
	                user.setDatetime(set.getTimestamp("rdate"));
	                user.setProfile(set.getString("profile"));
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return user;
	    }
	 
}






