<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>자료 검색 | 드림도서관</title>
	<link rel="stylesheet" href="resources/css/sub_import.css" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
</head>
<body>
 <%@ include file="include/header.jsp" %>

   <div id="container">
      <div id="bookSearch">
         <div class="inner-1280">
               <div class="wrap">
               <h2>자료검색</h2>
               <div class="detail">
                     <div class="detail-content">
                        <form action="search_result" method="post">
                        <fieldset>
                        <legend class="hide">상세조건선택</legend>

                        <p class="cf">
                           <select name="select1" title="기준을 선택하세요">
                              <option value="book_name" selected>제목</option>
                              <option value="book_author">저자</option>
                              <option value="book_pub">출판사</option>
                           </select>
                           <input type="text" name="input1" id="input">
                           <select id="condition" name="cond01" title="조건을 선택하세요">
                              <option value="AND">AND</option>
                              <option value="OR">OR</option>
                           </select>
                        </p>

                        <p class="cf">
                           <select id="" name="select2" title="기준을 선택하세요">
                              <option value="book_name">제목</option>
                              <option value="book_author" selected>저자</option>
                              <option value="book_pub">출판사</option>
                           </select>
                           <input type="text" name="input2" id="input">
                           <select id="condition" name="cond02" value="" title="조건을 선택하세요">
                              <option value="AND">AND</option>
                              <option value="OR">OR</option>
                           </select>
                        </p>

                        <p class="cf">
                           <select id="" name="select3" title="기준을 선택하세요">
                              <option value="book_name">제목</option>
                              <option value="book_author">저자</option>
                              <option value="book_pub" selected>출판사</option>
                           </select>
                           <input type="text" name="input3" id="input">
                        </p>

                        <p class="btn-wrap">
                           <input type="reset" id="reset" value="다시쓰기">
                           <input type="submit" id="dataSearch" value="검색"/>
                           <input type="button" id="close" value="상세검색 닫기"/>
                        </p>
                     </fieldset>
                     </form>

                  </div>
               </div>



         </div>
      </div>
   </div>

   <script type="text/javascript" src="resources/js/jquery.js"> </script>
   <script type="text/javascript" src="resources/js/jquery-ui.min.js"> </script>
   <script type="text/javascript">

   </script>
</body>
</html>