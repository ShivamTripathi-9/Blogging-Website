<%@page import="blog.dau.LikeDau"%>
<%@page import="java.text.DateFormat"%>
<%@page import="blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="blog.dau.UserDau"%>
<%@page import="blog.entities.Post"%>
<%@page import="blog.helper.ConnectionProvider"%>
<%@page import="blog.dau.PostDau"%>
<%@page import="blog.entities.User"%>

    
<%@page errorPage="error_page.jsp" %>

<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }


%>  



	<%  
	int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDau d = new PostDau(ConnectionProvider.getConnection());

    Post p = d.getPostByPostId(postId);
	%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= p.getpTitle()%> || Shivam Blog </title>

		<!-- CSS -->
		
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="CSS/mystyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


  <!-- Font Awesome CSS -->
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">



<style>
	.banner-background
	{
		clip-path: polygon(50% 0%, 100% 0, 100% 95%, 69% 98%, 38% 93%, 0 100%, 0 0);

	}
 
            .post-title
            {
                font-weight: 100;
                font-size: 30px;
                background-color: primary-background;
            }
            .post-content
            {
                font-weight: 100;
                font-size: 25px;

            }
            .post-date
            {
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info
            {
                font-size: 20px;

            }


            .row-user
            {
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }
            
            /*read more background image*/

		body {
  				background: url(image/p2.jpg);
   			 	background-size: cover;
   				background-attachment: fixed;
				}

        

</style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v20.0" nonce="4vZK9nJn"></script>

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
        <a class="nav-link" href="#"><span class="fa fa-home"></span>Home <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="	fa fa-user"></span>Contact</a>
      </li>
      
       
      <li class="nav-item">
        <a class="nav-link" href="" data-toggle="modal" data-target="#add-post-modal"><span class="	fa fa-asterisk"></span>Post</a>
      </li>
      
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-cart-arrow-down"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Progaramming</a>
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
						
						
						        <!--main content of body-->


        <div class="container">

            <div class="row my-4">

                <div class="col-md-8 offset-md-2">


                    <div class="card">

                        <div class="card-header primary-background text-white">

                            <h4 class="post-title"><%= p.getpTitle()%></h4>


                        </div>

                        <div class="card-body">

                            <img class="card-img-top my-3" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">


                            <div class="row my-3 row-user">
                                <div class="col-md-8">
                                
                                    <% UserDau ud = new UserDau(ConnectionProvider.getConnection());%>

                                    <p class="post-user-info"> <a href="#!"> <%= ud.getUserByUserId(p.getUserId()).getName() %> </a> has posted : </p>
                                </div>

                                <div class="col-md-4">
                                    <p class="post-date"> <%=  DateFormat.getDateTimeInstance().format(p.getpDate())%>  </p>
                                </div>
                            </div>


                            <p class="post-content"><%= p.getpContent()%></p> 

                            <br>
                            <br>

                            <div class="post-code">
                                <pre><%= p.getpCode()%></pre>
                            </div>

                        </div>
                        <div class="card-footer primary_background">
                         <%
                                LikeDau ld = new LikeDau(ConnectionProvider.getConnection());
                         %>

                            <a href="#!" onclick="doLike(<%= p.getpId() %>,<%= user.getId()%>)" class="btn btn-outline-light btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getpId())%></span>  </a>
                            <a href="#!" class="btn btn-outline-light btn-sm"> <i class="fa fa-commenting-o"></i> <span>200</span>  </a>



                        </div>
                        
                        <div class="card-footer">
                        <div class="fb-page" data-href="http://localhost:7007/Blog_Shivam_Project/show_blog_page.jsp?post_id=<%=p.getpId() %>" data-tabs="timeline" data-width="" data-height="" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true"></div>
                        
                        </div>



                    </div>


                </div>

            </div>

        </div>



      							  <!--end of main content  of body-->


       								 <!--profile modal-->



        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius:50%;max-width: 150px;;" >
                            <br>
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                            <!--//details-->

                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row"> ID :</th>
                                            <td> <%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row"> Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender :</th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status :</th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on :</th>
                                            <td><%= user.getDatetime().toString() %></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->

                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit Carefully</h3>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID :</td>
                                            <td><%= user.getId()%></td>
                                        </tr>
                                        <tr>
                                            <td>Email :</td>
                                            <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Name :</td>
                                            <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Password :</td>
                                            <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" > </td>
                                        </tr>
                                        <tr>
                                            <td>Gender :</td>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <td>About  :</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%>
                                                </textarea>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile:</td>
                                            <td>
                                                <input type="file" name="image" class="form-control" >
                                            </td>
                                        </tr>

                                    </table>

                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>

                                </form>    

                            </div>

                       <!--   </div>
                    </div>  -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button  id="edit-profile-button" type="button" class="btn btn-primary">EDIT</button>
                    </div>
                </div>
            </div>
        </div>


       								 <!--end of profile modal-->

      				  <!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="add-post-form" action="AddPostServlet" method="post">

                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category---</option>

                                    <%
                                        PostDau postd = new PostDau(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your content"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label>
                                <br>
                                <input type="file" name="pic"  >
                            </div>

                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post </button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>


        <!--END add post modal-->







        <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
  
    
    <script src="JavaScript/myjs.js"></script>
    

        <script>
                                $(document).ready(function () {
                                    let editStatus = false;

                                    $('#edit-profile-button').click(function ()
                                    {

                                        if (editStatus == false)
                                        {
                                            $("#profile-details").hide()

                                            $("#profile-edit").show();
                                            editStatus = true;
                                            $(this).text("Back")
                                        } else
                                        {
                                            $("#profile-details").show()

                                            $("#profile-edit").hide();
                                            editStatus = false;
                                            $(this).text("Edit")

                                        }


                                    })
                                });

        </script>
        <!--now add post js-->
        <script>
            $(document).ready(function (e) {
                //
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted....
                    event.preventDefault();
                    console.log("you have clicked on submit..")
                    let form = new FormData(this);

                    //now requesting to server
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success ..
                            console.log(data);
                            if (data.trim() == 'done')
                            {
                                swal("Good job!", "saved successfully", "success");
                            } else
                            {
                                swal("Error!!", "Something went wrong try again...", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error..
                            swal("Error!!", "Something went wrong try again...", "error");
                        },
                        processData: false,
                        contentType: false
                    })
                })
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
    � 2024 Copyright: Shivam Tripathi  9628209929 </br>
    <a class="text-body" href="mailto:shivamtripathi93758@gmail.com /">shivamtripathi93758@gmail.com</a>
  </div>
  <!-- Copyright -->
</footer>


<!-- End of footer -->
</body>
</html>