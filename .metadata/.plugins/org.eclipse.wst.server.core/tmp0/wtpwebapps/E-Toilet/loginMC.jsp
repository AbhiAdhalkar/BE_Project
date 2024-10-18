<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>E - Toilet</title>
    <!-- meta tags -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="Art Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, 
		Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />
    <!-- /meta tags -->
    <!-- custom style sheet -->
    <link href="css/style.css" rel="stylesheet" type="text/css" />
    <!-- /custom style sheet -->
    <!-- fontawesome css -->
    <link href="css/fontawesome-all.css" rel="stylesheet" />
    <!-- /fontawesome css -->
    <!-- google fonts-->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- /google fonts-->

<script>
function validateEmail(emailField)
{
	var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    if (reg.test(emailField.value) == false) 
    {
        alert('Invalid Email Address');
        return false;
    }
    return true;
}
</script>

</head>


<body>
    <h1 style="color:orange; text-shadow: 0.5px 0.5px 0.5px red;">E - Toilet</h1>
    <div class=" w3l-login-form">
        <h2 style="color:red; text-shadow: 0.5px 0.5px 0.5px white;">Municipal Corporation Login</h2>
        <form action="loginMC" method="POST">
            
            <div class=" w3l-form-group">
                <label>SR.NO:</label>
                <div class="group">
                    <i class="fas fa-user"></i>
                    <input type="text" class="form-control" placeholder="SR Number" name="srno" required="required" />
                </div>
            </div>
            
            <div class=" w3l-form-group">
                <label>Password:</label>
                <div class="group">
                    <i class="fas fa-unlock"></i>
                    <input type="password" class="form-control" placeholder="Password" name="passwd" required="required" />
                </div>
            </div>
            
            <button type="submit" style="color:rgb(248, 204, 114); text-shadow: 0.5px 0.5px 0.5px red;">Login</button>
            
            
            <div class="col-sm-offset-5 col-sm-10" style="color:yellow;">
                    Admin Login? <a href="index.jsp"><font color="white">Click Here</font> </a>
            </div>
            
            
        </form>
    </div>

</body>

</html>