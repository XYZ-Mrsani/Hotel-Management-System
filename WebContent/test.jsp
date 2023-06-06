<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<input type="text" value="<%=(request.getSession().getAttribute("checkin") == null) ? "" : (String) request.getSession().getAttribute("checkin")%>"><br>
<input type="text" value="<%=(request.getSession().getAttribute("checkout") == null) ? "" : (String) request.getSession().getAttribute("checkout")%>"><br>
<input type="text" value="<%=(request.getSession().getAttribute("day") == null) ? "" : request.getSession().getAttribute("day")%>"><br>
</body>
</html>