<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ragistation page</title>

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

<main class=" primary_background banner-background" style="padding-bottom:80px">

	<div class="container">
		<div class="row" >
		
			<div class="col-md-6 offset-md-3">
			
				<div class="card">
				
					<div class="card-header  primary_background text-white text-center">
					<span class="	fa fa-user-plus fa-3x"></span>
					<br>
					
					<p>Register Page</p>
					</div>
					
									<div class="card-body">
					
					
					 <form id="reg-form" action="RegisterServlet" method="post">
  					
  						 
  						 
						<div class="form-group">
  						      <label for="user_name">User Name</label>
   							  <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name">
 						</div>
 						<div>
  						      <label for="exampleInputEmail1">Email address</label>
   							  <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
 						</div>
 						 
 						 
 							  
  						<div class="form-group">
  					  		  <label for="exampleInputPassword1">Password</label>
    						  <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  						</div>
  						 
  						 
  						 
  						 
  						<div class="form-group">
  					  		  <label for="gender">Select Gender</label><br>
    						  
    						  <input type="radio" id="gender" name="gender" value="Male">Male
    						  <input type="radio" id="gender" name="gender" value="Female">FeMale
  						</div>
  						 
  						<div>
  						 <textarea rows="2"  cols="65" id="" class="fome-conrol" name="about" placeholder="Enter somthing About Your Self"></textarea>
  						 
  						 
  						</div>
  						 
  						 
  							  
  						<div class="form-check">
  							  <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
  							  <label class="form-check-label" for="exampleCheck1">agree term and condition</label>
						</div>
  					 
  						<div class="container text-center" id="loader" style="display:none;">
  							 	<span class="fa fa-refresh fa-spin fa-2x "></span>
  							 	<h4>please wait..</h4>
						</div>
  			
  							 <button id="submit_btn" type="submit" class="btn btn-primary">Submit</button>
				   </form>
				
					
						 
					
				</div>	
					
		
					
					
				
				</div>
			
			</div>
		</div>
	
	</div>

</main>





	<!-- Java Script -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>


<script type="text/javascript" src="JavaScript/myjs.js"></script>

		<script>
				$(document).ready(function() {
					
					console.log("loaded.....")
					
					$('#reg-form').on('submit',function(event){
					
						event.preventDefault();
						
						let form=new FormData(this);
						
						$("#submit_btn").hide();
						$("#loader").show();
						
						//send register servelet
						
						$.ajax({
							url: "RegisterServlet",
							type:'POST',
							data:form,
							
							success:function(data,textStatus,jqXHR){
								console.log(data)
								
								$("#submit_btn").show();
								$("#loader").hide();
								
								//Alert message ke liye if success h jata hai tb
					
								
								if(data.trim() == 'done')
							{
									swal("Register Successfully we are redirecting to login page")
									.then((value) => {
									 window.location="login_page.jsp"
									//window.location="login_page.jsp"
									});
							}
						else
							{
							swal(data);
							}
								
								
								
							},
							error:function(jqXHR,textStatus,errorThrown)
							{

								$("#submit_btn").show();
								$("#loader").hide();

								swal("Something is wrong....try agein");
								
								
								
								//console.log(jqXHR)
								
							},
							processData:false,
							contentType:false
							
						});
					});
					
					
			});
		</script>
		
		
		
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
		
	

</body>
</html>