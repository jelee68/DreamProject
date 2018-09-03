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
 <%@ include file="include/header.jsp" %>

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
                              <dt>연락처</dt><dd class="user_tel"></dd>
                              <dt>주소</dt><dd class="user_addr"></dd>
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
                           <input type="text" name="book_id" id="bookId"/>
                           <input type="button" name="" value="조회" id="checkBook">
                        </p>

                        <dl class="book_info">
                           <dt>서명</dt><dd class="book_name"></dd>
                           <dt>저자</dt><dd class="book_author"></dd>
                           <dt>출판일</dt><dd class="book_date"></dd>
                           <dt>출판사</dt><dd class="book_pub"></dd>
                        </dl>
                        <input type="button" name="" value="대출" id="rentBtn">
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

                   <!--  <tr>
                       <td class="rent_no"></td>
                       <td class="book_id"></td>
                       <td class="book_name"></td>
                       <td class="book_rent_date"></td>
                       <td class="book_re_due_date"></td>
                       <td class="book_status"></td>
                    </tr>  -->
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
    	  
    	  $(document).on('keydown',function(e){
    		  if (e.keyCode === 13) {
  		        e.preventDefault();
  		    }
    	  })
         //
         	var bookId;
    	    var rentNo; 
            $(".sec2 .rent_list").on("click",'tr',function(){
               $(".sec2 .rent_list tbody tr:nth-child(2n-1)").css("background-color","#fff");
               $(".sec2 .rent_list tbody tr:nth-child(2n)").css("background-color","#f9f9f9");
               $(this).css("background-color","rgba(77, 155, 184,0.2)");
               bookId = $(">.book_id", this).text();
               rentNo = $(">.rent_no", this).text(); 
            })

            $(".sec2 .add_btn").on("click",function(){
               $(".sec2 form").attr("action","add");
               $(".sec2 table tbody tr:nth-child(2n-1)").css("background-color","#fff");
               $(".sec2 table tbody tr:nth-child(2n)").css("background-color","#f9f9f9");
            })
            
            $('#checkUser').on('click',function(){
            	var checkBtn  = $(this).attr('id');
            	check(checkBtn);
            	   
          	});
         
            $('#checkBook').on('click',function(){
            	var checkBtn  = $(this).attr('id');
            	check(checkBtn);
          	});
            
            $('#rentBtn').on('click', function(){
            	$.ajax({    
 	               
        			url: 'book_rent',  
	                type:'post',  
	                dataType: 'json',
	                data: { 
	                		'user_id' : $('#userId').val(),
	                		'book_id' : $('#bookId').val()
	                	  },
	                success : function(data){ 
	                	
	                	alert(data.ms);
	                	check('user');
	                	
	                }, 
	                error : function(data){ 
	                	alert(data.ms); 
              		},
              	
	                
        	  });
            });
            
            $(".return_btn").on("click",function(){
     
            	$.ajax({    
  	               
        			url: 'book_return',  
	                type:'post',  
	                dataType: 'json',
	                data: { 'book_id' : bookId,
	                		'rent_no' : rentNo
	                	  },
	                success : function(data){ 
	                	
	                	alert(data.ms);
	                	check('user');
	                	
	                }, 
	                error : function(data){ 
	                	alert(data.ms); 
              		},
              	
	                
        	  });
            })
   
       ////////////
			function check(checkBtn){
            	
             	var checkName = checkBtn.replace("check","").toLowerCase();
            		$.ajax({    
    	               
            			url:'rent_'+checkName+'_check',  
    	                type:'post',  
    	                dataType: 'json',
    	                data: { [checkName+'_id'] : $('#'+checkName+'Id').val()},
    	                success : function(data){  
    	                	
    	                	var className="";
    	                	
    	                	 if(checkName == "book"){
    	                		var i = 0;
	    	                	while( i < $("."+checkName+"_info dd").length){
	    	                		 className = $("."+checkName+"_info dd:eq("+i+")").attr('class');
	    	                		 $("dd."+className).text(data[className]);
	    	       					 i++;
	    	                	}
    	                	}else if(checkName == "user"){
    	                		var i = 0;
    	                		while( i < $("."+checkName+"_info dd").length){
	    	                		 className = $("."+checkName+"_info dd:eq("+i+")").attr('class');
	    	                		 $("dd."+className).text(data[checkName+"Info"][className]);
	    	       					 i++;
	    	                	}
    	                		
    	                		$('.rent_list tr').remove();
    	                		
    	                		for(var j=0; j<data.rentList.length ; j++){
    	                			var tr =  $('<tr>');
    	                			$(".rent_list").append(tr);
    	                			var str = "date";
    	                			for ( keyName in data.rentList[j] ) {
    
    	                				var td = $('<td>').addClass(keyName).text(data.rentList[j][keyName]);
    	                				$(".rent_list tr:eq("+j+")").append(td); 
    	                				
    	                			}
    	                		}    		
    	                	}    	                	
    	                }, 
    	                error : function(){ 
    	                	 alert('없음'); 
                  	} 
    	                
            	  });
             }
      ////////////
         
      })
   </script>
</body>
</html>