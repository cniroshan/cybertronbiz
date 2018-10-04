<%-- 
    Document   : home
    Created on : Oct 4, 2018, 5:15:10 AM
    Author     : chandima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <style type="text/css">
            .login-form {
                width: 340px;
                margin: 50px auto;
            }
            .login-form form {
                margin-bottom: 15px;
                background: #f7f7f7;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
            }
            .login-form h2 {
                margin: 0 0 15px;
            }
            .form-control, .btn {
                min-height: 38px;
                border-radius: 2px;
            }
            .btn {        
                font-size: 15px;
                font-weight: bold;
            }
        </style>

    </head>
    <body>
        <h1>Hello World!</h1>
        You are logged in as <%=session.getAttribute("username")%><br/>
        <br/>

        <div class="login-form">
            <form action="Validate" method="POST">
                <h2 class="text-center">Enter Your Details</h2>       
                <div class="form-group">
                    <input type="text" name="id" placeholder="Register ID" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" name="key" placeholder="Password" class="form-control">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary btn-block"/>
                </div>
                <div class="clearfix">
                    <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
                    <a href="#" class="pull-right">Forgot Password?</a>
                </div>      
                <input type="hidden" name="tokentxt" id="tokentxt" value="<%=session.getAttribute("csrfToken")%>"/><br/>
            </form>
            <p class="text-center"><a href="#">Create an Account</a></p>
        </div>


        <script src="jquery.min.js"></script>
        <script src="bootstrap.min.js"></script>
    </body>
</html>
