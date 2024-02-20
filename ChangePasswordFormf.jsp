
<%@page import="java.sql.ResultSet"%>
<%@page import="project.NewClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password </title>
           <link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
<script type="text/javascript" src="layout/scripts/jquery.min.js"></script>
<!-- liteAccordion is Homepage Only -->
<link rel="stylesheet" href="layout/scripts/liteaccordion-v2.2/css/liteaccordion.css" type="text/css" />

    </head>
<body id="top">
    <jsp:include page="Wrapper1.jsp"></jsp:include>
<!-- ####################################################################################################### -->
    <jsp:include page="Wrapper2.jsp"></jsp:include>
<!-- ####################################################################################################### -->
    <jsp:include page="Wrapper3.jsp"></jsp:include>
<!-- ####################################################################################################### -->
<div class="wrapper row4">
  <div id="container" class="clear"> 
    <!-- ####################################################################################################### -->
    <div id="homepage" class="clear">
    <jsp:include page="Wrapper4.jsp"></jsp:include>
      <!-- ############### -->
      <div class="fl_right">
        <h2 class="title">Change Password</h2>

<%
    String ans="";
if(request.getParameter("submit")!=null)
{
    int flag=0;
    NewClass obj = new NewClass();
     
    String UserName =  request.getParameter("UserName");
    String oldPassWord =  request.getParameter("oldPassWord");
    String newPassWord =  request.getParameter("newPassWord");
 
    int x = obj.Insert("update facultymst set Password='"+newPassWord+"', Status='Confirm' where UserName='"+UserName+"' and Password='"+oldPassWord+"'");
    if(x!=0)
    {
        flag=1;
        ans="Updated Successfully";
    }

     
    if(flag==0)
        
        
    {
        ans="Invalid Info";
    }
}
        
        
   
    



    %>
        <form method="post" action="">
            <table>
                <tr><td colspan="3" Align="Center">Change Password</td></tr>
        
                <tr><td>UserName</td><td><input type="text" name="UserName"  ></td><td></td></tr>
                <tr><td>Old PassWord</td><td><input type="password" name="oldPassWord"></td><td></td></tr>
                <tr><td>New PassWord</td><td><input type="password" name="newPassWord"></td><td></td></tr>
                <tr><td>Confirm PassWord</td><td><input type="password" name="CPW"></td><td></td></tr>
                
                <tr><td colspan="3" Align="Center"><input type="submit" name="submit" value="submit"></td></tr>
                <tr><td colspan="3" Align="Center"><Label style="color:red"><%=ans%></Label></td></tr>
                 
                
            </table>
        </form>
                      </div>
    </div>
    <!-- ####################################################################################################### --> 
  </div>
</div>
<!-- ####################################################################################################### -->
    <jsp:include page="Wrapper5.jsp"></jsp:include>         

    </body>
</html>
