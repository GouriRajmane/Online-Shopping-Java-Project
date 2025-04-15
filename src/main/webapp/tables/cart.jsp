 <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
try {
    Connection con = ConnectionProvider.getCon();

    if (con == null) {
        out.println("Database connection failed.");
    } else {
        Statement st = con.createStatement();
        
       	
        
         String q3= "create table cart(email varchar(100), product_id int, quantity int, price int, total int, address varchar(500), city varchar(100), state varchar(100), country varchar(100), mobileNumber bigint, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transactionId varchar(100), status varchar(100) )";
         System.out.println(q3); 
         st.execute(q3);
         out.println("CART Table created successfully");
        con.close();
    }
} catch (Exception e) {
    out.println("Error: " + e);
}
%>
 