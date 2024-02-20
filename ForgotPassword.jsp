

<%@page import="java.sql.ResultSet"%>
<%@page import="project.NewClass"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password Form</title>
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
        <h2 class="title">Forgot Password Form</h2>

<%
    String ans="";
if(request.getParameter("submit")!=null)
{
    int flag=0;
    NewClass obj = new NewClass();
    String UserName =  request.getParameter("UserName");
    String Email=  request.getParameter("Email");
    
    if(flag==0)
    {
         
        ResultSet rs  = obj.SelectAll("select * from StudentMst");
        while(rs.next())
        {
            if(rs.getString("UserName").equals(UserName))
            {
                if(rs.getString("Email").equals(Email))
                {
                flag=1;
                ans="Your Password" + rs.getString("Password");
                
                
String result;
  String to =  rs.getString("Email");
	 
	    // Sender's email ID needs to be mentioned
	    String from = "360.sigma.college@gmail.com";
	    final String username = "360.sigma.college";
	    final String password = "kpap@360";
	 
	    // Assuming you are sending email through relay.jangosmtp.net
	    String host = "smtp.gmail.com";
	 
	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", "587");
	 
	    //Get the Session object.
	    Session mailSession = Session.getInstance(props,
	            new javax.mail.Authenticator() {
	                protected PasswordAuthentication getPasswordAuthentication() {
	                    return new PasswordAuthentication(username,
	                            password);
	                }
	            });
	 
	    try {
 	        Message message = new MimeMessage(mailSession);
	 
	        // Set From: header field of the header.
	        message.setFrom(new InternetAddress(from));
	 
	        // Set To: header field of the header.
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
	 
	        // Set Subject: header field
	        message.setSubject("Your Password   :   ");
	 
	        // Now set the actual message
	        message.setText( rs.getString("Password"));
	 
	        // Send message
	        Transport.send(message);
	 
	        System.out.println("Sent message successfully....");
	        result = "Sent message successfully....";
	 
	    } catch (MessagingException e) {
	        e.printStackTrace();
	        result = "Error: unable to send message....";
                 out.println(""+e);
	 
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
                <tr><td colspan="3" Align="Center">Forgot Password Form</td></tr>
                <tr><td>UserName</td><td><input type="text" name="UserName"></td><td></td></tr>
                <tr><td>Email </td><td><input type="email" name="Email"></td><td></td></tr>
                <tr><td colspan="3" Align="Center"><input type="submit" name="submit" value="submit"></td></tr>
                <tr><td colspan="3"><Label><%=ans%></Label></td></tr>
                
                
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
