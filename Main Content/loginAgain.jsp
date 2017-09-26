<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="stylee.css">
	<title>Login</title>
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
			padding: 10px !important;
			font-size: 30px !important;
		}
		@media (min-width:600px)  {
			input,button,#alert{
				width: 50% !important; 
				font-family: 'Raleway', sans-serif;
			}
		}
		.container-fluid{
			margin-top: 10%;
		}
		#msge{
			color:red;
			font-size: 30px !important;
		}
	</style>
	
</head>
<body>



<div class="container-fluid">
	<center>
		<h1>Login</h1>
		<div class="alert alert-danger" id="alert" style="display: none">
		 
		</div>
		
		<div class="row">
		    	<div class="form-group">
		    	      <div class="col-sm-12">
		    	          <p id="msge"><% 
	String msg = (String)session.getAttribute("Error");
	if(msg!=null)
	out.print(msg);
	session.removeAttribute("Error");
   %></p>
		   
		
		    	      </div>
		    	</div>
		    	</div>
		    	<form action="login.jsp" method="post">
		<div class="row">        
		    	        <input type="number" class="form-control" id="name" placeholder="id" name="id" required="required";>
		    	      </div>
		    	</div>
		</div>
		
	<input type="submit" id="login" class="btn btn-danger" style="width: 100%; margin-left :25%;cursor: pointer !important;">
		
	</center>
	</div>
	</div>
</form>
</body>
</html>