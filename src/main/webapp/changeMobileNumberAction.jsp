<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String mobileNumber = request.getParameter("mobileNumber");
String password = request.getParameter("password");

int check = 0;
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    
    ResultSet rs = st.executeQuery("SELECT * FROM users WHERE email='" + email + "' AND password='" + password + "'");

    if (rs.next()) {
        st.executeUpdate("UPDATE users SET mobileNumber='" + mobileNumber + "' WHERE email='" + email + "'");
        response.sendRedirect("changeMobileNumber.jsp?msg=done");
    } else {
        response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
    }
} catch (Exception e) {
    e.printStackTrace(); // Optional: print error in server logs for debugging
    response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
}
%>
