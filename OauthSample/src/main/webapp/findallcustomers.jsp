<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.BufferedReader, java.io.InputStreamReader, java.util.Properties, com.intuit.oauthsample.OAuthUtils, java.util.Iterator, java.net.URL, java.net.HttpURLConnection, oauth.signpost.OAuthConsumer, oauth.signpost.basic.DefaultOAuthConsumer"  %>
<%@ page import="org.slf4j.Logger" %>
<%@ page import="org.slf4j.LoggerFactory" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <%
            OAuthUtils utils = new OAuthUtils();
            Properties prop = utils.readProperties();

            Logger logger = LoggerFactory.getLogger("OauthSample");

        %>

        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <link rel="stylesheet" type="text/css" media="screen" href="css/_reset.css">
        <link rel="stylesheet" type="text/css" media="screen" href="css/common.css">       
        <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
        <script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
        <script src="http://code.jquery.com/jquery-latest.js"></script>  
        <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
        <script type="text/javascript"> 
            $(function() {
                function getCookieValue (cookieName){
                        return $.cookie(cookieName);
                    }
                });
        </script>>
        <title>Retrieve Customers</title>
    </head>
    <body>
        This jsp calls the QBO Customer endpoint to retrieve customer with id 2
        <ul>

            <%     

              // Set expiry date after 24 Hrs for both the cookies.
                String accesstoken = (String) session.getAttribute("accessToken");
                String accessstokensecret = (String) session.getAttribute("accessTokenSecret");
                String realmID = (String) session.getAttribute("realmId");
                response.addCookie(new Cookie("accessToken", accesstoken));
                response.addCookie(new Cookie("accessTokenSecret", accessstokensecret));
                response.addCookie(new Cookie("realm", realmID));

                OAuthConsumer ouathconsumer = new DefaultOAuthConsumer(prop.getProperty("oauth_consumer_key"), prop.getProperty("oauth_consumer_secret"));
                ouathconsumer.setTokenWithSecret(accesstoken, accessstokensecret);

                HttpURLConnection urlConnection = null;
                URL url = null;

                try {

                    url = new URL(prop.getProperty("qbo_url") + realmID + "/customer/2");

                    urlConnection = (HttpURLConnection) url.openConnection();
                    urlConnection.setRequestMethod("GET");
                    urlConnection.setUseCaches(false);
                    urlConnection.setDoInput(true);
                    urlConnection.setDoOutput(true);
                    urlConnection.setRequestProperty("Connection", "Keep-Alive");
                    urlConnection.setRequestProperty("Content-Type", "application/json");
                    urlConnection.setRequestProperty("Accept", "application/json");

                    ouathconsumer.sign(urlConnection);

                    urlConnection.connect();

                    if (urlConnection != null) {

                        BufferedReader rd = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
                        out.println(rd.readLine());
                        rd.close();

                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }


            %>

        </ul>
    </body>
</html>