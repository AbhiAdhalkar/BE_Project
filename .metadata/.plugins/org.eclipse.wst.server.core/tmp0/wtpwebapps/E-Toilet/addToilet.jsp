<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
                        <a  href="MCpanel.jsp"><i class="fa fa-home fa-3x"></i>Home</a>
                    </li>
				  <li>
                        <a  href="addToilet.jsp"><i class="fa fa-edit fa-3x"></i>Add Toilet</a>
                    </li>
                    <li>
                        <a  href="viewcleaninglogs.jsp"><i class="fa fa-table fa-3x"></i>View Toilets</a>
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
         		<h2>&nbsp&nbspAdd Toilet</h2><br><br>
         		 <div class="col-md-12">
          <div class="card">
        <form action="addToilet" method="post">
                
             
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Location</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="location" placeholder="Enter location" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Kit Id</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="kitid" placeholder="Enter Kit Id" required></textarea>
                  </div>
                </div>
                <br>
                <!--  
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">MQ135</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="mq135" required></textarea>
                </div>
				</div>
				
				<div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">MQ8</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="mq8"  required></textarea>
                </div>
				</div>
				  
				<div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">MQ4</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="mq4"  required></textarea>
                </div>
				</div>
				  
				<div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Temperature</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="temp" placeholder="Enter RFID NO" required></textarea>
                </div>
				</div>
				
				<div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Humidity</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="humidity" placeholder="Enter humidity" required></textarea>
                </div>
				</div>
				  
            -->
                
                <h5 align="center"><b>Cleaning Boy Details</b></h5><br>
             


				 <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Name</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="name" placeholder="Enter Name" required></textarea>
                  </div>
                </div>
                </div>
               <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Address</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="address" placeholder="Enter Address" required></textarea>
                  </div>
                </div>

				<div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Mobile No</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="mobile" placeholder="Enter Mobile Number" onkeypress="return isNumberKey(event)" minlength="10" maxlength="10" required></textarea>
                  </div>
                </div>
                
                <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">Email Id</label>
                  <div class="col-sm-9">
                    <textarea type="email" cols="7" rows="1" class="form-control" name="emailid" placeholder="Enter Email ID" onblur="validateEmail(this);" required></textarea>
                  </div>
                  </div>
				  
                 <div class="form-group row">
                <input type="hidden" name="action" value="add"/>
    			<label for="inputEmail3" class="col-sm-3 form-control-label">RFID No</label>
                  <div class="col-sm-9">
                    <textarea cols="7" rows="1" class="form-control" name="RFIDno" placeholder="Enter RFID NO" required></textarea>
                	</div>
				</div>
				</div>  
				
                <div class="form-group row m-b-0">
                 <div class="col-sm-offset-3 col-sm-9">
                 <button type="submit"  class="btn btn-primary">Add Toilet</button>
                  </div>
                </div>
                
              </form>
            </div>
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
