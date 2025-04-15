<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = request.getParameter("email");
String mobileNumber = request.getParameter("mobileNumber");
String securityQuestion = request.getParameter("securityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

try {
    Connection con = ConnectionProvider.getCon();

    // Use PreparedStatement for safe querying and avoid SQL injection
    String selectQuery = "SELECT * FROM users WHERE email=? AND mobileNumber=? AND securityQuestion=? AND answer=?";
    PreparedStatement ps = con.prepareStatement(selectQuery);
    ps.setString(1, email);
    ps.setString(2, mobileNumber);
    ps.setString(3, securityQuestion);
    ps.setString(4, answer);

    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        // User is valid, now update password
        String updateQuery = "UPDATE users SET password=? WHERE email=?";
        PreparedStatement ps2 = con.prepareStatement(updateQuery);
        ps2.setString(1, newPassword);
        ps2.setString(2, email);
        ps2.executeUpdate();

        response.sendRedirect("forgotPassword.jsp?msg=done");
    } else {
        // Invalid user details
        response.sendRedirect("forgotPassword.jsp?msg=invalid");
    }

    // Close resources
    rs.close();
    ps.close();
    con.close();

} catch (Exception e) {
    e.printStackTrace();
    response.sendRedirect("forgotPassword.jsp?msg=invalid");
}
%>
