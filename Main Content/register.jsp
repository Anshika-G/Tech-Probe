<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String email = request.getParameter("name");
	String tname = request.getParameter("teamname");
	String colg = request.getParameter("college");
	String  mno = request.getParameter("mobile");
	Connection conn = null;
	String st;
	session.setAttribute("teamname",tname);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/game","root","");
		String sql = "insert into registration(teamnam,college,mobileno,emailid) values('"+tname+"','"+colg+"','"+mno+"','"+email+"')";
		if((mno.length()!=10))
		{
			System.out.print("hi");
			request.setAttribute("Error","Enter Correct mobile no");
			%>
			<jsp:forward page="index1.jsp"></jsp:forward>
			<%
		}
		else 
		{
			int action = conn.createStatement().executeUpdate(sql);
			conn.setAutoCommit(true);
			if(action==1)
			{
				%><jsp:forward page="index.html"></jsp:forward><% 
			}
		}
	}
	
	catch(Exception e)
	{
		out.print(e);
	}
%>
</body>
</html>