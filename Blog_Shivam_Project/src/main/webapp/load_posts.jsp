
<%@page import="blog.entities.User"%>
<%@page import="blog.dau.LikeDau"%>
<%@page import="blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="blog.dau.PostDau"%>

<div class="row">

<%

User uuu=(User)session.getAttribute("currentUser");


Thread.sleep(1000);
PostDau d=new PostDau(ConnectionProvider.getConnection());
int cid = Integer.parseInt(request.getParameter("cid"));
List<Post> posts = null;
if (cid == 0) {
    posts = d.getAllPosts();
} else {
    posts = d.getPostByCatId(cid);
}

if (posts.size() == 0) {
    out.println("<h3 class='display-3 text-center'>No Posts in this category..</h3>");
    return;
}

for(Post p:posts){
	
%>

<div class="col-md-6 mt-3">
	<div class="card">
	 <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
		<div class="card-body">
			<b><%=p.getpTitle() %></b>
			<p><%=p.getpContent() %></p>
			<pre> <%= p.getpCode() %></pre>
		
		</div>
	
	
		<div class="card-footer  text-center">
		
		                         <%
                              	  LikeDau ld = new LikeDau(ConnectionProvider.getConnection());
                         		%>
		
		
			<a href="show_blog_page.jsp?post_id=<%= p.getpId() %>"class="btn btn-outline-primary btn-sm">Read More...</a>
			<a href="#!" onclick="PostLike(<%= p.getpId() %>,<%= uuu.getId()%>)" class="btn btn-outline-primary btn-sm"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getpId())%></span>    </a>
			<a href="#!"class="btn btn-outline-primary btn-sm"><i class="fa fa-commenting-o"></i> <span>20</span></a>
			
		</div>
		
		
		
		
		
		
		
		
	
	
	
	
	
	</div>
	</div>


<%

}


%>

</div>