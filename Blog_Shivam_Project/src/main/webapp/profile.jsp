<%@page import="blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="blog.dau.PostDau"%>
<%@page import="blog.entities.Message"%>
<%@page import="blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error_page.jsp" %>
    
    <%
    	User user=(User)session.getAttribute("currentUser");
    if(user==null)
    {
    	response.sendRedirect("login_page.jsp");
    }
    
    
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile Page</title>



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
		 
		  
/*read more background image*/
		body {
  				background: url(image/p2.jpg);
   			 	background-size: cover;
   				background-attachment: fixed;
				}

		




</style>




</head>
<body>


			<!-- Start of NavBar -->


		<nav class="navbar navbar-expand-lg navbar-dark primary_background">
  <a class="navbar-brand" href="index.jsp"> <span class="fa fa-university"></span>ShivamBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#footer"><span class="	fa fa-user"></span>Contact</a>
      </li>
      
       
      <li class="nav-item">
        <a class="nav-link" href="" data-toggle="modal" data-target="#add-post-modal"><span class="	fa fa-asterisk"></span>Post</a>
      </li>
      
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-cart-arrow-down"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#card">Progaramming</a>
          <a class="dropdown-item" href="#">Management</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
     
      
      
    </ul>
    
   	<ul class="navbar-nav mr-right">
   	
   	 <li class="nav-item">
        <a class="nav-link " href="#!" data-toggle="modal" data-target="#profile-modal"><span class="	fa fa-user-circle"></span><%= user.getName() %></a>
      </li>
      
   	 <li class="nav-item">
        <a class="nav-link " href="LogoutServlet"><span class="	fa fa-user-plus"></span>Logout</a>
      </li>
  
   	</ul>
   	
  </div>
