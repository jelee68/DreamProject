<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>드림도서관</title>
	<link rel="stylesheet" href="resources/css/import.css" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
</head>
<body>
 
<header id="header">
      <div class="inner-1280">
         <h1><a href="index">Dream Library</a></h1>
         <dl class="top-menu">
            <dt class="hide">상위메뉴</dt>
            
            <s:authorize ifNotGranted="0,1">
            	<dd><a href="login">login</a>|</dd>
            	<dd><a href="join">join</a></dd>
            </s:authorize>
            <s:authorize ifAnyGranted="0">
				<dd> "${userInfo.user_name }"님 반갑습니다. |</dd>
				<dd><a href="${pageContext.request.contextPath}/j_spring_security_logout">로그아웃</a></dd>
			</s:authorize>
			<s:authorize ifAnyGranted="1">
				<dd> admin "<s:authentication property="name"/>"님 반갑습니다. |</dd>
				<dd><a href="${pageContext.request.contextPath}/j_spring_security_logout">로그아웃</a></dd>
			</s:authorize>
         </dl>
      </div>
   </header>

   <div id="container">
      <div id="content">
         <div class="inner-1280">
            <section class="sec1">
               <div class="wrap">
               <div class="easy cf">
                  <h4>
                     <span class="detail-btn">
                     	상세검색
                     </span>
                  </h4>
                  <form action="" method="post" >
         			  	<fieldset>
         					<legend class="hide">자료검색하기</legend>
         					<p class="cf">
                           <select class="" name="">
                              <option value="전체" selected>전체</option>
                              <option value="제목">제목</option>
                              <option value="저자">저자</option>
                           </select>
         						<label for="search"></label>
         						<input type="text" value="" id="search" placeholder="자료검색"/>
         						<input type="submit" value="" id="searchBtn"/>
                        </p>
         				</fieldset>
         			</form>

               </div>

               <div class="detail">
                     <div class="detail-content">
                        <form action="" method="post">
                        <fieldset>
                        <legend class="hide">상세조건선택</legend>

                        <p class="cf">
                           <select id="" name="standard1" value="" title="기준을 선택하세요">
                              <option selected>제목</option>
                              <option>저자</option>
                              <option>출판사</option>
                           </select>
                           <input type="text" name="input1" id="input">
                           <select id="condition" name="condition" value="" title="기준을 선택하세요">
                              <option>AND</option>
                              <option>OR</option>
                           </select>
                        </p>

                        <p class="cf">
                           <select id="" name="standard2" value="" title="기준을 선택하세요">
                              <option>제목</option>
                              <option selected>저자</option>
                              <option>출판사</option>
                           </select>
                           <input type="text" name="input2" id="input">
                           <select id="condition" name="condition" value="" title="기준을 선택하세요">
                              <option>AND</option>
                              <option>OR</option>
                           </select>
                        </p>

                        <p class="cf">
                           <select id="" name="standard3" value="" title="기준을 선택하세요">
                              <option>제목</option>
                              <option>저자</option>
                              <option selected>출판사</option>
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
            </section>

            <section class="sec2">
                  <ul class="menu cf">
                  <s:authorize ifNotGranted="0,1">
                  	 <li><a href="dream_info">드림도서관 소개</a></li>
            		 <li><a href="book_search">자료 검색</a></li> 
            	  </s:authorize>
            	  <s:authorize ifAnyGranted="0">
            	 	 <li><a href="dream_info">드림도서관 소개</a></li>
            	     <li><a href="book_search">자료 검색</a></li> 
            	     <li><a href='my_history'>내 서재</a></li>
                     <%-- <li><a href='my_history?user_id=<s:authentication property="name"/>'>내 서재</a></li>  --%>
                   
                     
            	  </s:authorize>
            	  <s:authorize ifAnyGranted="1">
            	  	 <li><a href="dream_info">드림도서관 소개</a></li>
                     <li><a href="book_search">자료 검색</a></li>                     
                     <li><a href="book_manager">도서 관리</a></li>
                     <li><a href="rent_manager">대출 관리</a></li>
            	  </s:authorize>           	  	 
                  </ul>
            </section>

            <section class="sec3">
                  <p>
                  <strong> 신착 도서</strong>
                  <em>new books</em></p>
               <ul class="new_list cf">
   					
   					<c:forEach items="${new_book}" var="dto" varStatus="status">
  						<li>
  							<a href="#">
	   							<img src="${dto.book_imgPath }" alt="신간도서${status.count}" />
	   							<strong>${dto.book_name }</strong>
   							</a>
   						</li>
  					</c:forEach>
   					
				</ul>
				
				
            </section>
         </div>
      </div>
   </div>

   <script type="text/javascript" src="resources/js/jquery.js"> </script>
   <script type="text/javascript" src="resources/js/jquery-ui.min.js"> </script>
   <script type="text/javascript">
      $(function(){
         $(".detail-btn").on("click",function(){
            $(".detail").slideToggle();
         })
      })
   </script>
</body>
</html>