<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Signup</title>

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
</script>

</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="signupAction.jsp" method="post">
  <input type="text" name="name" placeholder="Enter Your Name" required>
  <input type="email" name="email" placeholder="Enter Your Email" required>
<!--   <input type="number" name="mobileNumber" placeholder="Enter Your Mobile Number" required> -->
  <input type="text" name="mobileNumber" placeholder="Enter Your Mobile Number" required maxlength="10" 
         oninput="validateContact(this)">
  <p id="error-message" style="color:red; font-size:14px;"></p>
  <select name="securityQuestion" required>
	<option value="What is your favourite color?">What is your favourite color? </option>
	<option value="What is your pet name?">What is your pet name? </option>
	<option value="What is the name of town where you born?">What is the name of town where you born? </option>
	<option value="What is the elementory school did you attend?">What is the elementory school did you attend?</option>
  </select>
  
  <input type="text" name="answer" placeholder="Enter your answer." required>
  <input class="input-style" type="password" name="password" placeholder="Enter Password (For Security)" required>
 <div style="position: relative;">
 	   <input class="input-style" type="password" name="password" id="password" placeholder="Enter Password (For Security)" required>
 	    <span onclick="togglePassword()" style="position: absolute; right: 10px; top: 12px; cursor: pointer;">
	    <i id="eyeIcon" class="fas fa-eye"></i>
	  </span>
	</div>  <input type="submit" value="signup">
  </form>  
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
  <%
  String msg =request.getParameter("msg");
  if("valid".equals(msg))
  {
  %>
<h1>Successfully Registered !!!</h1>
  <%} %>
  <%
  if("invalid".equals(msg))
  {
  %>
<h1>Something Went Wrong! Please Try Again</h1>
  <%} %>

    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to shop online without going to the shops to buy them.</p>
  </div>
</div>

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
</html>