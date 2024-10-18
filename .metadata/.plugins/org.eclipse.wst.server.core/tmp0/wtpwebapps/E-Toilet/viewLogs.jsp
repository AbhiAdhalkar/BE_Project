<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="Dbconnection.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>E - Toilet</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <script type="text/javascript">
   	function access(){
		<% Object s1 = request.getSession().getAttribute("msg");
		 if(s1!=null){ %>
		alert('<%=s1.toString()%>');
		<% request.getSession().setAttribute("msg",null);
		}	%>
	}
   	</script>
</head>
<body>
<body onload="access()">
<%
//AbstractDao abstractDao=new AbstractDao();
%>

    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" style="font-size:19px" href="#">E - Toilet</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> &nbsp; <a href="index.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
            </nav>   
            <!-- /. NAV TOP  -->
            <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
             <ul class="nav" id="main-menu">
				<li class="text-center">
            <img src="assets/img/find_user.png" class="user-image img-responsive" style="height: 100px;"/>
				</li>
				  <li>
                        <a  href="addToilet.jsp"><i class="fa fa-edit fa-3x"></i>Add Toilet</a>
                    </li>
                    <li>
                        <a  href="viewcleaninglogs.jsp"><i class="fa fa-edit fa-3x"></i>View Toilets</a>
                    </li>
                    <li>
                        <a  href="viewuncleanedtoilet.jsp"><i class="fa fa-table fa-3x"></i>View Uncleaned Toilets</a>
                    </li>
                   
	                </ul>
	          
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        
      <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
         		<h2>&nbsp&nbspView Current Data</h2>
           <div class="col-md-12">
                                              
						<table border="1" id="displaytable" class="table table-bordered" style="display.none" >
								          <thead>
								          <tr>
								          				<th>Location</th>
								        			    <th>Kit Id</th>
														<th>Cleaning Boy Name</th>
														<th>Mobile No</th>
														<th>RFID NO</th>
														<th>MQ 135</th>
														<th>MQ 8</th>
														<th>MQ 4</th>
														<th>Temperature</th>
														<th>Humidity</th>
													
								          </tr>
								          <% 
                                          Statement statement = null;
                                          ResultSet resultSet = null;
                                          String sno = request.getParameter("id");
                                          %>
                                          <%
                                          try{
                                          Connection conn=DBconnect.getConnect();
                                          statement=conn.createStatement();
                                          String sql ="select * from toilet_details where kitid='"+sno+"'";
                                          resultSet = statement.executeQuery(sql);
                                          while(resultSet.next()){
                                          %>
                                          <tbody>
                                                   <tr>
	                                                   <td><%=resultSet.getString("location") %></td>
	                                                   <td><%=resultSet.getString("kitid") %></td>
	                                                   <td><%=resultSet.getString("name") %></td>
	                                                   <td><%=resultSet.getString("mobile") %></td>
	                                                   <td><%=resultSet.getString("RFIDno") %></td>
	                                                   <td><%=resultSet.getString("mq135") %></td>
	                                                   <td><%=resultSet.getString("mq8") %></td>
	                                                   <td><%=resultSet.getString("mq4") %></td>
	                                                   <td><%=resultSet.getString("temp") %></td>
	                                                   <td><%=resultSet.getString("humidity") %></td>
                                                   </tr>
                                          </tbody>
                                                   <%
                                                   }
                                                   //connection.close();
                                                   } catch (Exception e) {
                                                   e.printStackTrace();
                                                   }
                                                   %>
								          
										</thead>
				 </table>                  
			</div>
         		</div>
         		
         		
         		
         		<div class="row">
         		<h2>&nbsp&nbspView Logs</h2>
           <div class="col-md-12">
                                              
						<table border="1" id="displaytable" class="table table-bordered" style="display.none" >
								          <thead>
								          <tr>
								        			    <th>Kit Id</th>
														<th>RFID NO</th>
														<th>MQ 135</th>
														<th>MQ 8</th>
														<th>MQ 4</th>
														<th>Temperature</th>
														<th>Humidity</th>
														<th>Date</th>
														<th>Time</th>
													
								          </tr>
								          <% 
                                          Statement statement1 = null;
                                          ResultSet resultSet1 = null;
                                          %>
                                          <%
                                          try{
                                          Connection conn=DBconnect.getConnect();
                                          statement1=conn.createStatement();
                                          String sql ="select * from uncleanedlog where kitid='"+sno+"'";
                                          resultSet1 = statement.executeQuery(sql);
                                          while(resultSet1.next()){
                                          %>
                                          <tbody>
                                                   <tr>
	                                                   <td><%=resultSet1.getString("kitid") %></td>
	                                                   <td><%=resultSet1.getString("RFIDno") %></td>
	                                                   <td><%=resultSet1.getString("mq135") %></td>
	                                                   <td><%=resultSet1.getString("mq8") %></td>
	                                                   <td><%=resultSet1.getString("mq4") %></td>
	                                                   <td><%=resultSet1.getString("temp") %></td>
	                                                   <td><%=resultSet1.getString("humidity") %></td>
	                                                   <td><%=resultSet1.getString("date") %></td>
	                                                   <td><%=resultSet1.getString("time") %></td>
                                                   </tr>
                                          </tbody>
                                                   <%
                                                   }
                                                   //connection.close();
                                                   } catch (Exception e) {
                                                   e.printStackTrace();
                                                   }
                                                   %>
								          
										</thead>
				 </table>                  
			</div>
         		</div>
         		
         		
         		
                   
                </div>
                                       
	 </div>
					                    </div>                                           
                                         
                    </div>
               
           
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    <SCRIPT language=Javascript>
     function isNumberKey(evt)
{
var charCode = (evt.which) ? evt.which : event.keyCode;

if (charCode > 31 && (charCode<48 || charCode>57))
	return false;
	
return true;
}
       
</SCRIPT>
   
</body>
</html>

</body>
</html>