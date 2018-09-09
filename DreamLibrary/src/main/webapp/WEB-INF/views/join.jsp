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
            						<input type="text" name="user_name" id="userName" placeholder="이름을 입력하세요" required/>
            						<span class="ch"></span>
                           		</p>
                          		<p>
            						<label for="userId">* 아이디</label>
            						<input type="text" name="user_id" id="userId" placeholder="영어와 숫자만 입력가능합니다.(4자이상)" required/>
                          			<span class="ch"></span>
                          		</p>
                          		<p>
            						<label for="userPwd">* 비밀번호</label>
            						<input type="password" name="user_pwd"  id="userPwd" placeholder="4자 이상, 10자 이하의 비밀번호를 입력하세요" required/>
	                            	<span class="ch"></span>
	                            </p>
	                            <p>
            						<label for="userPwd2">* 비밀번호 확인</label>
            						<input type="password" name="adm_check"  id="userPwd2" placeholder="비밀번호를 다시 입력하세요" required/>
	                           		<span class="ch"></span>
	                            </p>
	                            <p>
            						<label for="userBirth">* 생년월일</label>
            						<input type="text" name="user_birth" id="userBirth" placeholder="예) 19900101" required/>
	                            	<span class="ch"></span>
	                            </p>
	                            <p>
            						<label for="userAddr">* 주소</label>
            				 		<input type="text" name="user_addr" id="userAddr" required/>
	                            </p>
	                            <p>
            						<label for="userTel">전화번호</label>
            						<input type="text" name="user_tel" id="userTel"/>
                                </p>
                           <p class="btn-wrap">
                              <input type="submit" value="회원가입하기" id="joinBtn" class="off"/>
                              <input type="button" id="goBack" value="돌아가기" onClick="location.href='index'">
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
   	$(function(){
   		var name,id,pw,pw2,birth;
   		
   		$('input').on('input', function(){
   			if(name==1 && id ==1 && pw==1 && pw2==1 && birth==1){
   				$('#joinBtn').attr('disabled', false).removeClass('off').addClass('on');
   			}else{
   				$('#joinBtn').attr('disabled', true).removeClass('on').addClass('off');
   			} 			
   		});  
   		
   	   $('#userName').on('input', function(){
	   		var inputed = $(this).val();
	   		var $this = $(this);
	   		//var korOnly = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
	   		var completeKor = /^[가-힣]+$/;
	   		
			/* if(korOnly.test(inputedName)){		
				$(this).val("");			
			} */
			
			name = (completeKor.test(inputed) && (inputed.length >= 2)) ? 1 : 0;
			ch($this,name);
			
			
   	   })
   	      	   
   	    $('#userId').on('input', function(){
   	    	
   	    	var inputed = $(this).val();
   	    	var $this = $(this);
   	    	var engOnly = /^[a-z0-9_-]{4,10}$/;
   	    	//var useKor = /^[ㄱ-ㅎ|ㅏ-ㅣ|]+$/;
   	    	
   	    	if(engOnly.test(inputed)){
   	    	 	idch(inputed);  		
   	    	}else{  	    		
   	    		id = 0;
   	    	}
   	    	ch($this,id);
   	    	
   	    });
   	   
   	   
   	   
	   $('#userPwd').on('input', function(){
		    var inputed = $(this).val();
  	    	var $this = $(this);
  	    	var engOnly = /^[a-z0-9_-]{4,10}$/;
  	    	
  	    	pw = (engOnly.test(inputed)) ? 1 : 0;  	
  	    	ch($this,pw);
	   });
   	   
   		$('#userPwd2').on('input', function(){
   		 	var inputedPw = $('#userPwd').val();
	    	var inputedPw2 = $(this).val();
	    	var $this = $(this);

	    	pw2 = (inputedPw === inputedPw2) ? 1 : 0;
	    	ch($this,pw2);
   	
   	   });

   	   
   		$('#userBirth').on('input', function(){
	    	var inputed = $(this).val();
	    	var $this = $(this);
	    	var numOnly = /^(19|20)\d{2}(0[1-9]|1[012])(0[1-9]|[12][0-9]|3[0-1])$/;
	    	
	    	birth = (numOnly.test(inputed)) ? 1 : 0;  
	    	ch($this,birth);
   	   });
   		
   		
   		function ch($this,chParam){
   			if(chParam===1){
   				$($this).parent().find(".ch").css("background-color","#caec9d").text("가능");
   			}else{
   				$($this).parent().find(".ch").css("background-color","#ee8282").text("불가");
   			}
   	   }
   		
   		function idch(inputed){
   	   		$.ajax({    
   		           
   				   url: 'id_check',  
   		           type:'post',  
   		           dataType: 'json',
   		           async: false,
   		           data: { 
   		           		'inputed_id' : inputed
   		           },
   		           success : function(data){	
   		        	   id = (data == '1') ?  1 : 0;
   		           }, 
   		           error : function(data){ 	
   		        	   id = 0;		        	
   		     		}  				           
   			  }); 
   	   	   }
   		
   				
   	   
   	})
   </script>
</body>
</html>