
<%@page import="com.tech.blog.dao.User_Dao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.Like_Dao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.Post_Dao"%>
<!--this is loading post-->

<div class="row">

<%
    User uu = (User)session.getAttribute("currentUser");
    Thread.sleep(1000);
    Post_Dao dao = new Post_Dao(ConnectionProvider.getConnection());
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> posts = null;
    if (cid == 0) {
        posts = dao.getAllPosts();
    }
    else {
        posts = dao.getPostByCatId(cid);
    }
    
    if (posts.size() == 0) {
        out.println("<h3 class='display-3 text-center' >No Post in this Category</h3>");
        return;
    }
    
    for (Post post : posts) {
    
%>
<div class="col-md-6 mt-2">
    <div class="card">
        <img class="card-img-top" src="blog_pics/<%= post.getpPic() %>" alt="Card image cap">
        <div class="card-body">
            <b><%= post.getpTitle() %></b>
            <p><%= post.getpContent() %></p>
            <!--<pre><%= post.getpCode() %></pre>-->
        </div>
        <div class="card-footer bg-dark text-center" style="display: flex; justify-content: space-around">
            <%
                Like_Dao ld = new Like_Dao(ConnectionProvider.getConnection());
                
            %>
                            
            <a href="#" onclick="doLike(<%= post.getPid() %>, <%= uu.getId()%>)" class="btn btn-outline-light btn-sm">
                <i class="fa fa-thumbs-o-up"><span class="like-counter">  <%= ld.countLikeByPost(post.getPid()) %></span></i>
            </a>
                            
            <a href="show_blog_page.jsp?post_id=<%= post.getPid() %>" class="btn btn-outline-light btn-sm">
                Read More...
            </a>
            <a href="#" class="btn btn-outline-light btn-sm">
                <i class="fa fa-commenting-o"><span> 20</span></i>
            </a>
        </div>
    </div>
</div>
<%
    }
%>

</div>