<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="s" %>

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