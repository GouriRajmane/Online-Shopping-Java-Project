<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Mobile Number</title>

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

<script>
  function validateContact(input) {
    input.value = input.value.replace(/[^0-9]/g, '').slice(0, 10); // Restrict to digits and max 10
    let errorMessage = document.getElementById("error-message");
    if (input.value.length < 10) {
      errorMessage.innerText = "Contact number must be exactly 10 digits.";
    } else {
      errorMessage.innerText = "";
    }
  }

  window.onload = function () {
    const form = document.getElementById("signup-form");
    form.onsubmit = function (e) {
      const contactInput = document.querySelector("input[name='contact']");
      if (contactInput.value.length !== 10) {
        e.preventDefault(); // Prevent form submission
        document.getElementById("error-message").innerText = "Contact number must be exactly 10 digits.";
      }
    };
  };

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

</head>
<body>
<%
String msg= request.getParameter("msg");
if("done" .equals(msg))
{
%>
<h3 class="alert">Your Mobile Number successfully changed!</h3>
<%} %>

<%
if("wrong" .equals(msg))
{
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>


<form action="changeMobileAction.jsp" method="post" id="signup-form">
 <h3>Enter Your New Mobile Number</h3>
 <input class="input-style"type="text" name="mobileNumber" placeholder="Enter New Mobile Number" required maxlength="10"
         oninput="validateContact(this)">
  <p id="error-message" style="color:red; font-size:14px;"></p>
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

</body>
<br><br><br>
</html>