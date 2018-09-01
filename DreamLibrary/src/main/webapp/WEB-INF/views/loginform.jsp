<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 <%@ include file="include/header.jsp" %>

   <div id="container">
      <div id="login">
         <div class="inner-1280">  
         <c:if test="${param.ng != null}">
			<p>
				LogIn NG!! <br />
				<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != NULL}">
					message : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
				</c:if>
			</p>
		 </c:if>
            <div class="login-wrap">
            <article class="login-box">
                  <h2>Login</h2>
                  <p>아이디가 없으신가요? <a href="join">회원가입</a></p>

                  <form action="j_spring_security_check.action" method="post">
                     <fieldset>
                        <legend class="hide">로그인하기</legend>

                        <p>
                           <label for="userId">아이디</label>
                           <input type="text" name="j_username" id="userId" required/>
                        </p>
                        <p>
                           <label for="userPwd">비밀번호</label>
                           <input type="password" name="j_password" id="userPwd" required/>
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
   <script type="text/javascript">

   </script>
</body>
</html>