<%@page errorPage="error.jsp" %>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/home-style.css">
<!-- Font Awesome 5 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
    <!--Header-->
    <br>
    <div class="topnav sticky">
    	
    	 
            <center><h2>Change Details<i class="fa fa-edit"></i></h2></center>
				<% String email= session.getAttribute("email").toString();%>
            <h2><a href="home.jsp"><i class='fas fa-arrow-circle-left'>Back</i></a></h2>
             <h2><a href="">Your Profile <i class='fas fa-user-alt'></i> &nbsp (<%out.println(email); %>) </a></h2>
            <a href="changePassword.jsp">Change Password <i class='fas fa-key'></i></a>
            <a href="addChangeAdderess.jsp">Add or change Address <i class='fas fa-map-marker-alt'></i></a>
            <a href="changeSecurityQuestion.jsp">Change Security Question <i class="fas fa-question-circle"></i></a>
            <a href="">Change Mobile Number <i class='fas fa-phone'></i></a>
          </div>
           <br>
           <!--table-->
