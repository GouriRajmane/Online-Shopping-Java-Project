 <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
try {
    Connection con = ConnectionProvider.getCon();

    if (con == null) {
        out.println("Database connection failed.");
    } else {
        Statement st = con.createStatement();
        
       	
        
         String q2= "create table product(id int, name varchar(300), category varchar(300), price int, active varchar(10))";
         System.out.println(q2); 
         st.execute(q2);
         out.println("PRODUCT Table created successfully");
        con.close();
    }
} catch (Exception e) {
    out.println("Error: " + e);
}
%>
 