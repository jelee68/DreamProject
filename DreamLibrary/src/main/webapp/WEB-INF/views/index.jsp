<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         <h1><a href="">Dream Library</a></h1>
         <dl class="top-menu">
            <dt class="hide">상위메뉴</dt>
            <dd><a href="login">login</a>|</dd>
            <dd><a href="join">join</a></dd>
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
                     <li><a href="book_search">자료검색</a></li>
                     <li><a href="">신간도서</a></li>
                     <li><a href="my_history">내 서재</a></li>
                     <li><a href="book_manager">도서등록</a></li>
                     <li><a href="rent_manager">대출관리</a></li>
                  </ul>
            </section>

            <section class="sec3">
                  <p>
                  <strong> 신착 도서</strong>
                  <em>new books</em></p>
               <ul class="list cf">
   					<li><a href="#">
   							<img src="resources/images/main/list0.jpg" alt="추천도서1" />
   							<strong>여행에 나이가 어딨어?</strong>

   							</a>
   						</li>
   					<li>
                     <a href="#">
   							<img src="resources/images/main/list1.jpg" alt="추천도서2" />
   							<strong>상처받지 않는 삶</strong>

   						</a>
                  </li>
   					<li>
                     <a href="#">
   							<img src="resources/images/main/list2.jpg" alt="추천도서3" />
   							<strong>다시, 시로 숨 쉬고 싶은 그대에게</strong>

   						</a>
                  </li>
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