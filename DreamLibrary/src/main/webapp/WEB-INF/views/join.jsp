<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>회원가입 | 드림도서관</title>
	<link rel="stylesheet" href="resources/css/import.css" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
</head>
<body>
 <%@ include file="include/header.jsp" %>

   <div id="container">
      <div id="join">
         <div class="inner-1280">
            <div class="join-wrap">
               <article class="join-box">
                     <h2>Join Dream Library</h2>
                     <p>이미 아이디가 있으신가요? <a href="login">로그인</a></p>

                     <form action="join_add" method="post">
                        <fieldset>
                           <legend class="hide">회원가입하기</legend>
            					<p>
            						<label for="userName">* 이름</label>
            						<input type="text" name="user_name" value="" id="userName" placeholder="이름을 입력하세요"/ required><span class="ch">가능</span>
                           </p>
                           <p>
            						<label for="userId">* 아이디</label>
            						<input type="text" name="user_id" value="" id="userId" placeholder="영어로 이루어진 아이디를 입력하세요"/>
                           </p>
                           <p>
            						<label for="userPwd">* 비밀번호</label>
            						<input type="password" name="user_pwd" value="" id="userPwd" placeholder="4자 이상, 20자 이하의 비밀번호를 입력하세요"/>
                           </p>
                           <p>
            						<label for="userPwd2">* 비밀번호 확인</label>
            						<input type="password" name="adm_check" value="" id="userPwd2" placeholder="비밀번호를 다시 입력하세요"/>
                           </p>
                           <p>
            						<label for="userBirth">* 생년월일</label>
            						<input type="text" name="user_birth" value="" id="userBirth" placeholder="예) 19900101"/>
                           </p>
                           <p>
            						<label for="userAddr">주소</label>
            						<input type="text" name="user_addr" value="" id="userAddr"/>
                           </p>
                           <p>
            						<label for="userTel">전화번호</label>
            						<input type="text" name="user_tel" value="" id="userTel"/>
                           </p>
                           <p class="btn-wrap">
                              <input type="submit" value="회원가입하기" id="joinBtn"/>
                              <input type="button" id="goBack" value="돌아가기">
                           </p>
                        </fieldset>
                     </form>
               </article>
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