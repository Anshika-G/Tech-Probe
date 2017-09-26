<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
	<link rel="stylesheet" href="stylee.css">
	<title>Login/Register</title>
	<style type="text/css">
	*{
		font-family: 'Raleway', sans-serif;
	}
		input,#alert{
			margin-top: 10px;
			margin-bottom: 10px;
			padding: 25px !important;
			font-size: 30px !important;
		}
		button{
			padding: 15px !important;
			font-size: 30px !important;
		}
		@media (min-width:600px)  {
			input,button,#alert{
				width: 50% !important; 
			}
		#msge{
			color:red;
			font-size: 30px !important;
		}
		}
	</style>
	
</head>
<body>

<form action="register.jsp" method="post">

<div class="container-fluid">
	<center>
		<h1>Sign up here</h1>
		<div class="alert alert-danger" id="alert" style="display: none">
		 
		</div>
		<div class="row">
		    	<div class="form-group">
		    	      <div class="col-sm-12">
		    	          <p id="msge"><% 
	String msg = (String)request.getAttribute("Error");
	if(msg!=null)
	out.print(msg);

   %></p>
		   
		
		    	      </div>
		    	</div>
		    	</div>
		<div class="row">

		    	<div class="form-group">
		    	      <div class="col-sm-12">             
		    	        <input type="text" class="form-control" id="teamname" placeholder="Team Name" name="teamname" required="required">
		    	      </div>
		    	</div>
		 </div>
		<div class="row">

		    	<div class="form-group">
		    	     <div class="col-sm-12">             
		    	        <input type="text" class="form-control" id="college" placeholder="College" name="college" required="required">
		    	      </div>
		    	</div>
		 </div>
		<div class="row">
		    	<div class="form-group">
		    	      <div class="col-sm-12">              
		    	        <input type="text" class="form-control" id="mobile" placeholder="Contact No(10 digit)" name="mobile" required="required">
		    	      </div>
		    	</div>
		</div>
		<div class="row">
		    	<div class="form-group">
		    	      <div class="col-sm-12">              
		    	        <input type="email" class="form-control" id="emailid" placeholder="emailid" name="name" required="required">
		    	      </div>
		    	</div>
		</div>
		
	<input type="submit" id="signUpSubmit" class="btn btn-danger" style="width: 100%;cursor: pointer !important">
		
	</center>
	</div>
</form>
</body>
</html>