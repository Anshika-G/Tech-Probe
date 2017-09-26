<%@ page import = "javax.servlet.*" %>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="Style3.css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Space Mono">
  <SCRIPT type="text/javascript">
	window.history.forward();
	function noBack() { window.history.forward(); }
</SCRIPT>
<script>
    /*function check(e)
    {
    alert(e.keyCode);
    }*/
    document.onkeydown = function(e) {
            if (e.ctrlKey && (e.keyCode === 67 || e.keyCode === 86 || e.keyCode === 85 || e.keyCode === 117)) {//Alt+c, Alt+v will also be disabled sadly.
                alert('not allowed');
            }
            return false;
    };
    </script>
</head>
<style>
	
	.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    left: 0;
    top: 0;
    width: 50%; /* Full width */
    height: 50%; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content/Box */
.modal-content {
    background-color: #fefefe;
    margin: 15% auto; /* 15% from the top and centered */
    padding: 20px;
    border: 1px solid #888;
    width: 30%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
}

.close:hover,
.close:focus {
    color: red;
    text-decoration: none;
    cursor: pointer;
}
#hint,#QUIT,#QUIT:hover{
	margin-left: -15%;
	width:54%;
}
#QUIT,#QUIT:hover{ margin-left: 31%;width:33%; }
#hint:hover{color: black;}
#line{
	
	color: black;
}
.button:hover{
	color: black;
	cursor: pointer;
}
#ques{ text-align: center; }
.modal {
    display: none; /* Hidden by default */
    position: fixed; /* Stay in place */
    z-index: 1; /* Sit on top */
    padding-top: 200px; /* Location of the box */
    padding-left: 220px;
    left: 0;
    top: 0;
    width: 70%; /* Full width */
    height: 500px; /* Full height */
    overflow: auto; /* Enable scroll if needed */
    background-color: rgb(0,0,0); /* Fallback color */
    background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
    position: relative;
    background-color: #006064;
    margin: auto;
    width: 80%;
    font-family: 'Space Mono', sans-serif;
    text-align: center;
    text-decoration: none;
    font-size: 20px;
    border-radius:8px;
    box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
    -webkit-animation-name: animatetop;
    -webkit-animation-duration: 0.4s;
    animation-name: animatetop;
    animation-duration: 0.4s
}

h2{ margin-left: 10%; }


</style>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
   <div class="container">
    
     

<button id="timer">Score = 08</button>
<form  method="post">
  <center><p><% 
	String msg = (String)session.getAttribute("Q");
	if(msg!=null)
	out.print(msg);
	session.removeAttribute("Q");
   %></p></center>
   <center><p><% 
	String msg1 = (String)session.getAttribute("R");
	if(msg1!=null)
	out.print(msg1);
	session.removeAttribute("R");
   %></p></center>
        <div class="head">
            <h3><b><i><marquee>LEVEL 3 </marquee></i></b> </h3><br><br>
            <h2> QUESTION 1</h2>
             <p id="ques">---------A constructor is called at the time of---------</p>
        </div>

        <div class="list">
                <ul style="list-style-type:none">
                    <button class="button" name="sc" onclick="this.form.action = 'score8.jsp'"><li><id="line" >decleration of the object</id></li></button>
                    <button class="button"><li><a href="quit.jsp" id="line" >use of an object</a></li></button>
            </ul>
            <ul style="list-style-type:none" >
                <button class="button"><li><a href="quit.jsp" id="line" > decleration of a class</a></li></button>
                <button class="button"><li><a href="quit.jsp" id="line" >use of a class</a></li></button>
            </ul>
        </div>
        </form>
        <div style="margin-left: 40%;">
            <br>
                                  <!-- Trigger/Open The Modal -->
            <button id="hint">See Hint</button>  
            <%
Integer ncount=0,mcount,fl,f=0;
String c=null,s=null,id;
Connection conn=null;
id=(String)session.getAttribute("id");
try
{
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/game","root","");
	String sql = "select *from registration where login_id='"+id+"'";
	Statement stmt=conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next())
	{
		c = rs.getString("count");
		s = rs.getString("flag8");
		fl=Integer.parseInt(s);
		mcount=Integer.parseInt(c);
		if(fl<1)
		{
			f=fl+1;
		 	String s2 = "update registration set flag8='"+f+"' where login_id='"+id+"'";
			conn.createStatement().executeUpdate(s2);
			conn.setAutoCommit(true);
		 	if(mcount>2)
		 	{
			 	System.out.print("hy");
				session.setAttribute("Q","Hints have been used three times.");
				%>
				<script>var btn = document.getElementById("hint");
				btn.onclick=function()
				{
				location.reload();
				}</script>
				<%
				
		 	}
		 	else
		 	{
			 	ncount=mcount + 1;
				String s1 = "update registration set count='"+ncount+"' where login_id='"+id+"'";
				int action = conn.createStatement().executeUpdate(s1);
				conn.setAutoCommit(true);
				if(action==1)
				{
					System.out.print("hy");
					request.setAttribute("two","Hint modal box");
					%>

										<!-- The Modal -->
            <div id="myModal" class="modal">

              <!-- Modal content -->
              <div class="modal-content">
                <div class="modal-header">
                  <span class="close">&times;</span>
                  <h2 style="color: black;margin-left: 10%;">HINT</h2>
                </div>
                <div class="modal-body">
                  <p style="text-align: center;">It is contains small units called cells</p><br>
                </div>
              </div>

            </div>

            <script>
            // Get the modal
            var modal = document.getElementById('myModal');

            // Get the button that opens the modal
            var btn = document.getElementById("hint");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal 
            btn.onclick = function() {
                modal.style.display = "block";
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
            modal.style.display = "none";
            location.reload();
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
                location.reload();
            }
        }
            </script>



					<% 	
					
				}
		 	}
		}
				else
				{
					System.out.print("hy");
					session.setAttribute("R","Hint have been used once"); 
					%>
					<script>var btn = document.getElementById("hint");
					btn.onclick=function()
					{
					location.reload();
					}</script>
					<%
				}
			}
		}			
catch(Exception e)
{
	out.print(e);
}
%>
        </div>
        
        <button id="QUIT"><a href="quit_page.jsp" id="line">Quit Game</a></button>
           
    </div>
    </body>
</html>
    