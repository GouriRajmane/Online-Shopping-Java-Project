
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<title>Login</title>
</head>
<body>
<div id='container'>
<div class="signup">
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

<div class="whysignLogin">
  <h2 style="text-align: center; font-size: 30px; color: #2980b9;">
    <i class="fas fa-sign-in-alt" style="margin-right: 8px;"></i> Login Here
  </h2>

  <% 
    String msg = request.getParameter("msg");
    if ("notexist".equals(msg)) {
  %>
    <h3 style="color: red; text-align: center; font-size: 22px; font-weight: bold; ">
      <i class="fas fa-exclamation-circle"></i> Incorrect Username or Password
    </h3>
  <% 
    } else if ("invalid".equals(msg)) {
  %>
    <h3 style="color: red; text-align: center; font-size: 22px; font-weight: bold; ">
      <i class="fas fa-times-circle"></i> Something Went Wrong! Try Again!
    </h3>
  <% } %>

  <h2 style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; color:#e67e22; text-align:center; font-size: 35px; margin-top: 20px;">
    <i class="fas fa-shopping-bag" style="color: #27ae60;"></i> ShopEase: Your Smart Shopping Hub
  </h2>

  <p style="text-align: center; color: #333;">
    <i class="fas fa-laptop" style="color: #3498db;"></i>
    Experience the convenience of shopping anytime, anywhere <strong>ShopEase</strong> lets you browse, choose, and buy without ever stepping out!
  </p>
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