<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 <header id="header">
      <div class="inner-1280">
         <h1><a href="">Dream Library</a></h1>
         <dl class="top-menu">
            <dt class="hide">상위메뉴</dt>
            <dd><a href="">login</a>|</dd>
            <dd><a href="">join</a></dd>
         </dl>
      </div>
   </header>

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
                        <td>${selectedBook.book_code}</td>
                     </tr>
                     <tr>
                        <th scope="row">출판사</th>
                        <td>${selectedBook.book_pub}</td>
                     </tr>
                     <tr>
                        <th scope="row">발행년도</th>
                        <td>${selectedBook.book_date}</td>
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