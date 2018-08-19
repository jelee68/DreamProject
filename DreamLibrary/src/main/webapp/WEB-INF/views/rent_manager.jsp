<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>대출 관리 | 드림도서관</title>
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
      <div id="rentManager">
         <div class="inner-1280">
            <div class="all_wrap">
              <section class="sec1 cf">

                <article class="user">
                     <form action="rent_user_check" method="post">
                        <fieldset>
                           <legend class="hide">회원정보</legend>
                           <p>
                              <label for="userId">회원 번호</label>
                              <input type="text" name="user_id" id="userId"/>
                              <input type="button" name="" value="조회" id="checkUser">
                              <!--  onclick="location='login.html'"  -->
                           </p>

                           <dl class="user_info">
                              <dt>이름</dt><dd class="user_name"></dd>
                              <dt>연락처</dt><dd class="user_tel">${userInfo.user_tel }</dd>
                              <dt>주소</dt><dd class="user_arrd">${userInfo.user_addr}</dd>
                           </dl>
                        </fieldset>
                     </form>


                </article>

                <article class="book">
                   <form action="rent_book_check" method="post" id="myForm">
                      <fieldset>
                        <legend class="hide">도서정보</legend>
                        <p>
                           <label for="bookId">책ID</label>
                           <input type="text" name="book_id" value="${bookInfo.book_id }" id="bookId"/>
                           <input type="submit" name="" value="조회" id="checkBook">
                        </p>

                        <dl class="book_info">
                           <dt>서명</dt><dd class="book_name">${bookInfo.book_name }</dd>
                           <dt>저자</dt><dd class="book_author">${bookInfo.book_author }</dd>
                           <dt>출판일</dt><dd class="book_date">${bookInfo.book_date }</dd>
                           <dt>출판사</dt><dd class="book_pub">${bookInfo.book_pub }</dd>
                        </dl>
                        <input type="submit" name="" value="대출" id="rentBtn">
                      </fieldset>
                   </form>
                </article>
              </section>

              <section class="sec2">
                 <div class="list_wrap">
                   <table class="col_name">
                      <caption class='hide'>컬럼명</caption>
                      <colgroup>
                         <col width="10%" />
                         <col width="10%" />
                         <col width="40%" />
                         <col width="15%" />
                         <col width="15%" />
                         <col width="*" />
                      </colgroup>
                      <thead>
                         <tr>
                            <th scope="col">대출번호</th>
                            <th scope="col">책 ID</th>
                            <th scope="col">서명</th>
                            <th scope="col">대출일</th>
                            <th scope="col">반납예정일</th>
                            <th scope="col">상태</th>
                         </tr>
                      </thead>
                   </table>
                <div class="rent_list_wrap">
                <table class="rent_list">
                   <caption class='hide'>대출목록</caption>
                   <colgroup>
                      <col width="10%" />
                      <col width="10%" />
                      <col width="40%" />
                      <col width="15%" />
                      <col width="15%" />
                      <col width="*" />
                   </colgroup>
                   <tbody>

                    <tr>
                       <td class="rent_no">201807250001</td>
                       <td class="book_id">0100000101</td>
                       <td class="book_name">열 세번째 이야기</td>
                       <td class="rent_date">2018-07-25</td>
                       <td class="return_due_date">2018-08-21</td>
                       <td class="rent_status">대출중</td>
                    </tr> 
                   </tbody>
                </table>
                </div>
                </div>

                <div class="btn_wrap">
                   <button class="return_btn">반납</button>
                </div>
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
            $(".sec2 table tbody tr").on("click",function(){
               $(".sec2 form").attr("action","modify");
               $(".sec2 table tbody tr:nth-child(2n-1)").css("background-color","#fff");
               $(".sec2 table tbody tr:nth-child(2n)").css("background-color","#f9f9f9");
               $(this).css("background-color","rgba(77, 155, 184,0.2)");
            })

            $(".sec2 .add_btn").on("click",function(){
               $(".sec2 form").attr("action","add");
               $(".sec2 table tbody tr:nth-child(2n-1)").css("background-color","#fff");
               $(".sec2 table tbody tr:nth-child(2n)").css("background-color","#f9f9f9");
            })
            
            $('#checkUser').on('click',function(){
               
           		$.ajax({    //ajax함수 안에 객체의 형태로 실행명령을 넣는다. 
	               
           			url:'rent_user_check',  //가져오고자하는 서버페이지 주소를 넣는다. 
	                type:'post',  //데이터를 가져온다는 뜻의 get 
	                data: {"user_id" : $("#userId").val()},
	                success : function(data){  
	                	console.log(data.result);
	                	if(data.result == "true"){
	                          alert('연결성공!');
	                	}else{
	                		alert('아이디가 존재하지 않습니다.'); 
	                	}
	                           
	                }, 
	                error : function(){ 
	                	 alert('오류'); 
                 	} 
	                
           	    });   
          });
   
       

         
      })
   </script>
</body>
</html>