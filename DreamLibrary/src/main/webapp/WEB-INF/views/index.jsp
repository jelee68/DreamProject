<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 


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
 
 <%@ include file="include/header.jsp" %>


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
                  <form action="book_simple_search" method="post" >
         			  	<fieldset>
         					<legend class="hide">자료검색하기</legend>
         					<p class="cf">
                           <select class="" name="select1">
                              <option value="book_name" selected>제목</option>
                              <option value="book_author">저자</option>
                              <option value="book_pub">출판사</option>
                           </select>
         						<label for="search"></label>
         						<input type="text" name="input1" id="search" placeholder="자료검색"/>
         						<input type="submit" value="" id="searchBtn"/>
                        </p>
         				</fieldset>
         			</form>

               </div>

               <div class="detail">
                     <div class="detail-content">
                        <form action="search_result" method="post">
                        <fieldset>
                        <legend class="hide">상세조건선택</legend>

                        <p class="cf">
                           <select  name="select1" title="기준을 선택하세요">
                              <option value="book_name" selected>제목</option>
                              <option value="book_author">저자</option>
                              <option value="book_pub">출판사</option>
                           </select>
                           <input type="text" name="input1" id="input">
                           <select id="condition" name="cond01" title="기준을 선택하세요">
                              <option>AND</option>
                              <option>OR</option>
                           </select>
                        </p>

                        <p class="cf">
                           <select name="select2" title="기준을 선택하세요">
                              <option value="book_name">제목</option>
                              <option value="book_author" selected>저자</option>
                              <option value="book_pub">출판사</option>
                           </select>
                           <input type="text" name="input2" id="input">
                           <select id="condition" name="cond02" title="기준을 선택하세요">
                              <option>AND</option>
                              <option>OR</option>
                           </select>
                        </p>

                        <p class="cf">
                           <select name="select3" title="기준을 선택하세요">
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
            </section>

            <section class="sec2">
                  <ul class="menu cf">
         
                  	 <li><a href="resources/project.pdf" target="_blank">드림도서관 소개</a></li>
 
  


            	     <li><a href="book_search">자료 검색</a></li> 
            	     <li><a href='my_history'>내 서재</a></li>
                     <%-- <li><a href='my_history?user_id=<s:authentication property="name"/>'>내 서재</a></li>  --%>
                   
                                   
                     <li><a href="book_manager">도서 관리</a></li>
                     <li><a href="rent_manager">대출 관리</a></li>
      	  	 
                  </ul>
            </section>

            <section class="sec3">
                  <p>
                  <strong> 신착 도서</strong>
                  <em>new books</em></p>

               <div class="new_list_wrap">
	               <div class="mask">	
		               <ul class="new_list cf">
		   					
		   					<c:forEach items="${new_book}" var="dto" varStatus="status">
		  						<li>
		  							<a href="book_detail?book_id=${dto.book_id}">
			   							<img src="${dto.book_imgPath }" alt="신간도서${status.count}" />
			   							<strong>${dto.book_name }</strong>
		   							</a>
		   						</li>
		  					</c:forEach>
		   					
						</ul>
					</div>
					<dl class="new_list_btn">
					   <dd class="btn_left">&lt;</dd>
					   <dd class="btn_right">&gt;</dd>		   
					</dl>
				
				</div> 
			
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
		
    	 var liWidth =  $(".new_list li").outerWidth();
    	 var liNum = $(".new_list li").length;
    	 console.log(liWidth)
    	 $(".new_list").width(liNum*liWidth);
    	 var ulWidth =  $(".new_list").width()
		 var cnt = 0; 
		 var w = liWidth*3; 
		 var tx = 0; 
		
	
         
         $(".btn_right").on('click',function(){
        	 
        	 if(cnt < (ulWidth/w)-1){
 				cnt++;
 				tx=cnt*-w;
 		
 				$('.new_list').animate({
 					'left':tx
 				},700);
 				//if(cnt>0){$('.prev').fadeIn()}
 				//if(cnt==3){$('.next').hide()}
 			}
			
         })
         
         $(".btn_left").on('click',function(){
        	
        	 if(cnt>0){
        		 
 				cnt--;
 				tx=cnt*-w;
 				console.log(tx)
 				$('.new_list').animate({
 					'left':tx
 				},700);
 				//if(cnt>0){$('.prev').fadeIn()}
 				//if(cnt==3){$('.next').hide()}
 			}
			
         })
   
 
      })
   </script>
</body>
</html>