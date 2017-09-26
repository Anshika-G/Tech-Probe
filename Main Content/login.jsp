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
	String lid=request.getParameter("id");
	String id=null,tname=null,nam=null;
	int flag=0,count=0,var=0,ch;
	Connection conn = null;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/game","root","");
		String sql = "select * from registration";
		Statement stmt=conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next())
		{
		nam = rs.getString("login_id");
		if(lid.equals(nam))
		{
			flag=1;
			session.setAttribute("id",lid);
		}
		}
		if(flag!=1)
		{
			session.setAttribute("Error","Invalid login id");
			%>
				<jsp:forward page="loginAgain.jsp"></jsp:forward>
			<% 
		}
		else
		{
			id=(String)session.getAttribute("id");
			sql = "select * from registration where login_id='"+id+"'";
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next())
			{
				tname=rs.getString("score");
				var=Integer.parseInt(tname);
				session.setAttribute("ch", var);
			}
				ch=(Integer)session.getAttribute("ch");
				switch(ch)
				{
					case 0: %> <jsp:forward page="level1ques1.jsp"></jsp:forward>
							<% 
							break;
					case 1: %> <jsp:forward page="level1ques2.jsp"></jsp:forward>
					<% 
					break;
					case 2: %> <jsp:forward page="level1ques3.jsp"></jsp:forward>
					<% 
					break;
					case 3: %> <jsp:forward page="level1ques4.jsp"></jsp:forward>
					<% 
					break;
					case 4 : %> <jsp:forward page="level2ques1.jsp"></jsp:forward>
					<% 
					break;
					case 5: %> <jsp:forward page="level2ques2.jsp"></jsp:forward>
					<% 
					break;
					case 6: %> <jsp:forward page="level2ques3.jsp"></jsp:forward>
					<% 
					break;
					case 7: %> <jsp:forward page="level2ques4.jsp"></jsp:forward>
					<% 
					break;
					case 8: %> <jsp:forward page="level3ques1.jsp"></jsp:forward>
					<% 
					break;
					case 9: %> <jsp:forward page="level3ques2.jsp"></jsp:forward>
					<% 
					break;
					case 10: %> <jsp:forward page="level3ques3.jsp"></jsp:forward>
					<% 
					break;
					case 11: %> <jsp:forward page="level3ques4.jsp"></jsp:forward>
					<% 
					break;
					case 12: %> <jsp:forward page="level4ques1.jsp"></jsp:forward>
					<% 
					break;
					case 13: %> <jsp:forward page="level4ques2.jsp"></jsp:forward>
					<% 
					break;
					case 14: %> <jsp:forward page="level4ques3.jsp"></jsp:forward>
					<% 
					break;
					case 15: %> <jsp:forward page="level4ques4.jsp"></jsp:forward>
					<% 
					break;
					case 16: %> <jsp:forward page="won.html"></jsp:forward>
					<% 
					break;
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