</nav>

	<!-- End of NavBar -->
	
						<%
							Message m=(Message)session.getAttribute("msg");
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
						
						<!-- main  body of page -->
						
		<main>
            <div class="container">
                <div class="row mt-4">
                
                    <!--first col-->
                    
                    <div class="col-md-4">
                    
                        <!--categories-->
                        
                        <div class="list-group">
                            <a href="#" onclick="getPosts(0, this)"  class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--categories-->

                              <% 
                              	PostDau d = new PostDau(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = d.getAllCategories();
                                for (Category cc : list1) 
                                {

                            %>
                            <a href="#" onclick="getPosts(<%= cc.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%= cc.getName()%></a>


                            <%  }

                            %> 
                        </div>

                    </div>

                    <!--second col-->
                    <div class="col-md-8"  >
                    
                        <!--posts-->
                        
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>

                </div>

            </div>

        </main>
						
						
						
						
						<!-- End body of page -->
						
	
	
	
	<!-- Start profile  modal -->
	


<!-- Modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary_background  text-white text-center">
        <h5 class="modal-title" id="exampleModalLabel">Shivam Blog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
    
       
       <div class="container text-center">
       
      
         <img src="pic/<%= user.getProfile()%> " class="img-fluid" style="border-radius: 50%; max-width: 150px" ></br>
       		
       	 <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>	
       	 
       	 <!-- Details---- Strat -->
       	 <div id="profile_detail">
       	 <table class="table">
  
  <tbody>
    <tr>
      <th scope="row">ID :</th>
      <td><%=user.getId() %></td>
     
    </tr>
    <tr>
      <th scope="row">Email :</th>
      <td><%=user.getEmail() %></td>
      
    </tr>
    <tr>
      <th scope="row">Gender :</th>
      <td><%=user.getGender() %></td>
      
    </tr>
    <tr>
      <th scope="row">About :</th>
      <td><%=user.getAbout() %></td>
      
    </tr>
   
  </tbody>
</table>
       	 </div>
       	 
       	 <!-- Profile edit -->
       	 
       	 <div id="profile-hide" style="display: none;">
       	 
       	 <h3 class="mt-2">Please edit Carefully</h3>
       	 <form action="EditServelet" method="post" enctype="multipart/form-data">
       	 
       	 <table  class="table">
       	 	<tr>
       	 		<td>ID :</td>
       	 		<td><%=user.getId() %></td>
       	 	</tr>
       	 	
       	 	<tr>
       	 		<td>Email :</td>
       	 		<td><input type="email" class="form-control" name="user_email" value=<%=user.getEmail() %> ></td>
       	 	</tr>
       	 	
       	 	<tr>
       	 		<td>Name :</td>
       	 		<td><input type="text" class="form-control" name="user_name" value=<%=user.getName() %> ></td>
       	 	</tr>
       	 	
       	 	<tr>
       	 		<td>Password :</td>
       	 		<td><input type="password" class="form-control" name="user_password" value=<%=user.getPassword() %> ></td>
       	 	</tr>
       	 	
       	 	<tr>
       	 		<td>Gender :</td>
       	 		<td><%=user.getGender().toUpperCase()%></td>
       	 	</tr>
       	 	
       	 	<tr>
       	 		<td>About :</td>
       	 		<td>   
       	 			<textarea class="form-control" name="user_about" rows="2"><%=user.getAbout() %></textarea>
       	 		
       	 		</td>
       	 	</tr>
       	 	
       	 	<tr>
       	 		<td>New Profile :</td>
       	 		<td><input type="file" class="form-control" name="image"  ></td>
       	 	</tr>
       	 
       	 
       	 </table>
       	 
       			 <div class="container">
       			 	<button type="submit" class="btn btn-outline-primary" ba>Save</button>
       	 
       	 		</div>
       	 </form>
       	 
       	 </div>
       	 
       	 
       	 
       	 <!-- details end -->
       
       </div> 
        
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
	
	<!-- End of Profile modal -->
	
	<!-- Start of addd post model -->


<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form action="AddPostServlet" method="post" id="add-post-form">
        
        <div class="form-control">
       
              <select class="form-control" name="cid">
              <option selected disabled> ---Select Category---</option>
              
              <%
              PostDau postd=new PostDau(ConnectionProvider.getConnection());
              ArrayList<Category> list=postd.getAllCategories();
              for(Category c:list)
              {
            	  
              
              
              %>
              
              	<option value="  <%= c.getCid()  %> "><%=c.getName() %></option>
             
              	
              	<%  } %>
              </select>
        
        
        </div>

        
       
        <div class="from-group">
        	<input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
        </div>
        
          <div class="from-group">
          <textarea  name="pContent" cols="60" style="height: 150px" class="fro-control" placeholder="Enter your content"></textarea>
        </div>
        
        <div class="from-group">
          <textarea  name="pCode" cols="60" style="height: 150px" class="fro-control" placeholder="Enter your  Code"></textarea>
        </div>
        
        <div class="from-group">
        <label>Select your pic:</label><r>
        	<input type="file" name="pic" />
        </div>
        
              
      <div class="container text-center">
      
      		<button type="submit" class="btn-outline-primary">Post</button>
      
      </div>
        
        
        </form>
        
        
      </div>
      
    </div>
  </div>
</div>
	
	
	<!-- End of add post model -->
	
	
	
	<!-- Java Script -->
<script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

<script type="text/javascript" src="JavaScript/myjs.js"></script>
	
	<script>
	
	$(document).ready(function(){
		
		
		//this is toggle logic
		
		let editstatus=false;
		
		$('#edit-profile-btn').click(function()
				{
			
			if(editstatus==false)
				{
					//alert("testing")
					
					$("#profile_detail").hide()
					
					$("#profile-hide").show();
					editstatus=true;
					
					$(this).text("Back");
					
				}
			else
				{
					$("#profile_detail").show()
				
					$("#profile-hide").hide();
				
					editstatus=false;
					
					$(this).text("Edit");
					
				}
					
					
				})
			
		
	});
	
	</script>
	
	<!-- Now Add post JS -->
	
	<script>
		
		$(document).ready(function(e){
			alert("loaded..")
		$("#add-post-form").on("submit",function(event){
			//this code gets called when form is submitted
			event.preventDefault();	
			console.log("you have submitted....")
			
			let form=new FormData(this);
			
			//now requesting to server	 
			
			$.ajax({
				url:"AddPostservlet",
				type:'POST',
				data:form,
				
				success:function (data,textStatus,jqXHR){
					//seccess
					console.log(data);
					if (data.trim() =='done')
                    {
                        swal("Good job!", "saved successfully", "success");
                    } else
                    {
                        swal("Error!!", "Something went wrong try again...", "error");
                    }
				},

				error: function(jqXHR,textStatus,errorThrown){
					
					//error...
					 swal("Error!!", "Something went wrong try again...", "error");
				},
				

				processData: false,
				contentType: false
				
				
			})
	
			
		})
			
			
			
		})
	
	
	</script>
	
	
        <!--loading post using ajax-->
        
      <script>

            function getPosts(catId, temp) {
                $("#loader").show();
                $("#post-container").hide()

                $(".c-link").removeClass('active')


                $.ajax({
                    url: "load_posts.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $('#post-container').html(data)
                        $(temp).addClass('active')

                    }
                })

            }

            $(document).ready(function (e) {

                let allPostRef = $('.c-link')[0]
                getPosts(0, allPostRef)


            })
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