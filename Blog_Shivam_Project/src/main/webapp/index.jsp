<%@page import="blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ShivamBlog</title>

		<!-- CSS -->
		
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="CSS/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


 
  <!-- Font Awesome CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">



<style>
	.banner-background{
		clip-path: polygon(50% 0%, 100% 0, 100% 95%, 69% 98%, 38% 93%, 0 100%, 0 0);



	}

</style>
	
</head>
<body>

<!-- Nav Bar -->
<%@include file="normal_navbar.jsp" %>

<!-- Container -->
<div class="container-fluid p-0 m-0">
	<div class="jumbotron primary_background text-white banner-background  ">
		<div class="container ">
			<h3>Welcome To Shivam blog</h3>
			<p>	Welcome Shivam Blog Word of Technology
				A programming language is a system of notation for writing computer programs.[1]
				The source code for a simple computer program written in the C programming language. The gray lines are comments that help explain the program to humans in a natural language. When compiled and run, it will give the output "Hello, world!".
				A programming language is usually described in terms of its syntax (form) and semantics (meaning). These are usually defined by a formal language
			</p>
			<p>
				A language usually has at least one implementation in the form of a compiler or interpreter, allowing programs written in the language to be executed.
			</p>
			<button class="btn btn-outline-light btn-lg"><span class="	fa fa-external-link"></span> Start ! its Free</button>
			<a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle	fa-spin"></span>Login</a>      
			
		</div>
	</div>

</div>
<br>
			<!-- Cards -->
<div id="card" class="container">
	<div class="row mb-2">
		<div class="col-md-4">
				<div class="card" >
  					<div class="card-body">
  			 			 <h5 class="card-title">Java Programming </h5>
   						 <p class="card-text">Java is a programming language . Java is a high level, robust, object-oriented and secure programming language.
							Java was developed by Sun Microsystems in the year 1995. James Gosling is known as the father of Java. Before Java, its name was Oak. Since Oak was already a registered company, so James Gosling and his team changed the name from Oak to Java.
									</p>
    					<a href="#" class="btn btn-primary primary_background text-white">Read More</a>
 			 		</div>
				</div>
		
		</div>
		


	<div class="col-md-4">
				<div class="card" >
  					<div class="card-body">
  			 			 <h5 class="card-title">C Programming </h5>
   						 <p class="card-text">C language Tutorial with programming approach for beginners and professionals, helps you to understand the C language tutorial easily. Our C tutorial explains each topic with programs.

The C Language is developed by Dennis Ritchie for creating system applications that directly interact with the hardware devices such as drivers, kernels, etc.

</p>
    					<a href="#" class="btn btn-primary primary_background text-white">Read More</a>
 			 		</div>
				</div>
		
		</div>

			<div class="col-md-4">
				<div class="card" >
  					<div class="card-body">
  			 			 <h5 class="card-title">Python Programming </h5>
   						 <p class="card-text">Python is a general-purpose, dynamically typed, high-level, compiled and
   						  interpreted, garbage-collected, and purely object-oriented programming language that supports
   						   procedural,
   						  object-oriented, and functional programming.
   						  Python was created by Guido van Rossum.
   					In January 1994, Python 1.0 was released as a usable and stable programming language.
   						  
</p>
    					<a href="#" class="btn btn-primary primary_background text-white">Read More</a>
 			 		</div>
				</div>
		
			</div>
	
	</div>
	
	
	
	<div class="row">
		<div class="col-md-4">
				<div class="card" >
  					<div class="card-body">
  			 			 <h5 class="card-title">MySql</h5>
   						 <p class="card-text">The project of MySQL was started in 1979 when MySQL's inventor Michael Widenius developed an in-house database tool called UNIREG for managing databases. After that, UNIREG has been rewritten in several different languages and extended to handle big databases.</p>
    					<a href="#" class="btn btn-primary primary_background text-white">Read More</a>
 			 		</div>
				</div>
		
		</div>
		


	<div class="col-md-4">
				<div class="card" >
  					<div class="card-body">
  			 			 <h5 class="card-title">JavaScript </h5>
   						 <p class="card-text">JavaScript (js) is a light-weight object-oriented programming
   						  language which is used by several websites for scripting the webpages. 
   						  It is an interpreted, full-fledged programming language that enables 
   						  dynamic interactivity on websites when applied to an HTML document</p>
    					<a href="#" class="btn btn-primary primary_background text-white">Read More</a>
 			 		</div>
				</div>
		
		</div>

			<div class="col-md-4">
				<div class="card" >
  					<div class="card-body">
  			 			 <h5 class="card-title">HTML & CSS </h5>
   						 <p class="card-text">HTML, an acronym for HyperText Markup Language, is the standard language for designing web pages. </br> 
   						 CSS (Cascading Style Sheets) is a stylesheet language used to design the webpage to make it attractive.
   						  CSS allows you to apply styles to web pages</p>
    					<a href="#" class="btn btn-primary primary_background text-white">Read More</a>
 			 		</div>
				</div>
		
			</div>
	
	</div>


</div>
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
    � 2024 Copyright: Shivam Tripathi  9628209929 </br>
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

















