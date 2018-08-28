<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename1 = request.getParameter("filename1");
	String filename2 = request.getParameter("filename2");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
올린사람 : <%=name %><br/>
제목 : <%=subject %><br/>
파일명1 : <a href="upload/<%=filename1%>"><%=filename1%></a><br/>
파일명2 : <a href="upload/<%=filename2%>"><%=filename2%></a><br/>
</body>
</html>