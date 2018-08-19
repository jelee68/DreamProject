<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
	<article>

    </article>
    <input type="button" value="fetch" onclick="
      fetch('resources/fff').then(function(response){
        console.log(response);
      });
    ">
</body>
</html>
