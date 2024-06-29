<%@page import="blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>


		<!-- CSS -->
		
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="CSS/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <!-- Font Awesome CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">


<style >
	.banner-background
	{
		clip-path: polygon(50% 0%, 100% 0, 100% 95%, 69% 98%, 38% 93%, 0 100%, 0 0);


	}

</style>


</head>
<body>
<!-- Nav Bar -->
<%@include file="normal_navbar.jsp" %>

<main class="d-flex align-items-center  primary_background banner-background" style="height: 75vh;">

	<div class="container">
		<div class="row" >
		
			<div class="col-md-4 offset-md-4">
			
				<div class="card">
				
					<div class="card-header  primary_background text-white text-center">
						<span class="	fa fa-user-plus fa-3x"></span>
						<br>
					
						<h3>Login Page</h3>
					</div>
					
					<div class="card-body">
						
						<%
							Message	m =(Message) session.getAttribute("msg");
							if(m!=null)
							{
					     %>
							<div class="alert <%=m.getCssClass() %>" role="alert">
  								<%=m.getContent() %>
  							</div>
						
						<% 	
							session.removeAttribute("msg");
						
							}
						
						
						%>
					<div class="card-body">
						 <form action="LoginServlet" method="post">
  							  <div class="form-group">
  						      	<label for="exampleInputEmail1">Email address</label>
   							  	<input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
  							  	<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
 							  </div>
  							  <div class="form-group">
  					  		 	 <label for="exampleInputPassword1">Password</label>
    						  	<input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  							  </div>
  							  
  							  <!--  <div class="form-check">
  							  <input type="checkbox" class="form-check-input" id="exampleCheck1">
  							  <label class="form-check-label" for="exampleCheck1">Check me out</label>
  							 </div> -->
  							
  							<div class="container text-center">
  								<button type="submit" class="btn btn-primary">Submit</button>
  							</div>
  							 
					   </form>
					
					</div>		
					
					
				
				</div>
			
			</div>
		</div>
	
	</div>
	</div>

</main>


</br></br>

<!--  Start footer part -->

<footer id="footer" class="bg-body-tertiary text-center">
  <!-- Grid container -->
  <div class="container p-4 pb-0" >
    <!-- Section: Social media -->
    <section class="mb-4">
      <!-- Facebook -->
  <!-- Facebook -->
  <a
    data-mdb-ripple-init
    class="btn text-white btn-floating m-3"
    style="background-color: #3b5998;"
    href="https://www.facebook.com/profile.php?id=100022368579298"
    role="button"
  >
    <i class="fab fa-facebook-f"></i>
  </a>

  <!-- Twitter -->
  <a
    data-mdb-ripple-init
    class="btn text-white btn-floating m-3"
    style="background-color: #55acee;"
    href="https://twitter.com/your-profile-url"
    role="button"
  >
    <i class="fab fa-twitter"></i>
  </a>

  <!-- Google -->
  <a
    data-mdb-ripple-init
    class="btn text-white btn-floating m-3"
    style="background-color: #dd4b39;"
    href="https://plus.google.com/shivamtripathi"
    role="button"
  >
    <i class="fab fa-google"></i>
  </a>

  <!-- Instagram -->
  <a
    data-mdb-ripple-init
    class="btn text-white btn-floating m-3"
    style="background-color: #ac2bac;"
    href="https://www.instagram.com/s.tripathi_1"
    role="button"
  >
    <i class="fab fa-instagram"></i>
  </a>

  <!-- Linkedin -->
  <a
    data-mdb-ripple-init
    class="btn text-white btn-floating m-3"
    style="background-color: #0082ca;"
    href="https://www.linkedin.com/in/shivam-tripathi-a20a39193/"
    role="button"
  >
    <i class="fab fa-linkedin-in"></i>
  </a>

  <!-- Github -->
  <a
    data-mdb-ripple-init
    class="btn text-white btn-floating m-3"
    style="background-color: #333333;"
    href="https://github.com/ShivamTripathi-9/"
    role="button"
  >
    <i class="fab fa-github"></i>
  </a>
    </section>
    <!-- Section: Social media -->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.05);">
    © 2024 Copyright: Shivam Tripathi  9628209929 </br>
    <a class="text-body" href="mailto:shivamtripathi93758@gmail.com /">shivamtripathi93758@gmail.com</a>
  </div>
  <!-- Copyright -->
</footer>


<!-- End of footer -->





	<!-- Java Script -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	

	<script type="text/javascript" src="JavaScript/myjs.js"></script>

</body>
</html>



















	  
  					