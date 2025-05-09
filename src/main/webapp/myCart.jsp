<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Cart</title>
<style>
h3
{
	color: yellow;
	text-align: center;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Cart <i class='fas fa-cart-arrow-down'></i></div>

<%
String msg = request.getParameter("msg");
if ("notPossible".equals(msg)) {
%>
  <h3 style="text-align: center; font-size: 20px; color: #e74c3c; font-weight: bold;">
    <i class="fas fa-exclamation-triangle"></i> There is only one quantity! Please click on <strong>Remove</strong>.
  </h3>
<% 
} else if ("inc".equals(msg)) {
%>
  <h3 style="text-align: center; font-size: 20px; color: #27ae60; font-weight: bold;">
    <i class="fas fa-plus-circle"></i> Quantity Increased Successfully!
  </h3>
<%
} else if ("dec".equals(msg)) {
%>
  <h3 style="text-align: center; font-size: 20px; color: #f39c12; font-weight: bold;">
    <i class="fas fa-minus-circle"></i> Quantity Decreased Successfully!
  </h3>
<%
} else if ("removed".equals(msg)) {
%>
  <h3 style="text-align: center; font-size: 20px; color: #c0392b; font-weight: bold;">
    <i class="fas fa-trash-alt"></i> Product Successfully Removed!
  </h3>
<%
}
%>

<table>
<thead>

<%
int total = 0;
int sno = 0;
Statement st = null;

try {
    Connection con = ConnectionProvider.getCon();
    st = con.createStatement();

    // Getting total
    ResultSet rs1 = st.executeQuery("select sum(total) from cart where email='" + email + "' and address is NULL");
    while (rs1.next()) {
        total = rs1.getInt(1);
    }
%>

<tr>
  <th scope="col" style="background-color: yellow;">
    Total: <i class="fas fa-rupee-sign"></i><%= total %>
  </th>
  <% if (total > 0) { %>
    <th scope="col"><a href="addressPaymentForOrder.jsp">Proceed to order</a></th>
  <% } %>
</tr>
</thead>
<thead>
<tr>
  <th scope="col">S.No</th>
  <th scope="col">Product Name</th>
  <th scope="col">Category</th>
  <th scope="col"><i class="fas fa-rupee-sign"></i> Price</th>
  <th scope="col">Quantity</th>
  <th scope="col"> <i class="fas fa-rupee-sign"></i> Sub Total</th>
  <th scope="col">Remove <i class='fas fa-trash-alt'></i></th>
</tr>
</thead>
<tbody>
<%
    ResultSet rs = st.executeQuery("select * from Product inner join cart on product.id=cart.product_id and cart.email='" + email + "' and cart.address is NULL");
    while (rs.next()) {
        sno++;
%>
<tr>
  <td><%= sno %></td>
  <td><%= rs.getString(2) %></td>
  <td><%= rs.getString(3) %></td>
  <td><i class="fas fa-rupee-sign"></i><%= rs.getString(4) %></td>
  <td>
	<a href="incDecQuantityAction.jsp?id=<%= rs.getString(1) %>&quantity=inc"><i class='fas fa-plus-circle'></i></a>
    <%= rs.getString(8) %>
    <a href="incDecQuantityAction.jsp?id=<%=rs.getString(1)%>&quantity=dec"><i class='fas fa-minus-circle'></i></a>
  </td>
  <td><i class="fas fa-rupee-sign"></i><%= rs.getString(10) %></td>
  <td><a href="removeFromCart.jsp?id=<%=rs.getString(1) %>">Remove <i class='fas fa-trash-alt'></i></a></td>
</tr>
<%
    }
} catch (Exception e) {
    out.println("Error: " + e);
}
%>
</tbody>
</table>
<br><br><br>


</body>
</html>