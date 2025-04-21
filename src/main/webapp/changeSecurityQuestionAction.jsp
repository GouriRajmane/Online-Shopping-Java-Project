<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String securityQuestion = request.getParameter("securityQuestion");
String newAnswer = request.getParameter("newAnswer");
String password = request.getParameter("password");
String country = request.getParameter("country");

try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
    
    if (rs.next()) {
        st.executeUpdate("update users set securityQuestion='" + securityQuestion + "', answer='" + newAnswer + "' where email='" + email + "'");
        response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
    } else {
        response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
    }

} catch (Exception e) {
    response.sendRedirect("addChangeAddres.jsp?msg=invalid");
}
%>
