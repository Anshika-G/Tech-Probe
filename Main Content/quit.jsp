<%@ page import = "javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    
 	<link rel="stylesheet" href="Style3.css">
    <link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Space Mono">
    </head>
    
    <body >

    
     <div class="container">
	    <div class="head">
	        <h3><b><i><marquee>END OF THE GAME</marquee></i></b> </h3><br><br><br><br>
            <p id="ques" style="text-align: center;">Sorry! you gave a wrong answer</p><br><br>
	    </div>

        <div class="list">
            <ul style="list-style-type:none;">
            <% session.removeAttribute("Error");
            session.removeAttribute("Error1");
            session.removeAttribute("teamname");
            session.removeAttribute("id");
            session.invalidate();%>
                <button class="button"><li><a href="start_page.html" id="line" >LOG OUT</a><li></button></br>
            </ul>
            <br><br><br><br>
        </div>
    
        </div></body>    
</html>
	