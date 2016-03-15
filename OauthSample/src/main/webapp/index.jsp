<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Connect to QuickBooks</title>
      <link rel="stylesheet" type="text/css" href="./WEB-Files/view.css" media="all">
      <script type="text/javascript" src="./WEB-Files/view.js"></script>
      <script type="text/javascript" src="./WEB-Files/calendar.js"></script>      
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
      <script type="text/javascript" >
          function getParamValue(name) {
            url = location.href
            name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
            var regexS = "[\\?&]"+name+"=([^&#]*)";
            var regex = new RegExp( regexS );
            var results = regex.exec( url );
            return results == null ? null : results[1];
        }
          
      </script>
      <script type="text/javascript" src="https://appcenter.intuit.com/Content/IA/intuit.ipp.anywhere-1.3.2.js"></script>
      <script>intuit.ipp.anywhere.setup({
         menuProxy: '',
         grantUrl: 'http://innercircle.visp.net:29998/RequestToken?consumer_key='+getParamValue("consumer_key")+"&consumer_secret="+getParamValue("consumer_secret")}); 
      </script>
   </head>
   <body id="main_body" class="no_guidelines safari">
       <img id="top" src="./WEB-Files/top.png" alt="">
      <div id="form_container">
         <form id="qb" class="appnitro">
            <div class="form_description">
               <h2>Connect to QuickBooks</h2>
               <p></p>
            </div>
            <ul>
               <li id="li_1">
                  <label class="description" for="consumer_key">Consumer Key </label>
                  <div>
                     <input id="consumer_key" name="consumer_key" class="element text medium" type="text" maxlength="255" value=""> 
                  </div>
               </li>
               <li id="li_2">
                  <label class="description" for="consumer_secret">Consumer Secret </label>
                  <div>
                     <input id="consumer_secret" name="consumer_secret" class="element text medium" type="text" maxlength="255" value=""> 
                  </div>
               </li>
               <li class="buttons">
                  <ipp:connectToIntuit></ipp:connectToIntuit>
               </li>
            </ul>
         </form>
         <div id="footer">		
         </div>
      </div>
      <img id="bottom" src="./WEB-Files/bottom.png" alt="">
   </body>
   <script>
        var consumer_key = getUrlVars()["consumer_key"];
        var consumer_secret = getUrlVars()["consumer_secret"];
        document.getElementById("consumer_key").value = consumer_key;
        document.getElementById("consumer_secret").value = consumer_secret;
   </script>
</html>