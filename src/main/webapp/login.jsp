
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<title>Login</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
  <form action="loginAction.jsp" method="post">
  <input type="email" name="email" placeholder="Enter Email" required>
	<div style="position: relative;">
	  <input type="password" name="password" id="password" placeholder="Enter password" required>
	  <span onclick="togglePassword()" style="position: absolute; right: 10px; top: 12px; cursor: pointer;">
	    <i id="eyeIcon" class="fas fa-eye"></i>
	  </span>
	</div>
    <input type="submit" name="Login">
  </form>
     
      <h2><a href="signup.jsp">SignUp</a></h2>
       <h2><a href="forgotPassword.jsp">Forgot Password?</a></h2>
  </div>
  <div class='whysignLogin'>
  <%
  String msg=request.getParameter("msg");
  if("notexist".equals(msg))
  {
	%>  
	 <h1>Incorrect Username or Password</h1>
  <%} %>
  
  <%if("invalid".equals(msg))
  {%>
  <h1>Some thing Went Wrong! Try Again !</h1>
  <% } %>
  
    <h2>Online Shopping</h2>
    <p>The Online Shopping System is the application that allows the users to 
    shop online without going to the shops to buy them.</p>
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