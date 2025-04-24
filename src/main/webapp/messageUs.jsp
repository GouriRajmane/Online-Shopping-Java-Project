<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/messageUs.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Message Us</title>

<style type="text/css">
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
  margin-left: 20%;
}

.button:hover {
  background-color: green; /* More natural green shade */
  color: white;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Message Us <i class='fas fa-comment-alt'></i></div>

<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 style="color: yellow; font-size: 20px; text-align: center; font-weight: bold; ">
    <i class="fas fa-check-circle"></i>Message successfully sent. Our team will contact you soon!</h3>
<%} %>

<%
if("invalid".equals(msg))
{
%>
<h3 style="color: red; text-align: center; font-size: 22px; font-weight: bold; ">
      <i class="fas fa-times-circle"></i>Some thing Went Wrong! Try Again!</h3>
<%} %>

<form action="messageUsAction.jsp" method="post">

<input class="input-style" type="text" name="subject" placeholder="subject" required>
<hr>
<textarea class="input-style" name="body" placeholder="Enter your Message" required></textarea>
<hr>
<button class="button" type="submit">Send &nbsp;<i class='far fa-arrow-alt-circle-right'></i></button>
</form>

<br><br><br>
</body>
</html>