<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="" method=post>
<h3>View Details</h3>
<label for="Details">Select Language:</label>
<select name="language" id="viewDetails">
  <option value="C" selected disabled>languages</option>
  <option value="C">C</option>
  <option value="C++">C++</option>
  <option value="Java">Java</option>
  <option value="Any">Any</option>
</select><br>
<input type="submit" value="Submit">
</form>

<%
String language = request.getParameter("language");
if(language != null){
%>
<table>
<tr>
<td>First Name</td>
<td>Last Name</td>
<td>Phone Number</td>
<td>Email Id</td>
<td>Languages</td>
<tr>
<%


try{
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/database1","root","Divya@514");
ResultSet rs = null;
if(language.equals("Any")){
PreparedStatement ps = con.prepareStatement("select r.firstName,r.lastName,r.phoneNumber,r.email,l.language from register r,language l where r.email = l.email");
rs = ps.executeQuery();
}
else{
PreparedStatement ps = con.prepareStatement("select r.firstName,r.lastName,r.phoneNumber,r.email,l.language from register r,language l where r.email = l.email and l.language = ?;");

ps.setString(1, language);
rs = ps.executeQuery();
}
%>



<%while(rs.next()){ %>
<tr>
<td><%=rs.getString("firstName")%></td>
<td><%=rs.getString("lastName")%></td>
<td><%=rs.getString("phoneNumber")%></td>
<td><%=rs.getString("email")%></td>
<td><%=rs.getString("language")%></td>
</tr>
<%} %>
<%
}
catch(ClassNotFoundException e){
e.printStackTrace();
}

} %>
</table>
</body>
</html>

