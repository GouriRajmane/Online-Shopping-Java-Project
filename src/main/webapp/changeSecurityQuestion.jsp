<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Your security Question successfully changed !</h3>

<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>

<%} %>

<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Securtiy Question</h3>
  <select class="input-style" name="securityQuestion">
  	<option value="What is your favourite color?">What is your favourite color? </option>
	<option value="What is your pet name?">What is your pet name? </option>
	<option value="What is the name of town where you born?">What is the name of town where you born? </option>
	<option value="What is the elementory school did you attend?">What is the elementory school did you attend?</option>
  </select>

 <hr>
 <h3>Enter Your New Answer</h3>
 <input class="input-style" type="text" name="newAnswer" placeholder="Enter your New Answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
 <input class="input-style" type="password" name="password" placeholder="Enter Password (For Security)" required>
 <div style="position: relative;">
 	   <input class="input-style" type="password" name="password" id="password" placeholder="Enter Password (For Security)" required>
 	    <span onclick="togglePassword()" style="position: absolute; right: 10px; top: 12px; cursor: pointer;">
	    <i id="eyeIcon" class="fas fa-eye"></i>
	  </span>
	</div>
<hr>
 <button class="button" type="submit"> Save &nbsp<i class='far fa-arrow-alt-circle-right'></i></button>

</form>

	<script>
function togglePassword() {
  var passwordInput = document.getElementById("password");
  var eyeIcon = document.getElementById("eyeIcon");
  if (passwordInput.type === "password") {
    passwordInput.type = "text";
    eyeIcon.classList.remove("fa-eye");
    eyeIcon.classList.add("fa-eye-slash");
  } else {
    passwordInput.type = "password";
    eyeIcon.classList.remove("fa-eye-slash");
    eyeIcon.classList.add("fa-eye");
  }
}
</script>

</body>
<br><br><br>
</html>