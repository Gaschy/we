<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html>
<head>
  <link rel="stylesheet" type="text/css" href="styles/screen.css" />
</head>
<body>
  <jsp:useBean id="gamebean" class="beans.GameBean" scope="session" />
  <jsp:setProperty name="gamebean" property="*" />

  <form method="post" action="savename.jsp">
    <p>What's your name?
    <input type=text name=player size=20 /></p>
    <p>Who do you want to race?
    <input type=text name=ai size=20 /></p>
    <p><input type=submit value="go"/>
    </form>

</body>

<!--    //String tgtPage = "register.jsp";
   //response.sendRedirect( tgtPage );
    <p>Player pos?
    <input type=text name=player_pos size=20 /></p>
-->

