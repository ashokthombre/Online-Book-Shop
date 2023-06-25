
<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {

        session.setAttribute("message", "You are not logged in");
        response.sendRedirect("login.jsp");
        return;

    } else {

        if (user.getUserType().equals("normal")) {

            session.setAttribute("message", "You are not admin");
            response.sendRedirect("login.jsp");
            return;
        }
    }
%>
 <%
                            
                          CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
                           List<Category>list= cDao.getCategory();
                  
                   Map<String,Long>map= Helper.getCount(FactoryProvider.getFactory());

                            
               %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>

        <%@include file="components/navbar.jsp" %>

        <div class="container admin">

            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>


            </div>
            <!--first row-->
            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-4">

                    <!--first box-->
                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-height: 125px" class="img-fluid rounded-circle" src="img/users.png" alt="users_icon"/>

                            </div>


                            <h1><%=map.get("userCount") %></h1>

                            <h1>User</h1>


                        </div>


                    </div>

                </div>
                <!--second col-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-height: 125px" class="img-fluid rounded-circle" src="img/list.png" alt="users_icon"/>

                            </div>
                            <h1><%=list.size() %></h1>

                            <h1>Categories</h1>


                        </div>


                    </div>

                </div>
                <!--Third col-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-height: 125px" class="img-fluid rounded-circle" src="img/product.png" alt="users_icon"/>

                            </div>
                            <h1><%=map.get("productCount")%></h1>
                            <h1>Products</h1>


                        </div>


                    </div>

                </div>

            </div>

            <!--second row-->

            <div class="row mt-3">
                <!--first col-->
                <div class="col-md-6">

                    <!--first box-->
                    <div class="card"  data-toggle="modal" data-target="#add-category-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-height: 125px" class="img-fluid rounded-circle" src="img/Key.png" alt="users_icon"/>

                            </div>


                            <p>Click here to add category</p>

                            <h1>Add Category</h1>


                        </div>


                    </div>

                </div>
                <!--second col-->

                <div class="col-md-6">

                    <!--first box-->
                    <div class="card"  data-toggle="modal" data-target="#add-product-modal">

                        <div class="card-body text-center">

                            <div class="container">
                                <img style="max-height: 125px" class="img-fluid rounded-circle" src="img/plus.png" alt="users_icon"/>

                            </div>


                            <p>Click here to add products</p>

                            <h1> Add Products</h1>


                        </div>


                    </div>

                </div>


            </div>


        </div>

        <!--model start-->



        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title text-center" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addcategory"/>
                            <div class="form-group">
                                <label for="catTitle">Category Title</label>
                                <input  required name="catTitle" type="text" class="form-control" id="title" placeholder="Enter Category Title" aria-describedby="emailHelp" >

                            </div>

                            <div class="form-group">
                                <label for="description">Enter Description</label>
                                <textarea name="catDesc" style="height: 100px" class="form-control" placeholder="Enter your Description.." ></textarea>

                            </div>

                            <div class=" text-center">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button  type="submit" class="btn custom-bg text-white">Add Category</button>
                            </div>


                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of category model-->


        <!--Product model-->



        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title text-center" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                              <input type="hidden" name="operation" value="addproduct"/>
                            <div class="form-group">
                                <label for="pName">Product Name</label>
                                <input   name="pName" type="text" class="form-control" id="pName" placeholder="Enter Product Name" aria-describedby="emailHelp" >

                            </div>

                           
                            <div class="form-group">
                                <label for="pDesc">Enter Description</label>
                                <textarea name="pDesc" style="height: 100px" class="form-control" placeholder="Enter Product Description.." ></textarea>

                            </div>

                            <div class="form-group">
                                <label for="pPrice">Product Price</label>
                                <input  name="pPrice" type="number" class="form-control" id="price" placeholder="Enter Product Price" aria-describedby="emailHelp" >

                            </div>
                               <div class="form-group">
                                <label for="pDiscount">Discount</label>
                                <input  name="pDiscount" type="number" class="form-control" id="discoount" placeholder="Enter Discount" aria-describedby="emailHelp" >

                            </div>
      
                            <div class="form-group">
                                <label for="pQuantity">Quantity</label>
                                <input   name="pQuantity" type="number" class="form-control" id="quantity" placeholder="Enter Quantity" aria-describedby="emailHelp" >

                            </div>
                            
                            
                            
                           

                            <div class="form-group">
                            

                                <select class="form-control" name="catId" id="">
                                    
                                    <%
                                    for(Category c:list)
                                    {
                                    
                                    %>
                                    <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                                    <%
                                        
                                        
                                    }
                                    %>
                                    
                                </select>

                            </div>

                                
                            <div class="form-group ">

                                <label for="pPic">Select Picture of product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" />
                               
                            </div>



                            <div class=  "container text-center mt-2">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn custom-bg text-white">Add Product</button>
                            </div>


                        </form>
                    </div>

                </div>
            </div>
        </div>




        <!--end of product model-->


  <%@include file="components/common_modals.jsp"%>
    </body>
</html>
