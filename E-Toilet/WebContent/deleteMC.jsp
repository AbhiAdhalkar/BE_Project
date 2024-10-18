<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="Dbconnection.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete-MC</title>
</head>
<body>
<%

PreparedStatement pst = null;

try{
Connection conn=DBconnect.getConnect();
//String id1=request.getParameter("id");
int id=Integer.parseInt(request.getParameter("id"));
PreparedStatement ps=conn.prepareStatement("DELETE FROM municipal_corporation WHERE id=?");
ps.setInt(1,id);
int i=ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("ViewMC.jsp");
}
else{
	response.sendRedirect("ViewMC.jsp");
}
} catch (Exception e) {
e.printStackTrace();
}
%>
</body>
</html>