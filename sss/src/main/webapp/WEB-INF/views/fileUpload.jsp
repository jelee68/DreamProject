<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.* , java.util.*"%>          
<%@ page import = "com.oreilly.servlet.MultipartRequest"%>     
<%@ page import = "com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

    String uploadPath="c:\\dev\\workspace\\upload";
	//String uploadPath=request.getRealPath("upload");
	System.out.println("절대경로 >> " + uploadPath);

int size = 10*1024*1024;

	String name="";
	String subject="";
	String filename1="";
	String filename2="";
	
try{
    MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
		
    name=multi.getParameter("name");
    subject=multi.getParameter("subject");
		
    Enumeration files = multi.getFileNames();
    String file1 = (String)files.nextElement();
    filename1 = multi.getFilesystemName(file1);
    String file2 = (String)files.nextElement();
    filename2=multi.getFilesystemName(file2);

}catch(Exception e){
    e.printStackTrace();
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
<form name="filecheck" action="fileCheck" method="post">
    <input type="hidden" name="name" value="<%=name %>">
    <input type="hidden" name="subject" value="<%=subject %>">
    <input type="hidden" name="filename1" value="<%=filename1 %>">
    <input type="hidden" name="filename2" value="<%=filename2 %>">
</form>
<a href="#" onclick="javascript:filecheck.submit()">업로드 확인 및 다운로드 페이지이동 </a>
</body>
</html>