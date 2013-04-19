<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html>
<head>
  <link rel="stylesheet" type="text/css" href="styles/screen.css" />
</head>
<body>
  <jsp:useBean id="gamebean" class="beans.GameBean" scope="session" />
  <jsp:setProperty name="gamebean" property="*" />

  <p>U r <%= gamebean.getPlayer() %><p>
  <p>Ur session Id is: <%= session.getAttribute("id") %> </p>
  <p>Plz continue here: <a href="register.jsp">F0 START</a></p>
</body>

