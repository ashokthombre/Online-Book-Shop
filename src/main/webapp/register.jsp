<%-- 
    Document   : register.jsp
    Created on : Mar 23, 2023, 10:38:44 PM
    Author     : Marketyard330S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp" %> 
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
       
        <div class="container-fluid">
             <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                     <%@include file="components/message.jsp" %>
                    
                    <div class="card-body px-5">
                        <div class="text-center">
                            <image  src="img/copywriter.png"/>
                            
                        </div>
                <form action="RegisterServlet" method="post"> 

                    <div class="form-group">
                        <label for="name">User Name</label>
                        <input  required name="name" type="text" class="form-control" id="name" placeholder="Enter Your Name" aria-describedby="emailHelp" >

                    </div>
                    
                    <div class="form-group">
                        <label for="email">User Email</label>
                        <input name="email" required type="email" class="form-control" id="email" placeholder="Enter you Email" aria-describedby="emailHelp" >

                    </div>
                    
                       <div class="form-group">
                        <label for="password">User Password</label>
                        <input name="password" type="password" class="form-control" id="password" placeholder="Enter you Password" aria-describedby="emailHelp" >

                        </div>
                      
                       <div class="form-group">
                        <label for="phone">Enter Your Mobile Number</label>
                        <input name="phone" required type="Number" class="form-control" id="phone" placeholder="Enter you Mobile no" aria-describedby="emailHelp" >

                      </div>
                    
                       <div class="form-group">
                        <label for="Addresss">Enter Your Address</label>
                        <textarea name="address" style="height: 100px" class="form-control" placeholder="Enter your Address...." ></textarea>

                        </div>
                    
                    <div class="container text-center ">
                        <button class="btn btn-outline-success "> Register</bitton>
                        <button class="btn btn-outline-warning ml-4"> Reset</bitton>
                    </div>


                </form>

                        
                        
                    </div>
                    
                    
                    
                </div>
            </div>
           </div>

        

            
        </div>
    </body>
</html>
