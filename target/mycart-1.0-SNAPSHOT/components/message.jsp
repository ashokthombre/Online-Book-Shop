
<%

String message= (String) session.getAttribute("message");
String warning= (String) session.getAttribute("warning");

if(message!=null)
{

%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
  <strong><%=message%></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%

 session.removeAttribute("message");
}
if(warning!=null)
{

%>
<div class="alert alert-warning alert-dismissible fade show" role="alert">
  <strong><%=warning%></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%

 session.removeAttribute("message");
}

%>
