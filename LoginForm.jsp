

<%@page import="java.sql.ResultSet"%>
<%@page import="project.NewClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Form</title>
        <meta Http-Equiv="Cache-Control" Content="no-cache">
<meta Http-Equiv="Pragma" Content="no-cache">
<meta Http-Equiv="Expires" Content="0"> 
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
        <h2 class="title">Login Form</h2>

<%
    String ans="";
if(request.getParameter("submit")!=null)
{
    int flag=0;
    NewClass obj = new NewClass();
    String UserName =  request.getParameter("UserName");
    String PassWord =  request.getParameter("PassWord");
    
    if(flag==0)
    {
        if(UserName.equals("Admin"))
        {
            if(PassWord.equals("Admin"))
            {
                flag=1;
                ans="Admin Login Successfull";
                session.setAttribute("Admin",UserName ); 
                response.sendRedirect("Admin/Home.jsp");
                
            }
        }      
    }
  if(flag==0)
    {
        
        ResultSet rs  = obj.SelectAll("select * from StudentMst where status is not null");
        while(rs.next())
        {
         if(rs.getString("UserName").equals(UserName))
            {
            if(rs.getString("Password").equals(PassWord))
            {
                if(rs.getString("Status").equals("Confirm"))
                {
        
                    flag=1;
                    ans="Student Login Successfull";
                    session.setAttribute("Student",UserName ); 
                    response.sendRedirect("Student/StudentProfile.jsp");
        
                }
              }
           }
        }
    }
  
     if(flag==0)
    {
        
        ResultSet rs1  = obj.SelectAll("select * from FacultyMst where status is not null");
        while(rs1.next())
        {
        if(rs1.getString("UserName").equals(UserName))
            {
            if(rs1.getString("PassWord").equals(PassWord))
            {
                if(rs1.getString("Status").equals("Confirm"))
                {
        
                    flag=1;
                    ans="Faculty Login Successfull";
                    session.setAttribute("Faculty",UserName ); 
                     response.sendRedirect("Faculty/FacultyProfile.jsp");
        
                }
              }
           }
        }
    }
    
    
    

    if(flag==0)
    {
    ans="Invalid Info";
    }
    
}



    %>
        <form method="post" action="">
            <table>
                <tr><td colspan="3" Align="Center">Login Form</td></tr>
                <tr><td>UserName</td><td><input type="text" name="UserName"></td><td></td></tr>
                <tr><td>PassWord</td><td><input type="password" name="PassWord"></td><td></td></tr>
                <tr><td colspan="3" Align="Center"><input type="submit" name="submit" value="submit"></td></tr>
                <tr><td colspan="3"><Label><%=ans%></Label></td></tr>
                <tr><td colspan="3"><a href="ChangePasswordFormf.jsp">Update Faculty Credential </td></tr>
                <tr><td colspan="3"><a href="ChangePasswordForms.jsp">Update Student Credential </td></tr>

                
            </table>
        </form>
                
                      <%
                        NewClass obj1 = new NewClass();
                        obj1.rs = obj1.SelectAll("select * from newstbl where status like 'Confirm' order by NewsId");
                        while(obj1.rs.next())
                        {
                        %>
                          <marquee  style="color:goldenrod; height:200px" behavior="scroll" scrollamount="2" direction="UP" onmousedown="this.stop();" onmouseup="this.start();"><%=obj1.rs.getString(2)%><br/><%=obj1.rs.getString(3)%></marquee>
                          <%
                        }
                        %>
                    
                       </div>
    </div>
    <!-- ####################################################################################################### --> 
  </div>
</div>
<!-- ####################################################################################################### -->
    <jsp:include page="Wrapper5.jsp"></jsp:include>         

    </body>
</html>
