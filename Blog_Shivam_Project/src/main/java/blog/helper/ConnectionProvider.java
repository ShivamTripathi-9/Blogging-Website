package blog.helper;
import java.sql.Connection;
import java.sql.DriverManager;
public class ConnectionProvider 
{

		private static  Connection con; 
		
		public static Connection getConnection()
		{
			try
			{
				if(con==null)
				{

					//Driver Class Load
					Class.forName("com.mysql.cj.jdbc.Driver");
					
					//create a connection
					
					con=DriverManager.getConnection("jdbc:mysql://localhost:3306/shivamblog","root","root");

				}
				
				
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
			
			return con;
			
		}
		

	}

