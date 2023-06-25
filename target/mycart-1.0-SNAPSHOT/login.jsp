<%-- 
    Document   : login
    Created on : Mar 24, 2023, 12:05:27 PM
    Author     : Marketyard330S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Login</title>
        <%@include file="components/common_css_js.jsp" %> 
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container  ">
            <div class="row ">
                <div class="col-md-6 offest-md-3">
                    <div class="card mt-3">
                        <div class="card-header custom-bg text-white text-center">
                            <h3>Login here.</h3> 

                        </div>
                        <div class="card-body ">
                            <%@include file="components/message.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <div class="text-center">
                                    <button type="submit" class="btn custom-bg text-white">Submit</button>
                                </div>
                              
                            </form> 

                        </div>
                        <div class="card-footer">
                            <h5 class="text-center">Don't have account!<a  href="register.jsp">Register.</a></h5>
                        </div>

                    </div> 


                </div>
            </div>


        </div>



    </body>
</html>
