package Dbconnection;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	static Connection con = null;
	public static Connection getConnect()
	{	
		if(con==null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");  
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/e_toiletc","root","");
				return con;
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return con;
	}
}
