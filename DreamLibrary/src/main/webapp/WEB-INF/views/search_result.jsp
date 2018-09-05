<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>검색 결과 | 드림도서관</title>
	<link rel="stylesheet" href="resources/css/sub_import.css" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
</head>
<body>
 <%@ include file="include/header.jsp" %>

   <div id="container">
      <div id="searchResult">
         <div class="inner-1280">
            <section class="sec1">
               <div class="wrap">
               <div class="easy cf">
                  <form action="book_simple_search" method="post" >
         			  	<fieldset>
         					<legend class="hide">자료검색하기</legend>
                        <p class="rescan">
                           <input type="checkbox" value="" id="rescan">
                           <label for="rescan">결과내 재검색</label>
                        </p>
         					<p class="cf">      					
                           <select class="" name="select1">
                              <option value="book_name" selected>제목</option>
                              <option value="book_author">저자</option>
                              <option value="book_pub">출판사</option>
                           </select>
         						<label for="search"></label>
         						<input type="text"  name="input1" id="search" placeholder="자료검색"/>
         						<input type="submit" value="검색" id="searchBtn"/>

                           <span class="go_book_search">
                              <a href="book_search">상세검색</a>
                           </span>
                        </p>
         				</fieldset>
         			</form>

               </div>
               </div>
            </section>

            <section class="sec2 cf">
               <div>
                  <h3><strong>${param.input1}/${param.input2}/${param.input3}</strong>에 대한 검색 결과 </h3>
                  <p>총<em>${fn:length(bookresult)}</em>건</p>
               </div>
               <ul>
             <c:forEach items="${bookresult}" var="dto" varStatus="status">              
                  <li class="cf">
                     <span class="result_num">${dto.seq}.</span>
                    	<a href="book_detail?book_id=${dto.book_id}" class="book_img"><img src="${dto.book_imgPath}" alt="책표지이미지"></a>
                    	<dl>
                    	<dt class="book_name"><a href="book_detail?book_id=${dto.book_id}">${dto.book_name}</a></dt>
                     	<dd class="book_author"><a href="book_detail?book_id=${dto.book_id}">${dto.book_author}</a></dd>
                     	<dd class="book_pub">${dto.book_pub}, ${dto.book_date}</dd>
                        <dd class="rent_chek rent_able">${dto.book_status}</dd>
                	  </dl>
  	        	   </li>
  				</c:forEach>
               </ul>
            </section>

            <section class="sec3">
               <p class="paging">
               	 <c:if test="${pagination.curRange ne 1 }">
					<a href="#" class="arrow first" onClick="fn_paging(1)"><img src="resources/images/firstPage.gif" alt="맨앞"></a>	 	
				 </c:if>
				 <c:if test="${pagination.curPage ne 1}">
                    <a href="#" class="arrow prev" onClick="fn_paging('${pagination.prevPage }')"><img src="resources/images/prevPage.gif" alt="이전"></a>
                 </c:if>
							
				 <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span style="font-weight: bold;"><a href="search_result?${pageNum }" class='on'>${pageNum }</a></span> 
                                <%-- onClick="fn_paging('${pageNum }')" --%>
                            </c:when>
                            <c:otherwise>
                                <span><a href="search_result?${pageNum }">${pageNum }</a></span> 
                            </c:otherwise>
                        </c:choose>
                 </c:forEach>
						
							
							
                 <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="#" class="arrow next" onClick="fn_paging('${pagination.nextPage }')"><img src="resources/images/nextPage.gif" alt="다음"></a> 
                 </c:if>
                 <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="#" class="arrow last" onClick="fn_paging('${pagination.pageCnt }')"><img src="resources/images/lastPage.gif" alt="맨뒤"></a> 
                 </c:if>    
						
	
			    </p>
			    
			      총 게시글 수 : ${pagination.listCnt } /    총 페이지 수 : ${pagination.pageCnt } / 현재 페이지 : ${pagination.curPage } / 현재 블럭 : ${pagination.curRange } / 총 블럭 수 : ${pagination.rangeCnt }
            </section>
            
            
       


         </div>
      </div>
   </div>

   <script type="text/javascript" src="resources/js/jquery.js"> </script>
   <script type="text/javascript" src="resources/js/jquery-ui.min.js"> </script>
   <script type="text/javascript">

   </script>
</body>
</html>