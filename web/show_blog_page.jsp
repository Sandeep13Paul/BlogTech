<%-- 
    Document   : show_blog_page
    Created on : 07-May-2024, 3:03:09 pm
    Author     : hp
--%>

<%@page import="com.tech.blog.dao.Like_Dao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.User_Dao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.Post_Dao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    
    Post p = new Post_Dao(ConnectionProvider.getConnection()).getPostByPostId(postId);
%>


<% 
    User user = (User)session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle() %> || TechBlog Post</title>
        
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 70% 87%, 28% 99%, 0 87%, 0 0);
            }
            
            body {
                background: url(images/p3);
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
        
  </head>
    <body>
        <!--nav bar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background" style="gap: 20px;">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-code"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                <ul class="navbar-nav mr-auto" style="gap: 20px;">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"><span class="fa fa-code-fork"></span> Code With Sandeep <span class="sr-only">(current)</span></a>
                    </li>
                
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="fa fa-server"></span> Categories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="#">Programming Language</a>
                        <a class="dropdown-item" href="#">Project Implementation</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Data Structure</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-vcard"></span> Contact</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal" ><span class="fa fa-upload"></span> Post</a>
                </li>
                </ul>
                
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class='nav-link' data-toggle="modal" data-target="#profile-modal" style="cursor: pointer;"><span class="fa fa-user-circle"></span> <%= user.getName() %></a>
                    </li>
                    <li class="nav-item">
                        <a class='btn btn-outline-light ml-2' href="Logout"><span class="fa fa-user"></span> Logout</a>
                    </li>
                </ul>
                
                
                
                
            </div>
        </nav>
        <!--end of nav bar-->
        
        <!--body-->
        <div class="container">
            <div class="row mt-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header bg-dark text-center text-white">
                            <h3 style="font-weight: 300; font-size: 35px;"><%= p.getpTitle() %></h3>
                        </div>
                        <div class="card-body">
                            <br />
                            <img class="card-img-top" src="blog_pics/<%= p.getpPic() %>" alt="Card image cap">
                            <br />
                            <div class="row my-3" style="border: 1px solid #e2e2e2; padding-top: 10px;">
                                <div class="col-md-8">
                                    <%
                                        User_Dao d = new User_Dao(ConnectionProvider.getConnection());
                                    %>
                                    <p><a href="#" style="font-size: 20px;"><%= d.getUserByUserId(p.getUid()).getName() %></a> has posted this on : </p>
                                </div>
                                <div class="col-md-4">
                                    <p style="font-style: italic; font-weight: bold;"><%= DateFormat.getDateInstance().format(p.getpDate()) %></p>
                                </div>
                            </div>
                            <br />
                            <p style="font-weight: 100;font-size: 30px;"><%= p.getpContent() %></p><!-- comment -->
                            <br />
                            <br />
                            <pre style="font-weight: 100;font-size: 25px;"><%= p.getpCode() %></pre>
                        </div>
                        <div class="card-footer bg-dark text-white" style="display: flex; justify-content: space-around">
                            <%
                                Like_Dao ld = new Like_Dao(ConnectionProvider.getConnection());
                            %>
                            
                            <a href="#" onclick="doLike(<%= p.getPid() %>, <%= user.getId()%>)" class="btn btn-outline-light btn-sm">
                                <i class="fa fa-thumbs-o-up"><span class="like-counter">  <%= ld.countLikeByPost(p.getPid()) %></span></i>
                            </a>
                            <a href="#" class="btn btn-outline-light btn-sm">
                                <i class="fa fa-commenting-o"><span> 20</span></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/body-->
        
        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content" style="background-color: #8561c6;">
              <div class="modal-header primary-background text-white">
                <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <!--...-->
                <div class="container text-center">
                    <img src="pics/<%= user.getProfile() %>" class="img-fluid" style="border-radius: 50%;height: 100px; width: 100px;" />
                    <h5 class="modal-title" id="exampleModalLabel"> <%= user.getName() %> </h5><br />
                    <div id="profile-details">
                        <table class="table">
                            <tbody class="text-white">
                              <tr>
                                <th scope="row">ID : </th>
                                <td><%= user.getId() %></td>
                              </tr>
                              <tr>
                                <th scope="row">Email : </th>
                                <td><%= user.getEmail() %></td>
                              </tr>
                              <tr>
                                <th scope="row">About : </th>
                                <td><%= user.getAbout() %></td>
                              </tr>
                              <tr>
                                <th scope="row">Registered on : </th>
                                <td><%= user.getDateTime().toString()%></td>
                              </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--profile-edit-->
                    <div id="profile-edit" style="display: none;">
                        <form action="Edit" method="POST" enctype="multipart/form-data">
                            <table class="table">
                                <tr>
                                    <th scope="row">ID : </th>
                                    <td><%= user.getId() %></td>
                                </tr>
                                <tr>
                                    <th scope="row">Email : </th>
                                    <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">Name : </th>
                                    <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">Password : </th>
                                    <td><input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">About : </th>
                                    <td><textarea class="form-control" name="user_about" rows="1"><%= user.getAbout()%></textarea></td>
                                </tr>
                                <tr>
                                    <th scope="row">New Profile : </th>
                                    <td><input type="file" class="form-control" name="image" /></td>
                                </tr>
                                <tr>
                                    <th scope="row">Registered Date : </th>
                                    <td><%= user.getDateTime().toString()%></td>
                                </tr>
                            </table>
                                <div class="container">
                                    <button type="submit" class="btn btn-outline-light">Save</button>
                                </div>
                        </form>
                    </div>
                </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
              </div>
            </div>
          </div>
        </div>
        <!--/modal-->
        
        <!--post modal-->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content" style="background-color: #8561c6;">
              <div class="modal-header primary-background text-white">
                <h5 class="modal-title" id="exampleModalLabel"> Provide the Details to be Uploaded.... </h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <!--...-->
                <div class="container text-center">
                    <!--post-details-form-->
                    <form id="add-post-form" action="AddPost" method="POST" enctype="multipart/form-data">
                        <div class="form-group">
                            <select class="form-control" name="cid">
                                <option selected disabled >---Select Category---</option>
                                <%
                                    Post_Dao pd = new Post_Dao(ConnectionProvider.getConnection());
                                    ArrayList<Category> list = pd.getCategories();
                                    for (Category c : list) {
                                %>
                                <option value="<%= c.getCid() %>"><%= c.getName() %></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <table class="table">
                            <tr>
                                <th scope="row">Enter Post Title : </th>
                                <td><input type="text" class="form-control" name="post_title" /></td>
                            </tr>
                            <tr>
                                <th scope="row">Enter Your Content : </th>
                                <td><textarea class="form-control" name="post_content" rows="4"></textarea></td>
                            </tr>
                            <tr>
                                <th scope="row">Enter Your Program(if any) : </th>
                                <td><textarea class="form-control" name="post_program" rows="4"></textarea></td>
                            </tr>
                            <tr>
                                <th scope="row">Add Post Pic.. : </th>
                                <td><input type="file" class="form-control" name="post_image" /></td>
                            </tr>
                        </table>
                        <div class="container text-center">
                            <button type="submit" class="btn btn-outline-light">Submit</button>
                        </div>
                    </form>
                </div>
              </div>
              <div class="modal-footer">
                <!--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>-->
                <!--<button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>-->
              </div>
            </div>
          </div>
        </div>
        <!--/post modal-->
        
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    
        <script src="js/myjs.js"></script>
        
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                let editStatus = false;
                var editProfileButton = document.getElementById("edit-profile-button");
                var profileDetails = document.getElementById("profile-details");
                var profileEdit = document.getElementById("profile-edit");

                editProfileButton.addEventListener("click", function (event) {
                    if (!editStatus) {
                        profileDetails.style.display = "none";
                        profileEdit.style.display = "block";
                        editStatus = true;
                        this.textContent = "Back";
                    } else {
                        profileDetails.style.display = "block";
                        profileEdit.style.display = "none";
                        editStatus = false;
                        this.textContent = "Edit";
                    }
                });
            });

        </script>
        <!--now add post js-->
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var addPostForm = document.getElementById("add-post-form");

                addPostForm.addEventListener("submit", function (event) {
                    event.preventDefault();
                    console.log("clicked on submit");

                    var form = new FormData(this);

                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "AddPost", true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4) {
                            if (xhr.status === 200) {
                                if (xhr.responseText.trim() === "done") {
                                    swal("Good job!", "Post Saved Successfully!!", "success");
                                }
                                else {
                                    swal("Error!!", "Something Went Wrong!! Problem Must be in Servlet or Syntax", "error");
                                }
                            } else {
                                console.log(xhr.statusText);
                                swal("Error!!", "Something Went Wrong!! Try Again After Some Time", "error");
                            }
                        }
                    };
                    xhr.onerror = function (error) {
                        console.log(error);
                    };
                    xhr.send(form);
                });
            });
//            $(document).ready(function() {
//                $("#add-post-form").on("submit", function(event) {
//                    event.preventDefault();
//                    console.log("clicked on submit");
//                    let form = new FormData(this);
//                    //requesting to server
//                    $.ajax({
//                        url: "AddPost",
//                        type: 'POST',
//                        data: form,
//                        success: function (data, textStatus, jqXHR) {
//                            //success..
//                            console.log(data);
//                            if (data == "done")
//                            swal("Good job!", "Post Saved Successfully!!", "success");
//                        },
//                        error: function (jqXHR, textStatus, errorThrown) {
//                            //error
//                            console.log(errorThrown);
//                            swal("Error!!", "Something Went Wrong!! Try Again After Some Time", "error");
//                        },
//                        processData: false,
//                        contentType: false
//                    });
//                });
//            });


        </script>
    </body>
</html>
