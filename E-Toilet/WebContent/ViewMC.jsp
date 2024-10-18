<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="Dbconnection.*"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
                        <a  href="adminpanel.jsp"><i class="fa fa-home fa-3x"></i>Home</a>
                    </li>
				  <li>
                        <a  href="addMC.jsp"><i class="fa fa-edit fa-3x"></i>Add Municipal Corporation</a>
                    </li>
                    <li>
                        <a  href="ViewMC.jsp"><i class="fa fa-table fa-3x"></i>View Municipal Corporation</a>
                    </li>
                   
	                </ul>
	          
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        
      <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
         		<h2>&nbsp&nbspView Municipal Corporations</h2><br><br>
           <div class="col-md-12">
                                              
						<table border="1" id="displaytable" class="table table-bordered" style="display.none" >
								          <thead>
								          <tr>
								          				<th>ID</th>
								          				
								          				<th>City Name</th>
								        			    <th>MC Name</th>
														<th>Email Id</th>
														<th>Mobile No</th>
														<th align="center">Action</th>
													
								          </tr>
								          <% 
                                          Statement statement = null;
                                          ResultSet resultSet = null;
                                          %>
                                          <%
                                          try{
                                        	  //int id=UserInfo.getId();
                                        	  Connection conn=DBconnect.getConnect();
                                              java.sql.PreparedStatement ps=conn.prepareStatement("select * from municipal_corporation ");
                                             // ps.setInt(1,id);
                                              resultSet=ps.executeQuery();
                                          
                                          while(resultSet.next()){
                                          %>
                                          <tbody>
                                                   <tr>
                                                   <td><%=resultSet.getInt("id") %></td>
                                                   
                                                   <td><%=resultSet.getString("cityname") %></td>
                                                   <td><%=resultSet.getString("mcname") %></td>
                                                   <td><%=resultSet.getString("emailid") %></td>
                                                   <td><%=resultSet.getString("mobile") %></td>
                                                   <td><a href="deleteMC.jsp?id=<%=resultSet.getString("id") %>" onclick="return confirm_alert(this);">Delete</a></td>

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
