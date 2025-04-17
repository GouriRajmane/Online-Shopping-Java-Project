<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%@include file="header.jsp" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">My Orders <i class='fab fa-elementor'></i></div>
<table>
        <thead>
          <tr>
            <th scope="col">S.No</th>
            <th scope="col">Product Name</th>
            <th scope="col">category</th>
            <th scope="col"><i class="fas fa-rupee-sign"></i>  Price</th>
            <th scope="col">Quantity</th>
            <th scope="col"><i class="fas fa-rupee-sign"></i> Sub Total</th>
            <th scope="col">Order Date</th>
             <th scope="col">Expected Delivery Date</th>
             <th scope="col">Payment Method</th>
              <th scope="col">Status</th>
              
          </tr>
        </thead>
        <tbody>
<%
int sno = 0;
int total=0;
try {
    Connection con = ConnectionProvider.getCon();
    PreparedStatement ps = con.prepareStatement(
            "SELECT p.name, p.category, p.price, c.quantity, c.orderDate, c.deliveryDate, c.paymentMethod, c.status " +
            "FROM cart c INNER JOIN product p ON c.product_id = p.id " +
            "WHERE c.email = ? AND (c.status = 'bill' OR c.status = 'processing')"
        );
    ps.setString(1, email);
    ResultSet rs = ps.executeQuery();
    

    while (rs.next()) {
        sno++;
        String productName = rs.getString("name");
        String category = rs.getString("category");
        int price = rs.getInt("price");
        int quantity = rs.getInt("quantity");
        int subtotal = price * quantity;
        total += subtotal;
        String orderDate = rs.getString("orderDate");
        String deliveryDate = rs.getString("deliveryDate");
        String paymentMethod = rs.getString("paymentMethod");
        String status = rs.getString("status");
%>
        <tr>
            <td><%= sno %></td>
            <td><%= productName %></td>
            <td><%= category %></td>
            <td><i class="fas fa-rupee-sign"></i> <%= price %></td>
            <td><%= quantity %></td>
            <td><i class="fas fa-rupee-sign"></i> <%= subtotal %></td>
            <td><%= orderDate %></td>
            <td><%= deliveryDate %></td>
            <td><%= paymentMethod %></td>
            <td>
                <%
                    if ("processing".equalsIgnoreCase(status)) {
                %>
                    <span style="color: orange; font-weight: bold;">Processing</span>
                <%
                    } else if ("bill".equalsIgnoreCase(status)) {
                %>
                    <span style="color: green; font-weight: bold;">Completed</span>
                <%
                    } else {
                %>
                    <span style="color: gray;">No Order Found</span>
                <%
                    }
                %>
            </td>
        </tr>
<%
    }


%>
        </tbody>
      </table>
      <table>
    <tr>
        <th scope="col" style="background-color: yellow; font-size: 20px; text-align: center;">
            Total: <i class="fas fa-rupee-sign"></i> <%= total %>
        </th>
    </tr>
</table>
<%
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>

      <br>
      <br>
      <br>

</body>
</html>