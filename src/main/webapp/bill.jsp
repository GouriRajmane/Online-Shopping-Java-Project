<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="footer.jsp" %>
<html>
<head>
    <link rel="stylesheet" href="css/bill.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <title>Bill</title>
</head>
<body>

<%
String email = (String) session.getAttribute("email");
int total = 0;
int sno = 0;

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();

    // Total bill
    ResultSet rs = st.executeQuery("SELECT SUM(total) FROM cart WHERE email='" + email + "' AND status='bill'");
    if (rs.next()) {
        total = rs.getInt(1);
    }

    // Fetching user and order details
    ResultSet rs2 = st.executeQuery("SELECT * FROM users INNER JOIN cart ON users.email=cart.email WHERE cart.email='" + email + "' AND cart.status='bill'");

    if (rs2.next()) {
%>

<h2 style="text-align: center; font-size: 20px; color: #2980b9; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
  <i class="fas fa-receipt" style="margin-right: 8px; color: #2c3e50;"></i> Online Shopping Bill
</h2>
		
        <hr>
        <div class="left-div"><h3>Name: <%= rs2.getString("name") %></h3></div>
        <div class="right-div-right"><h3>Email: <%out.println(email); %></h3></div>
        <div class="right-div"><h3>Mobile Number: <%= rs2.getString("mobileNumber") %></h3></div>

        <div class="left-div"><h3>Order Date: <%= rs2.getString("orderDate") %></h3></div>
        <div class="right-div-right"><h3>Payment Method: <%= rs2.getString("paymentMethod") %></h3></div>
        <div class="right-div"><h3>Expected Delivery: <%= rs2.getString("deliveryDate") %></h3></div>

        <div class="left-div"><h3>Transaction ID: <%= rs2.getString("transactionId") %></h3></div>
        <div class="right-div-right"><h3>City: <%= rs2.getString("city") %></h3></div>
        <div class="right-div"><h3>Address: <%= rs2.getString("address") %></h3></div>

        <div class="left-div"><h3>State: <%= rs2.getString("state") %></h3></div>
        <div class="right-div-right"><h3>Country: <%= rs2.getString("country") %></h3></div>
        <hr>
<%
    }
%>

   
<h3 style="font-size: 24px; color: blue; text-align: center; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; ">
  <i class="fas fa-box-open" style="color: #e67e22; margin-right: 8px;"></i>
  Product Details
</h3>
<table id="customers">
    <thead>
        <tr class="table-header">
		    <th>S.No</th>
		    <th>Product Name</th>
		    <th>Category</th>
		    <th><i class="fas fa-rupee-sign"></i> Price</th>
		    <th>Quantity</th>
		    <th><i class="fas fa-rupee-sign"></i> Sub Total</th>
		</tr>

    </thead>
    <tbody>
<%
    ResultSet rs1 = st.executeQuery(
        "SELECT * FROM cart INNER JOIN product ON cart.product_id = product.id WHERE cart.email='" + email + "' AND cart.status='bill'"
    );
    while (rs1.next()) {
        sno++;
%>
        <tr>
            <td><%= sno %></td>
            <td><%= rs1.getString("name") %></td>
            <td><%= rs1.getString("category") %></td>
            <td><i class="fas fa-rupee-sign"></i> <%= rs1.getString("price") %></td>
            <td><%= rs1.getString("quantity") %></td>
            <td><i class="fas fa-rupee-sign"></i> <%= rs1.getString("total") %></td>
        </tr>
<%
    }
%>
    </tbody>
</table>

    <h3>Total: <i class="fas fa-rupee-sign"></i> <%out.println(total);%></h3>

    <a href="continueShopping.jsp">
        <button class="button left-button">Continue Shopping &nbsp;<i class='far fa-arrow-alt-circle-right'></i></button>
    </a>
    <a onclick="window.print();">
        <button class="button right-button">Print &nbsp;<i class="fas fa-print"></i></button>
    </a>
    <br><br><br><br>

<%
} catch(Exception e) {
    out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
    e.printStackTrace();
}
%>

</body>
</html>
