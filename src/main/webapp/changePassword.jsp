<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Password</title>
<style>
.eye-icon {
  position: absolute;
  right: 10px;
  top: 38px;
  cursor: pointer;
}
.input-wrapper {
  position: relative;
}

.input-wrapper {
  position: relative;

}

.input-style {

  padding: 10px 40px 10px 10px; /* Add padding-right for icon space */
  box-sizing: border-box;
}

.input-wrapper i {
  position: absolute;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  cursor: pointer;
  color: #666;
}

</style>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("notMatch".equals(msg))
{
%>
<h3 class="alert">New password and Confirm password does not match!</h3>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your old Password is wrong!</h3>
<%} %>

<%
if("done".equals(msg))
{
%>
<h3 class="alert">Your Password changed successfully!</h3>
<%} %>

<%
if("invalid".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try again!</h3>
<%} %>

<form action="changePasswordAction.jsp" method="post">

  <h3>Enter Old Password</h3>
 
	 <div class="input-wrapper">
		  <input class="input-style" type="password" name="oldPassword" id="oldPassword" placeholder="Enter Old Password" required>
		  <i class="fas fa-eye" id="toggleOld"></i>
	</div>
  <h3>Enter New Password</h3>
	  <div class="input-wrapper">
	  		<input class="input-style" type="password" name="newPassword" id="newPassword" placeholder="Enter New Password" required>
	  		<i class="fas fa-eye" id="toggleNew"></i>
	  </div>
	  
  <h3>Enter Confirm Password</h3>
	 <div class="input-wrapper">
	  <input class="input-style" type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
	  <i class="fas fa-eye" id="toggleConfirm"></i>
	</div>
	 





 
  <hr>

  <button class="button" type="submit"> Save &nbsp<i class='far fa-arrow-alt-circle-right'></i></button>
</form>

<!-- Font Awesome Eye Toggle Script -->
<script>
  const togglePassword = (toggleId, inputId) => {
    const toggle = document.getElementById(toggleId);
    const input = document.getElementById(inputId);
    toggle.addEventListener('click', () => {
      const type = input.getAttribute('type') === 'password' ? 'text' : 'password';
      input.setAttribute('type', type);
      toggle.classList.toggle('fa-eye');
      toggle.classList.toggle('fa-eye-slash');
    });
  };

  togglePassword('toggleOld', 'oldPassword');
  togglePassword('toggleNew', 'newPassword');
  togglePassword('toggleConfirm', 'confirmPassword');
</script>

</body>
<br><br><br>
</html>
