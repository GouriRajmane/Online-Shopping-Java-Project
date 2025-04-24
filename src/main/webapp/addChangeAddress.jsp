<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="changeDetailsHeader.jsp" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Add or Change Adddress</title>
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
  margin-left: 30%;
}

.button:hover {
  background-color: green; /* More natural green shade */
  color: white;
}
</style>
</head>
<body>

<%
String msg=request.getParameter("msg");
if("valid".equals(msg))
{
%>
<h3 style="color: yellow; font-size: 20px; text-align: center; font-weight: bold; margin-top: 15px;">
    <i class="fas fa-check-circle"></i> Address Successfully Updated !
  </h3>

<%} %>

<%
if("invalid".equals(msg))
{
%>
<h3 style="color: red; text-align: center; font-size: 22px; font-weight: bold; margin-top: 10px;">
      <i class="fas fa-times-circle"></i> Something Went Wrong! Try Again!
    </h3>
 <%} %>

<%
try
{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"'");
	while(rs.next())
	{
%>

<form action="addChangeAddressAction.jsp" method="post">
<h3>Enter Address</h3>
 <input class="input-style" type="text" name="address" value="<%=rs.getString(7)%>" placeholder="Enter Address" required>
 <hr>
 
 <h3>Enter city</h3>
  <input class="input-style" type="text" name="city" value="<%=rs.getString(8)%>" placeholder="Enter City" required>
 
<hr>
<h3>Enter State</h3>
 <input class="input-style" type="text" name="state" value="<%=rs.getString(9)%>" placeholder="Enter State" required>

<hr>
<h3>Enter country</h3>
 <input class="input-style" type="text" name="country" value="<%=rs.getString(10)%>" placeholder="Enter Country" required>

<hr>
 <button class="button" type="submit">Save &nbsp;<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
<br><br><br>
</html>