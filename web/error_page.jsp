<%-- 
    Document   : error_page
    Created on : 22-Apr-2024, 2:40:59 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry!! Something Went Wrong</title>
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background {
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 93%, 70% 87%, 28% 99%, 0 87%, 0 0);
            }
        </style>
    </head>
    <body>
        <div class="container text-center">
            <img src="images/error.png" alt="error" class="img-fluid"/>
            <h3 class="display-3">Sorry!! Something Went Wrong</h3>
            <%= exception %><br>
            <a class="btn primary-background btn-lg text-white mt-3" href="index.jsp">Home</a>
        </div>
    </body>
</html>
