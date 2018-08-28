<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>로그인 | 드림도서관</title>
	<link rel="stylesheet" href="resources/css/import.css" type="text/css"/>
	<link href="https://fonts.googleapis.com/css?family=Patua+One" rel="stylesheet">
</head>
<body>
<header id="header">
      <div class="inner-1280">
         <h1><a href="/index">Dream Library</a></h1>
         <dl class="top-menu">
            <dt class="hide">상위메뉴</dt>
            <dd><a href="login">login</a>|</dd>
            <dd><a href="join">join</a></dd>
         </dl>
      </div>
   </header>

   <div id="container">
      <div id="login">
         <div class="inner-1280">
            <div class="login-wrap">
            <article class="login-box">
                  <h2>Login</h2>
                  <p>아이디가 없으신가요? <a href="join.html">회원가입</a></p>

                  <form action="login" method="post">
                     <fieldset>
                        <legend class="hide">로그인하기</legend>

                        <p>
                           <label for="userId">아이디</label>
                           <input type="text" name="user_id" value="${join.user_id}" id="userId" required/>
                        </p>
                        <p>
                           <label for="userPwd">비밀번호</label>
                           <input type="password" name="user_pwd" value="${join.user_pwd}" id="userPwd"/>
                        </p>

                        <p class="btn-wrap">
                           <input type="submit" value="로그인하기" id="loginBtn"/>
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
   <script type="text/javascript"> </script>
   
</body>
</html>