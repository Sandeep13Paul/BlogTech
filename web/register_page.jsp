<%-- 
    Document   : register_page
    Created on : 17-Apr-2024, 11:03:32 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        
        <!--css-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <style>
            .banner-background {
                /*clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 99%, 62% 95%, 25% 98%, 0 94%, 0 0);*/
            }
        </style>
    </head>
    <body class="banner-background" style=" background-color: #673ab7;">
        
        <!--navbar-->
        <%@include file="Normal_Nav.jsp" %>
        
        <main class="d-flex align-items-center banner-background" style="height: 91.5vh;">
            
            <div class="container mt-4">
                
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                            <div class="card-header primary-background text-white text-center">
                                <span class="fa fa-user-circle fa-2x"></span>
                                <br />
                                Register Here...
                            </div>
                            <div class="card-body text-white" style="background-color: #8561c5;">
                                <form id="reg_form" action="Register" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="usernameInputEmail1">User Name</label>
                                        <input name="username" type="text" class="form-control" id="usernameInputEmail1" aria-describedby="userHelp" placeholder="Enter name">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <label for="about">About</label>
                                        <textarea name="about" class="form-control" id="about" rows="1" placeholder="Enter somthing about yourself"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label for="profile">Profile</label>
                                        <textarea name="profile" class="form-control" rows="1" id="profile" placeholder="Enter somthing about your profile"></textarea>
                                    </div>
                                    <div class="form-check">
                                        <input  name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Agree to Terms and Conditions</label>
                                    </div>
                                    <div class="container text-center" style="display: none;">
                                        <span class="fa fa-refresh fa-spin fa-2x" id="loader"></span>
                                        <h4>Please Wait...</h4>
                                    </div>
                                    <button id="submit-btn" type="submit" class="btn btn-dark mt-2">Submit</button>
                                </form>
                            </div>
                            <div class="footer"></div>
                        </div>
                </div>
                
            </div>
            
        </main>
        
        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        <script src="js/myjs.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                console.log("Loaded....");

                var regForm = document.getElementById("reg_form");
                var submitBtn = document.getElementById("submit-btn");
                var loader = document.getElementById("loader");

                regForm.addEventListener("submit", function (event) {
                    event.preventDefault();

                    var form = new FormData(this);

                    submitBtn.style.display = "none";
                    loader.style.display = "block";

                    var xhr = new XMLHttpRequest();
                    xhr.open("POST", "Register", true);
                    xhr.onreadystatechange = function () {
                        if (xhr.readyState === 4) {
                            if (xhr.status === 200) {
                                var data = xhr.responseText.trim();
                                console.log(data);
                                submitBtn.style.display = "block";
                                loader.style.display = "none";

                                if (data === "done") {
                                    swal("Registration Successfull.. we are redirecting you to login page").then((value) => {
                                        window.location = 'login_page.jsp';
                                    });
                                } else {
                                    swal(data);
                                }
                            } else {
                                submitBtn.style.display = "block";
                                loader.style.display = "none";
                                swal("Something Went Wrong.. Please try again after sometime");
                            }
                        }
                    };
                    xhr.onerror = function (error) {
                        submitBtn.style.display = "block";
                        loader.style.display = "none";
                        swal("Something Went Wrong.. Please try again after sometime");
                    };
                    xhr.send(form);
                });
            });


        </script>
    </body>
</html>
