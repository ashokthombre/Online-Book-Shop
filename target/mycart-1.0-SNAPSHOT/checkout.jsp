<%-- 
    Document   : checkout
    Created on : Mar 27, 2023, 11:15:17 AM
    Author     : Marketyard330S
--%>

<%

  User user=(User)session.getAttribute("currentUser");
 if(user==null)
 {
   session.setAttribute("message", "You are not logged in ");
   response.sendRedirect("login.jsp");
   return;
  }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %> 

        <div class="container">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Selected Items.</h3>
                            <div class="cart-body">

                            </div>
                        </div>

                    </div>

                </div>



                <div class="col-md-6">

                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your Order Details.</h3>

                            <form action="#!"> 

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%=user.getUserEmail()%>" name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>
                                    
                                     <div class="form-group">
                                    <label for="exampleInputEmail1">Phone Number</label>
                                    <input value="<%=user.getUserPhone()%>" name="phone" type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Phone">

                                </div>
                                    
                                <div class="form-group">
                                    <label for="name">Your Name</label>
                                    <input value="<%=user.getUserName() %>" name="name" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Name">

                                </div>

                                <div class="form-group">
                                    <label for="Addresss">Enter Your Address</label>
                                    <textarea value="<%=user.getUserAddress()%>" type="text" name="address" style="height: 100px" class="form-control" placeholder="Enter your Address...." ></textarea>

                                </div>
                                
                                <div class="container text-center">
                                    <button class="btn custom-bg text-white" >Order Now</button>
                                    <button class="btn custom-bg text-white" >Continue Shopping</button>
                                </div>

                            </form>


                        </div>

                    </div>    



                </div>

            </div>

        </div>


        <%@include file="components/common_modals.jsp"%>
    </body>
</html>
