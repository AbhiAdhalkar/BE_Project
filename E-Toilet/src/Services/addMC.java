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
 * Servlet implementation class addMC
 */
public class addMC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addMC() {
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
				String srno=request.getParameter("srno");
				String cityname=request.getParameter("cityname");
				String mcname=request.getParameter("mcname");
				String emailid=request.getParameter("emailid");
				String mobile=request.getParameter("mobile");
				String passwd=request.getParameter("passwd");
			
				HttpSession session = request.getSession(true); // reuse existing
			
				session.setAttribute("user",mobile);
				Connection conn=DBconnect.getConnect();
			
				String sql="select srno from municipal_corporation where srno='"+srno+"'";
			
				PreparedStatement ps=conn.prepareStatement(sql);
				ResultSet r= ps.executeQuery();
			
				if(r.next())
				{
					request.getSession().setAttribute("msg", "Duplicate srno, Records Already Exist..!!");
	        		response.sendRedirect("addMC.jsp"); 
				}
				else
				{
					PreparedStatement ps1=conn.prepareStatement("insert into municipal_corporation values(?,?,?,?,?,?,?)");
					ps1.setInt(1,id);
					ps1.setString(2,srno);
					ps1.setString(3,cityname);
					ps1.setString(4,mcname);
					ps1.setString(5,emailid);
					ps1.setString(6,mobile);
					ps1.setString(7,passwd);
					
					int n= ps1.executeUpdate();
					System.out.println("Recort inserted");
					
					if(n>=1)
					{
						request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
						response.sendRedirect("addMC.jsp"); 
					}
					else
					{
						request.getSession().setAttribute("msg", "Record Failed To Insert..!!");
						response.sendRedirect("addMC.jsp"); 
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
