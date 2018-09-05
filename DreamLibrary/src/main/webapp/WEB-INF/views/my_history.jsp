<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>내 서재 | 드림도서관</title>
	<link rel="stylesheet" href="resources/css/sub_import.css" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
	
</head>
<body>
 <%@ include file="include/header.jsp" %>
   <div id="container">
      <div id="myHistory">
         <div class="inner-1280">
            <section class="sec1">
            <h2>내 서재</h2>
            <table>
               <caption class='hide'>대출현황목록</caption>
               <colgroup>
                  <col width="5%" />
                  <col width="13%" />
                  <col width="45%" />
                  <col width="13%" />
                  <col width="13%" />
                  <col width="*" />
               </colgroup>
               <thead>
                  <tr>
                     <th scope="col">번호</th>
                     <th scope="col">대출일</th>
                     <th scope="col">자료명</th>
                     <th scope="col">반납예정일</th>
                     <th scope="col">반납일</th>
                     <th scope="col">상태</th>
                  </tr>
               </thead>
               <tbody>
               	<c:forEach items="${my_list}" var="dto">
               	

  					<tr>
                      <td class="history_index">${dto.rownum}</td>
		              <td class="book_rent_date"><fmt:formatDate value="${dto.book_rent_date}" type="both" pattern="yyyy-MM-dd"/></td>
		              <td class="book_name">${dto.book_name}</td>
		              <td class="book_re_due_date"><fmt:formatDate value="${dto.book_re_due_date}" type="both" pattern="yyyy-MM-dd"/></td>
		              <td class="book_re_date"><fmt:formatDate value="${dto.book_re_date}" type="both" pattern="yyyy-MM-dd"/></td>
		              <td class="book_status">${dto.rent_status}</td>
  					</tr>
  				</c:forEach>

               </tbody>
            </table>
            </section>
            <section class="sec2">
               <p class="paging">
               	 <c:if test="${pagination.curRange ne 1 }">
					<a href="my_history?curPage=1" class="arrow first"><img src="resources/images/firstPage.gif" alt="맨앞"></a>	 	
				 </c:if>
				 <c:if test="${pagination.curPage ne 1}">
                    <a href="my_history?curPage=${pagination.prevPage }" class="arrow prev"><img src="resources/images/prevPage.gif" alt="이전"></a>
                 </c:if>
							
				 <c:forEach var="pageNum" begin="${pagination.startPage }" end="${pagination.endPage }">
                        <c:choose>
                            <c:when test="${pageNum eq  pagination.curPage}">
                                <span style="font-weight: bold;"><a href="my_history?curPage=${pageNum }" class='on'>${pageNum }</a></span> 
                                <%-- onClick="fn_paging('${pageNum }')" --%>
                            </c:when>
                            <c:otherwise>
                                <span><a href="my_history?curPage=${pageNum }">${pageNum }</a></span> 
                            </c:otherwise>
                        </c:choose>
                 </c:forEach>
						
					
							
                 <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
                        <a href="my_history?curPage=${pagination.nextPage }" class="arrow next"><img src="resources/images/nextPage.gif" alt="다음"></a> 
                 </c:if>
                 <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
                        <a href="my_history?curPage=${pagination.pageCnt }" class="arrow last"><img src="resources/images/lastPage.gif" alt="맨뒤"></a> 
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