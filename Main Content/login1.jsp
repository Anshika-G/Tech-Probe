<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.sql.*" %>
    <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String nam = null,sc=null,tnam=null,st;
	int flag=0,count=0,var=0,ch=0;
	Connection conn = null;
	tnam=(String)session.getAttribute("teamname");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/game","root","");
		String sql = "select login_id from registration where teamnam='"+tnam+"'";
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
			nam = rs.getString("login_id");
			 session.setAttribute("id",nam);
			%><jsp:forward page="level1ques1.jsp"></jsp:forward>
			<% 
		}	 
		
	}
	catch(Exception e)
	{
		out.print(e);
	}
%>
</body>
</html>