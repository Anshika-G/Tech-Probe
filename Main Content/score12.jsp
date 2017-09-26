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
Integer sc;
String c,id;
Connection conn=null;
id=(String)session.getAttribute("id");
//session.setAttribute("id",id);
try
{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/game","root","");
	String sql = "select *from registration where login_id='"+id+"'";
	Statement stmt=conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next())
	{
		c = rs.getString("score");
		sc=Integer.parseInt(c);
		sc=sc+1;
		 	String s3 = "update registration set score='"+sc+"' where login_id='"+id+"'";
			int action = conn.createStatement().executeUpdate(s3);
			conn.setAutoCommit(true);
			if(action>=1)
			{
				%><jsp:forward page="level4ques2.jsp"></jsp:forward><%
			
			}
			else
			{
				out.println("cannot save");
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