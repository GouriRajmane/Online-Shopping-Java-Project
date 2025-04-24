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

<style>

.button {
  background-color: aqua;
  border: none;
  color: black;
  padding: 12px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
  margin-left: 30%;
}

.button:hover {
  background-color: green; /* More natural green shade */
  color: white;
}

.password-container {
    position: relative;
}

.toggle-password {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
}
</style>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 style="color: yellow; font-size: 20px; text-align: center; font-weight: bold; margin-top: 15px;">
    <i class="fas fa-check-circle"></i>Your security Question successfully changed !</h3>

<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 style="color: red; text-align: center; font-size: 22px; font-weight: bold; margin-top: 10px;">
      <i class="fas fa-times-circle"></i> Your Password is wrong!</h3>

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
	 <div class="password-container">
 	   <input class="input-style" type="password" name="password" id="password" placeholder="Enter Password (For Security)" required>
 	    <i class="fas fa-eye eye-icon" id="password"></i>
 	    <span class="toggle-password" onclick="togglePassword()"> </span>
	</div>
<hr>
 <button class="button" type="submit"> Save &nbsp;<i class='far fa-arrow-alt-circle-right'></i></button>

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