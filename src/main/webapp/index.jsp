<%-- 
    Document   : home.jsp
    Created on : Mar 23, 2023, 6:00:49 PM
    Author     : Marketyard330S
--%>

<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BookShop</title>
        <%@include file="components/common_css_js.jsp" %> 

    </head>
    <body>

        <%@include file="components/navbar.jsp" %> 

        <div class="row mt-3 mx-2">


            <%                String cat = request.getParameter("category");

                ProductDao pDao = new ProductDao(FactoryProvider.getFactory());
                List<Product> plist = null;

                if (cat == null || cat.trim().equals("all")) {

                    plist = pDao.getAllProducts();

                } else {

                    int cid = Integer.parseInt(cat.trim());

                    plist = pDao.getAllProductById(cid);

                }

                CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());

                List<Category> clist = cDao.getCategory();


            %>




            <!--show category-->
            <div class="col-md-2">

                <div class="list-group">
                    <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                        All Categories 
                    </a>


                    <%                        for (Category c : clist) {
                    %>

                    <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                    <%
                        }
                    %>
                </div>


            </div>

            <!--show products-->
            <div class="col-md-10">

                <!--row-->
                <div class="row mt-4">
                    <!--col:12-->
                    <div class="col-md-12">

                        <div class="card-columns">

                            <!--travrersing products-->
                            <%
                                for (Product p : plist) {
                            %>

                            <div class="card product-card">
                                <div class="container text-center">
                                    <img class="card-img-top m-2" style="max-height: 270px;max-width: 100%;width: auto;" src="img/product/<%=p.getpPhoto()%>" alt="Card image cap">
                                </div>


                                <div class="card-body">
                                    <h5 class="card-title"><%=p.getpName()%></h5>  
                                    <p class="card-text">
                                        <%=Helper.get10Words(p.getpDesc())%>
                                    </p>

                                </div>
                                <div class="card-footer">

                                    <%
                                        

                                        if (p.getpDiscount() != 0) {
                                            int a = p.getpPrice();
                                            int b = p.getpDiscount();
                                            int discount = (a * b) / 100;
                                           int  actual_price = a - discount;
                                    %>
                                    <button  onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=actual_price%>)" class="btn custom-bg text-white">Add to Cart</button>
                                    <button class="btn btn-outline-primary">&#8377;<%=actual_price%>/- <span class="text-secondary discount-label">&#8377;<%=p.getpPrice()%> <%=p.getpDiscount()%>%off</span></button>
                       
                                    <%

                                        } else {
                                     %>
                                     
                                      <button onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=p.getpPrice()%>)" class="btn custom-bg text-white">Add to Cart</button>
                                    <button class="btn btn-outline-primary">&#8377;<%=p.getpPrice()%>/- <span class="text-secondary discount-label">&#8377;<%=p.getpPrice()%> <%=p.getpDiscount()%>%off</span></button>
                                  
                                     
                                     
                                     
                                     <%
                                              
                                        }

                                    %>

                                </div>

                            </div>



                            <%                                }

                            %>


                        </div>

                        <%                                   if (plist.size() == 0) {
                        %>
                        <h1>No Product Available in this Category.</h1>
                        <%
                            }
                        %>


                    </div>

                </div>



            </div>



        </div>


                        <%@include file="components/common_modals.jsp"%>

    </body>
</html>
