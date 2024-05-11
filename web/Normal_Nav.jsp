<%-- 
    Document   : Normal_Nav
    Created on : 17-Apr-2024, 4:02:34 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark primary-background" style="gap: 20px;">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-code"></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                <ul class="navbar-nav mr-auto" style="gap: 20px;">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-code-fork"></span> Code With Sandeep <span class="sr-only">(current)</span></a>
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
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
                <a class='btn btn-outline-light ml-5' href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
                <a class='btn btn-outline-light ml-2' href="register_page.jsp"><span class="fa fa-user-plus"></span> Sign Up</a>
            </div>
        </nav>
    </body>
</html>
