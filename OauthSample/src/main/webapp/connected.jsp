<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Connected to Intuit</title>      
        <link rel="stylesheet" type="text/css" href="./WEB-Files/view.css" media="all">  
        <script type="text/javascript" src="./WEB-Files/view.js"></script>
        <script type="text/javascript" src="./WEB-Files/calendar.js"></script>
    </head>
        <%

            // Set expiry date after 24 Hrs for both the cookies.
            String accesstoken = (String) session.getAttribute("accessToken");
            String accessstokensecret = (String) session.getAttribute("accessTokenSecret");
            String realmID = (String) session.getAttribute("realmId");
            response.addCookie(new Cookie("accessToken", accesstoken));
            response.addCookie(new Cookie("accessTokenSecret", accessstokensecret));
            response.addCookie(new Cookie("realm", realmID));
        %>        
        
 
   <body id="main_body" class="no_guidelines safari">
       <img id="top" src="./WEB-Files/top.png" alt="">
      <div id="form_container">
         <form id="qb" class="appnitro">         
             <b> Successfully connected to QuickBooks Online. </b> <br>
             <b> You may close this window. </b
               
         </form>
      </div>
      <img id="bottom" src="./WEB-Files/bottom.png" alt="">
   </body>
</html>