<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<title>ForgotPassword</title>

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
  
  <form action="forgotPasswordAction.jsp" method="post">
  <input type="email" name="email" placeholder="Enter Your Email" required>
  <input type="text" name="mobileNumber" placeholder="Enter Your Mobile Number" required maxlength="10" 
         oninput="validateContact(this)">
  <p id="error-message" style="color:red; font-size:14px;"></p>
  <select name="securityQuestion">
	<option value="What is your favourite color?">What is your favourite color? </option>
	<option value="What is your pet name?">What is your pet name? </option>
	<option value="What is the name of town where you born?">What is the name of town where you born? </option>
	<option value="What is the elementory school did you attend?">What is the elementory school did you attend?</option>
  </select>
  
  <input type="text" name="answer" placeholder="Enter your answer." required>
<!--   <input type="password" name="newPassword" placeholder="Enter your new password to set" required>
 -->
	 <div style="position: relative;">
	  <input type="password" name="newPassword" id="newPassword" placeholder="Enter New password" required>
	  <span onclick="togglePassword()" style="position: absolute; right: 10px; top: 12px; cursor: pointer;">
	    <i id="eyeIcon" class="fas fa-eye"></i>
	  </span>
	 </div>
  
  <input type="submit" value="Save">
  
  </form>
     
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whyforgotPassword'>
  
  <h2 style="text-align: center; font-size: 30px; color: red; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
 	 <i class="fas fa-unlock-alt" style="margin-right: 8px;"></i> Forgot Password
</h2>
  
  
  <%
  String msg=request.getParameter("msg");
  if("done".equals(msg))
  {
 %>
 <h3 style="color: green; text-align: center; font-size: 22px; font-weight: bold; ">
    <i class="fas fa-check-circle"></i> Password Changed Successfully! !!!
  </h3>  

  <%} %>
  
  <%
  if("invalid".equals(msg))
  {
  %>
 	<h3 style="color: red; text-align: center; font-size: 22px; font-weight: bold; ">
      <i class="fas fa-times-circle"></i> Something Went Wrong! Try Again!
    </h3>  
   <%} %>	
   
    <h2 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color: #e67e22; text-align:center;font-size: 35px; margin-top: 20px;">
    <i class="fas fa-shopping-bag" style="color: #27ae60;"></i> ShopEase: Your Smart Shopping Hub
  </h2>

  <p style="text-align: center; color: #333; margin-top: 5px;">
    <i class="fas fa-laptop" style="color: #3498db;"></i>
    Experience the convenience of shopping anytime, anywhere <strong>ShopEase</strong> lets you browse, choose, and buy without ever stepping out!
  </p>
  </div>
</div>

<script>
function togglePassword() {
  var passwordInput = document.getElementById("newPassword");
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