<%-- 
    Document   : homePage
    Created on : Sep 18, 2018, 7:14:14 PM
    Author     : chandima
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="bootstrap.min.css">
        <title>JSP Page</title>

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
        <div class="login-form">
            <form action="Validator" method="POST">
                <h2 class="text-center">Enter Your Details</h2>       
                <div class="form-group">
                    <input type="text" name="id" placeholder="ID" class="form-control">
                </div>
                <div class="form-group">
                    <input type="password" name="key" placeholder="password" class="form-control">
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary btn-block"/>
                </div>
                <div class="clearfix">
                    <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
                    <a href="#" class="pull-right">Forgot Password?</a>
                </div>      
                <input type="hidden" name="tokentext" id="tokentext"/>
            </form>
            <p class="text-center"><a href="#">Create an Account</a></p>
        </div>

        <script src="jquery.min.js"></script>
        <script src="bootstrap.min.js"></script>
        <script>
            $.ajax({
                type: 'GET',
                dataType: 'json',
                url: '/SynchronizerTokenPattern/Validator',
                async: false,
                contentType: "application/json",
                success: function (data) {
                    var response = JSON.stringify(data);
                    console.log("kkkkkkkkkkkkkkkkkkkkkkkk: " + data.csrfToken);
                    //var response = jQuery.parseJSON(data);
                    console.log("hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh  " + response[0].csrfToken);
                    alert("Your Token data : " + response);
                    $("#tokentext").val(data.csrfToken);
                },
                error: function (xhr, status, error) {
                    alert(status);
                }
            });
        </script>
    </body>
</html>
