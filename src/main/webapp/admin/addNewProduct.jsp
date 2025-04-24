<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>

<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">

<style type="text/css">
.button:hover {
  background-color: green;
  color: white;
}
</style>

<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 style="color: yellow; font-size: 20px; text-align: center; font-weight: bold; margin-top: 15px;">
    <i class="fas fa-check-circle"></i> Product Added Successfully! !
  </h3>
<%}%>

<%
if("wrong".equals(msg))
{
%>
	<h3 style="color: red; text-align: center; font-size: 22px; font-weight: bold; margin-top: 10px;">
      <i class="fas fa-times-circle"></i> Something Went Wrong! Try Again!
    </h3>
    
 <%}%>

<%
int id=1;
try
{
	Connection con= ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs= st.executeQuery("select max(id) from product");
	while(rs.next()){
		id= rs.getInt(1);
		id=id+1;
	}
}
catch(Exception e)
{
/* System.out.println(e);	 */
}
%>
<form action="addNewProductAction.jsp" method="post">

<h3 style="color: yellow;">Product ID:<%out.println(id); %> </h3>
<input type="hidden" name="id" value="<%out.println(id); %>">


<div class="left-div">
 <h3>Enter Name</h3>
 <input  class="input-style" type="text" name="name" placeholder="Enter Name" required>
 
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
<!--  <input  class="input-style" type="text" name="category" placeholder="Enter Category" required> -->
<select class="input-style" name="category" required>
  <option value="Male">Male</option>
  <option value="Female">Female</option>
  <option value="Kids">Kids</option>
</select>
 
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input  class="input-style" type="number" name="price" placeholder="Enter Price" required>
 
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
<option value="Yes">Yes</option>
<option value="No">No</option>
</select>
   
<hr>
</div>
 <button class="button">Save &nbsp;<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</body>
</html>