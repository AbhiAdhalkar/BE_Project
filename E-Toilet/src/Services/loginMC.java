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
import Dbconnection.DBconnect;
import Dbconnection.UserInfo;

/**
 * Servlet implementation class loginMC
 */
public class loginMC extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginMC() {
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
		String srno=request.getParameter("srno");
		String passwd=request.getParameter("passwd");
		PrintWriter out=response.getWriter();
		{
			try
			{
				Connection conn=DBconnect.getConnect();
				PreparedStatement ps = conn.prepareStatement("select * from  municipal_corporation where srno=? and passwd=?");
				ps.setString(1, srno);
				ps.setString(2, passwd);
				ResultSet rs = ps.executeQuery();
				if(rs.next())
				{
					UserInfo.setSrno(rs.getString("srno"));
					response.sendRedirect("MCpanel.jsp");
				}
				else
				{
					request.getSession().setAttribute("msg", "Wrong User Credentials..!!");
					response.sendRedirect("LoginMC.jsp");
				}
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
	}

	}
	}
