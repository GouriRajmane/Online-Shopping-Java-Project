<%@page import="project.ConnectionProvider"%>
<%@page import="java.sql.*"%>
<%
String email = session.getAttribute("email").toString();
String oldPassword = request.getParameter("oldPassword");
String newPassword = request.getParameter("newPassword");
String confirmPassword = request.getParameter("confirmPassword");

if (!confirmPassword.equals(newPassword)) {
	response.sendRedirect("changePassword.jsp?msg=notMatch");
} else {
	int check = 0;
	try {
		Connection con = ConnectionProvider.getCon();
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + oldPassword + "'");
		
		if (rs.next()) {
			check = 1;
			// Use a new statement for the update
			Statement st2 = con.createStatement();
			st2.executeUpdate("update users set password='" + newPassword + "' where email='" + email + "'");
			st2.close();
			response.sendRedirect("changePassword.jsp?msg=done");
		}
		
		if (check == 0) {
			response.sendRedirect("changePassword.jsp?msg=wrong");
		}

		rs.close();
		st.close();
		con.close();

	} catch (Exception e) {
		System.out.println(e);
		response.sendRedirect("changePassword.jsp?msg=invalid");
	}
}
%>
