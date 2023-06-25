
<%@page import="com.learn.mycart.entities.User"%>
<% 

   User user2=(User)session.getAttribute("currentUser");
    if(user2==null)
    {
    
    session.setAttribute("message","You are not logged in");
    response.sendRedirect("login.jsp");
    return;
    
     }
     else
     {
     
     if(user2.getUserType().equals("admin"))
     {
     
     session.setAttribute("message","You are not Normal user");
     response.sendRedirect("login.jsp");
     return;
}
     
     
     
}





%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
            <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <h1>Normal </h1>
    </body>
</html>
