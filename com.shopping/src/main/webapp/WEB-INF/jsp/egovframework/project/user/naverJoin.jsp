<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>
</head>

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function goPopup(){
	    var pop = window.open("/shop/user/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr){
		$("#Addr").val(roadFullAddr);
	}
	
	function checkUndisabledSignBtn(password){
		if(password == 1) $("#kakaoBtn").removeAttr("disabled");
		else $("#kakaoBtn").attr("kakaoBtn", true);
	}
	
	$(function(){
		$("#password").focusout(function(){
			$.ajax({
				url :"/user/checkPassword.do",
				type: "post",
				data : {password : $("#password").val()},
				dataType : 'json',
				success : function(result){
					if(result == 0){
						$("#checkPassword").html('최소 비밀번호는 8글자 이상이여야 합니다.');
						$("#checkPassword").attr('color', 'red');
						$("#passwordOk").val(0);
					}
					else{
						$("#checkPassword").html('사용가능한 비밀번호 입니다.');
						$("#checkPassword").attr('color', 'green');
						$("#passwordOk").val(1);
					}
					checkUndisabledSignBtn($("#passwordOk").val());
				},
				error :function(){
					alert("서버 요청 실패!")
				}
			})
		});
	});
</script>

<body>
	<h2 style="text-align: center; margin-top: 20px;">추가정보 입력하기</h2>

<div class="frame join-frm">
<article class="card-body" style="max-width: 700px; margin: auto;">
    <!-- 회원가입 form태그 시작 -->
	<form method="post" action="/user/create.do">
	<input type="hidden" name="login" value="1"/>
	<input type="hidden" name="naverId" value="${naverId}" />
	<div class="form-group input-group fg-x700">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="name" class="form-control" type="text" value="${name}" readonly/>
    </div> <!-- form-group// -->
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="email" class="form-control" type="email" value="${email}" readonly />
    </div> <!-- form-group// -->
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
    	<input name="phone" class="form-control" value="${mobile}" type="text"/>
    </div> <!-- form-group// -->
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
		</div>
		<input name="address" id="Addr" class="form-control" placeholder="주소 입력" type="text" required onkeypress="return false;" style="caret-color: transparent !important;" />
		<input type="button" value="주소 검색" onclick="goPopup();" />
	</div> <!-- form-group end.// -->
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
		</div>
        <input name="password" id="password" class="form-control" placeholder="비밀번호 입력" type="password" required />
        <input type="hidden" id="passwordOk" value=0/>
        <font id="checkPassword"></font>
    </div> <!-- form-group// -->
    <div class="fg-x700 form-group">
        <button type="submit" id="navetBtn" class="btn btn-primary btn-block" disabled> 네이버로 회원가입 </button>
    </div> <!-- form-group// -->      
</form>
</article>
</div> <!-- card.// -->
<!--container end.//-->
	
</body>
</html>

