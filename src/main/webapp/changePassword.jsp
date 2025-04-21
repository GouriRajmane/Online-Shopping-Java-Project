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
  margin-left: 32%;
}

.button:hover {
  background-color: green; /* More natural green shade */
  color: white;
}

hr{
width: 36%
}
  .password-container {
    position: relative;
    width: 40%;
    margin-left: 20%;
    margin-right:30%
  }

  .input-style {
    width: 90%;
    padding: 12px 40px 12px 20px; /* space for eye icon */
    box-sizing: border-box;
    border: none;
    background-color: white;
    color: black;
    font-size: 16px;
  }

  .toggle-password {
    position: absolute;
    right: -70px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #888;
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
  <div class="password-container">
    <input class="input-style" type="password" name="oldPassword" id="oldPassword" placeholder="Enter Old Password" required>
    <i class="fas fa-eye toggle-password" id="toggleOld"></i>
  </div>
  <hr>

  <h3>Enter New Password</h3>
  <div class="password-container">
    <input class="input-style" type="password" name="newPassword" id="newPassword" placeholder="Enter New Password" required>
    <i class="fas fa-eye toggle-password" id="toggleNew"></i>
  </div>
  <hr>

  <h3>Enter Confirm Password</h3>		 
  <div class="password-container">
    <input class="input-style" type="password" name="confirmPassword" id="confirmPassword" placeholder="Confirm Password" required>
    <i class="fas fa-eye toggle-password" id="toggleConfirm"></i>
  </div>
  <hr>

  <button class="button" type="submit"> Save &nbsp;<i class='far fa-arrow-alt-circle-right'></i></button>
</form>


<!-- Font Awesome Eye Toggle Script -->

<script>
  function togglePassword(iconId, inputId) {
    const icon = document.getElementById(iconId);
    const input = document.getElementById(inputId);
    icon.addEventListener('click', () => {
      const type = input.type === 'password' ? 'text' : 'password';
      input.type = type;
      icon.classList.toggle('fa-eye');
      icon.classList.toggle('fa-eye-slash');
    });
  }

  togglePassword('toggleOld', 'oldPassword');
  togglePassword('toggleNew', 'newPassword');
  togglePassword('toggleConfirm', 'confirmPassword');
</script>

</body>
<br><br><br>
</html>
