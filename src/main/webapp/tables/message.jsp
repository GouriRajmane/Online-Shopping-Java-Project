 <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
try {
    Connection con = ConnectionProvider.getCon();

    if (con == null) {
        out.println("Database connection failed.");
    } else {
        Statement st = con.createStatement();
        
       	String q4 = "create table message(id int AUTO_INCREMENT,email varchar (100), subject varchar(200), body varchar(800), PRIMARY KEY(id))";
        System.out.println(q4); 
        st.execute(q4);
        out.println("MESSAGE Table created successfully");
        
         
        con.close();
    }
} catch (Exception e) {
    out.println("Error: " + e);
}
%>
 