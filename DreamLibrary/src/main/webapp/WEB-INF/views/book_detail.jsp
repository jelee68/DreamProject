<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>상세 정보 | 드림도서관</title>
	<link rel="stylesheet" href="resources/css/sub_import.css" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
</head>
<body>
 <%@ include file="include/header.jsp" %>

   <div id="container">
      <div id="bookDetail">
         <div class="inner-1280">
            <article class="cf">
               <h3 class="book_name">${selectedBook.book_name}</h3>
               <p class="book_author">${selectedBook.book_author}</p>

               <table>
                  <caption class="hide">상세정보</caption>
                  <colgroup>
      					<col width="14%">
      					<col width="80%">
      				</colgroup>
                  <tbody>
                     <tr>
                        <th scope="row">분류</th>
                        <td>
					      <c:choose>
					         <c:when test = "${selectedBook.book_code eq '01'}">문학</c:when>
					         <c:when test = "${selectedBook.book_code eq '02'}">언어</c:when>
					         <c:when test = "${selectedBook.book_code eq '03'}">철학</c:when>
					         <c:when test = "${selectedBook.book_code eq '04'}">종교</c:when>
					         <c:when test = "${selectedBook.book_code eq '05'}">예술</c:when>
					         <c:when test = "${selectedBook.book_code eq '06'}">사회과학</c:when>
					         <c:when test = "${selectedBook.book_code eq '07'}">자연과학</c:when>
					         <c:when test = "${selectedBook.book_code eq '08'}">기술과학</c:when>	
					         <c:when test = "${selectedBook.book_code eq '09'}">역사</c:when>				         					         				         					         					         					         					         					         					         
					         <c:otherwise>기타</c:otherwise>
					      </c:choose>                        
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">출판사</th>
                        <td>${selectedBook.book_pub}</td>
                     </tr>
                     <tr>
                        <th scope="row">발행년도</th>
                        <td>
                        <fmt:parseDate value="${selectedBook.book_date}" var="book_date" pattern="yyyyMMdd"/>
						<fmt:formatDate value="${book_date}" pattern="yyyy.MM.dd"/> 
                        </td>
                     </tr>
                     <tr>
                        <th scope="row">대출여부</th>
                        <td class="rent_able">${selectedBook.book_status}</td>
                     </tr>
                  </tbody>
               </table>
               <img src="${selectedBook.book_imgPath}" alt="책표지이미지">

            </article>

         </div>
      </div>
   </div>

   <script type="text/javascript" src="resources/js/jquery.js"> </script>
   <script type="text/javascript" src="resources/js/jquery-ui.min.js"> </script>
   <script type="text/javascript">

   </script>

</body>
</html>