 <%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>

<%
try {
    Connection con = ConnectionProvider.getCon();

    if (con == null) {
        out.println("Database connection failed.");
    } else {
        Statement st = con.createStatement();
        
       	String q1 = "create table users(name varchar(100), email varchar(100) primary key, mobileNumber bigint, securityQuestion varchar(200), answer varchar(200), password varchar(100), address varchar(200), city varchar(100), state varchar(100), country varchar(100))";
        System.out.println(q1); 
        st.execute(q1);
        out.println("USERS Table created successfully");
        
         
        con.close();
    }
} catch (Exception e) {
    out.println("Error: " + e);
}
%>
 