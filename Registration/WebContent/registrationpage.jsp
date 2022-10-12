<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
<div align="center">
<form action="Regi1" method="post">
<table width=50%>
<h1>Registration Form</h1>
<tr>
<td>Firstname</td>
<td><input type="text" name="firstname" required></td>

</tr>
<tr>
<td>Lastname</td>
<td><input type="text" name="lastname" required></td>

</tr>
<tr>
<td>Phonenumber</td>

<td><input type="tel" pattern="[6-9]{1}[0-9]{9}" name="phonenumber" required></td>

</tr>
<tr>
<td>EmailId</td>
<td><input type="email" name="email" required></td>

</tr>
<tr>
<td>Language</td>
<td>C<input type="checkbox" name="lang" value="C" >
C++<input type="checkbox" name="lang" value="C++" >
Java<input type="checkbox" name="lang" value="Java" >


</tr>
</table>
<input type="submit" value="Submit">
<input type="reset" value="Reset"> 

</form>

</div>
</body>
</html>