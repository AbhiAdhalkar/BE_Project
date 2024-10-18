package Services;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dbconnection.DBconnect;

/**
 * Servlet implementation class addToilet
 */
public class addToilet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addToilet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int id=0;
		PrintWriter out=response.getWriter();
		{
			try
			{
				String location=request.getParameter("location");
				String kitid=request.getParameter("kitid");
				String name=request.getParameter("name");
				String address=request.getParameter("address");
				String mobile=request.getParameter("mobile");
				String emailid=request.getParameter("emailid");
				String RFIDno=request.getParameter("RFIDno");
				
				
			
				HttpSession session = request.getSession(true); // reuse existing
			
				session.setAttribute("user",mobile);
				Connection conn=DBconnect.getConnect();
			
				String sql="select srno from toilet_details where srno='"+kitid+"'";
			
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet r= ps.executeQuery();
			
				if(r.next())
				{
					request.getSession().setAttribute("msg", "Duplicate srno, Records Already Exist..!!");
	        		response.sendRedirect("addToilet.jsp"); 
				}
				else
				{
					PreparedStatement ps1=conn.prepareStatement("insert into toilet_details  values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
					ps1.setInt(1,id);
					ps1.setString(2,kitid);
					ps1.setString(3,location);
					ps1.setString(4,kitid);
					ps1.setString(5,name);
					ps1.setString(6,address);
					ps1.setString(7,mobile);
					ps1.setString(8,emailid);
					ps1.setString(9,RFIDno);
					ps1.setString(10,"0");
					ps1.setString(11,"0");
					ps1.setString(12,"0");
					ps1.setString(13,"0");
					ps1.setString(14,"0");
					
					
					int n= ps1.executeUpdate();
					System.out.println("Recort inserted");
					
					if(n>=1)
					{
						request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
						response.sendRedirect("addToilet.jsp"); 
					}
					else
					{
						request.getSession().setAttribute("msg", "Record Failed To Insert..!!");
						response.sendRedirect("addToilet.jsp"); 
					}
				}
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
