<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>"<s:authentication property="name"/>" 님께서 로그인하셨습니다.</h4>


<s:authorize ifAnyGranted="0">
<p> <b>USER</b> "<s:authentication property="name"/>" is Log-In</p>
</s:authorize>

<s:authorize ifAnyGranted="1">
<p> <b>ADMIN</b> "<s:authentication property="name"/>" is Log-In
</s:authorize>

<a href="${pageContext.request.contextPath}/j_spring_security_logout">로그아웃</a>


<p>


</body>
</html>