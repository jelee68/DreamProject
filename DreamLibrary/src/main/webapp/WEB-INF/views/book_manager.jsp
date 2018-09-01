<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>도서 관리 | 드림도서관</title>
	<link rel="stylesheet" href="resources/css/sub_import.css" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
</head>
<body>

 <%@ include file="include/header.jsp" %>

   <div id="container">
      <div id="bookManager">
         <div class="inner-1280">
            <div class="wrap cf">
            <section class="sec1">
               <div class="list_wrap">
                  <table class="col_name">
                     <caption class='hide'>컬럼명</caption>
                     <colgroup>
                        <col width="4.5%" />
                        <col width="13.5%" />
                        <col width="39.5%" />
                        <col width="15.5%" />
                        <col width="17.5%" />
                        <col width="*" />
                     </colgroup>
                     <thead>
                        <tr>
                           <th scope="col">no</th>
                           <th scope="col">도서ID</th>
                           <th scope="col">서명</th>
                           <th scope="col">저자</th>
                           <th scope="col">출판사</th> 
                           <th scope="col">상태</th>                           
                        </tr>
                     </thead>
                  </table>
                  <div class="book_list_wrap">
                     <table class="book_list">
                        <caption class='hide'>등록도서목록</caption>
                        <colgroup>
                        <c:set value="${booklist.size()}" var="listCnt"></c:set>
                        <c:choose>
						 
						    <c:when test="${listCnt < 20}">
						       <col width="4.5%" />
		                       <col width="13.5%" />
		                       <col width="39.5%" />
		                       <col width="15.5%" />
		                       <col width="17.5%" />
		                       <col width="*" />
						    </c:when>
	
						    <c:otherwise>
						       <col width="5%" />
	                           <col width="14%" />
	                           <col width="40%" />
	                           <col width="16%" />
	                           <col width="18%" />
	                           <col width="*" />
						    </c:otherwise>
						 
						</c:choose>
 
                        </colgroup>
                        <tbody>    
                        
                         <c:forEach items="${booklist}" var="dto" varStatus="status">
  							<tr>
                              <td class="list_index">${dto.seq}</td>
                              <td class="book_id">${dto.book_id}</td>
                              <td class="book_name">${dto.book_name}</td>
                              <td class="book_author">${dto.book_author}</td>
                              <td class="rent_status">${dto.book_pub}</td>
                              <td>${dto.book_del}</td>
  							</tr>
  						  </c:forEach>  
                        </tbody>
                     </table>
                  </div>
               </div>

               <div class="btn_wrap">
                  <button class="add_btn">신규 등록</button>
               </div>
            </section>

            <section class="sec2">
               <form action="book_add" method="post" enctype="multipart/form-data">
                  <fieldset>
                     <legend class="hide">도서관리</legend>
                     <p>
                        <label for="bookCode">코드</label>
                        <select id="bookCode" name="book_code">
                          <c:set var = "book_cd" scope = "page"/>
                           <option value="">코드선택  </option>
                           <option value="01">01 문학</option>
                           <option value="02">02 언어</option>
                           <option value="03">03 철학</option>
                           <option value="04">04 종교</option>
                           <option value="05">05 예술</option>
                           <option value="06">06 사회과학</option>
                           <option value="07">07 자연과학</option>
                           <option value="08">08 기술과학</option>
                           <option value="09">09 역사</option>
                           <option value="10">10 기타</option>
                        </select>

                     </p>
                     <p>
                        <label for="book_id">책고유ID</label>
                        <input type="text" name="book_id" id="bookId" readonly="readonly"/> 
                        <!-- <input type="text" name="book_id" value="" id="bookId"/>    -->                     
                     </p>
                     <p>
                        <label for="bookName">서명</label>
                        <input type="text" name="book_name" id="bookName"/>
                     </p>
                     <p>
                        <label for="bookAuthor">저자</label>
                        <input type="text" name="book_author" id="bookAuthor"/>
                     </p>

                     <p>
                        <label for="bookDate">출판일</label>
                        <input type="text" name="book_date" id="bookDate" placeholder="예) 19900101"/>
                        <label for="bookPub">출판사</label>
                        <input type="text" name="book_pub" id="bookPub"/>
                     </p>
                     <p>
                        <label for="bookInDate">도서반입일</label>
                        <input type="text" name="book_in_date" id="bookInDate" readonly="readonly"/>
                        <label for="bookAmount">권수</label>
                        <input type="text" name="book_cnt" id="bookAmount" value="1"/>
                     </p>
                     <p>
                        <label for="bookImg">도서이미지</label>
                        <input type="file" name="fileName"/>
                        <input type="hidden" name="book_imgPath" id="bookImg"/>                        
                     </p>
                     <p class="btn_wrap">
                        <input type="submit" name="" value="업데이트" id="updateBtn"/>
                        <input type="button" name="" id="deleteBtn" value="삭제">
                     </p>
                  </fieldset>
               </form>
            </section>
            </div>
         </div>
      </div>
   </div>

   <script type="text/javascript" src="resources/js/jquery.js"> </script>
   <script type="text/javascript" src="resources/js/jquery-ui.min.js"> </script>
   <script type="text/javascript">
      $(function(){
         //
            $(".sec1 table tbody").on("click","tr",function(){
               $(".sec2 form").attr("action","book_modify");
               $(".sec1 table tbody tr:nth-child(2n-1)").css("background-color","#fff");
               $(".sec1 table tbody tr:nth-child(2n)").css("background-color","#f9f9f9");
               $(this).css("background-color","rgba(77, 155, 184,0.2)");
               var bookId = $(this).find(".book_id").text();
               $.ajax({    
  	               
       			url: 'book_sel',  
	                type:'post',  
	                dataType: 'json',
	                data: { 'book_id' : bookId },
	                success : function(data){ 
	                	
	                	for ( keyName in data ) {
	      
	                		$(".sec2 p select[name="+keyName+"]").find("option[value="+data[keyName]+"]").prop("selected", true);
	                		$(".sec2 p input[name="+keyName+"]").val(data[keyName]);		
            			}        	
	                }, 
	                error : function(data){ 
	                	alert("에러"); 
             		}
        
       	  	  }); 
            })

            $(".sec1 .add_btn").on("click",function(){
               $(".sec2 form").attr("action","book_add");
               $(".sec1 table tbody tr:nth-child(2n-1)").css("background-color","#fff");
               $(".sec1 table tbody tr:nth-child(2n)").css("background-color","#f9f9f9");
               $(".sec2 form p").not('.btn_wrap').find("input").val("");
               $("#bookCode option:eq(0)").prop("selected", true);
               $("#bookAmount").val("1");
            })
            
            $(".sec2 #deleteBtn").on("click",function(){
            	var book_id = $("#bookId").val();
               location.href="book_delete?book_id="+book_id;
           })
                        
            ////////////
            $('#bookCode').on("change",function(){
            	$.ajax({    
 	               
        			url:'max_book_id',  
	                type:'post',  
	                dataType: 'json',
	                data: { 'book_code' : $('#bookCode').val()},
	                
	                success : function(data){  
	                	console.log(data.book_id);
	                	$('#bookId').val(data.book_id);
	                	             
	                }, 
	                error : function(){ 
	                	 alert('에러'); 
              		} 
	                
        	  });        	

             })
             
      ////////////
         //
      })
   </script>
</body>
</html>