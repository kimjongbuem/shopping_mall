<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RePut</title>
</head>

<script>
	function goPopup(){
	    var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	}
	function jusoCallBack(roadFullAddr){
		$("#Addr").val(roadFullAddr);
	}
	
	function checkUndisabledSignBtn(id, password){
		if(id == 1 && password == 1) $("#signBtn").removeAttr("disabled");
		else $("#signBtn").attr("disabled", true);
	}
	
	$(function(){
		$("#userid").focusout(function(){
			let userid = $("#userid").val();
			$.ajax({
				url :"/user/checkId.do",
				type: "post",
				data : {userid : userid},
				dataType : 'json',
				success : function(result){
					
					console.log(result);
					
					if(result == 0){
						$("#checkId").html('이미 있는 아이디입니다.');
						$("#checkId").attr('color', 'red');
						$("#idOk").val(0)
					}
					else if(result == 1){
						$("#checkId").html('아이디는 최소 6글자여야 합니다.');
						$("#checkId").attr('color', 'red');
						$("#idOk").val(0)
					}
					else if(result == 2){
						$("#checkId").html('아이디는 첫글자는 영어여야 합니다.');
						$("#checkId").attr('color', 'red');
						$("#idOk").val(0);
					}
					else{
						$("#checkId").html('사용할 수 있는 아이디 입니다.');
						$("#checkId").attr('color', 'green');
						$("#idOk").val(1);
					}
					checkUndisabledSignBtn($("#idOk").val(), $("#passwordOk").val());
				},
				error :function(){
					alert("서버 요청 실패!")
				}
			})
		});
		
		$("#password").focusout(function(){
			let password = $("#password").val();
			console.log(userid);
			$.ajax({
				url :"/user/checkPassword.do",
				type: "post",
				data : {password : password},
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
					checkUndisabledSignBtn($("#idOk").val(), $("#passwordOk").val());
				},
				error :function(){
					alert("서버 요청 실패!")
				}
			})
		});	
	});
</script>

<body>
	<h2 style="text-align: center; margin-top: 20px;">사용자정보 입력하기</h2>

<div class="frame join-frm">
<article class="card-body" style="max-width: 700px; margin: auto;">
	<input id="idOk" value=0 type="hidden">
	<input id="passwordOk" value=0 type="hidden">
    <!-- 회원가입 form태그 시작 -->
	<form method="post" action="/user/create.do">
	<input type="hidden" name="login" value="2"/>
	<div class="form-group input-group fg-x700">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="name" class="form-control" type="text" placeholder="이름 입력" required/>
    </div>
    <div class="form-group input-group fg-x700">
		<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
		 </div>
        <input name="userid" id="userid"class="form-control" type="text" placeholder="id 입력" required/>
    	<font id="checkId"></font>
    </div>
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
		 </div>
        <input name="email" class="form-control" placeholder="Email 입력" type="email" required />
    </div> <!-- form-group// -->
    <div class="form-group input-group fg-x700">
    	<div class="input-group-prepend">
		    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
		</div>
    	<input name="phone" class="form-control" placeholder="휴대폰번호 입력('-' 포함)" type="text" required />
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
        <font id="checkPassword"></font>
    </div> <!-- form-group// -->
    <div class="fg-x700 form-group">
        <button type="submit" id="signBtn" class="btn btn-primary btn-block" disabled>회원가입 </button>
    </div> <!-- form-group// -->      
</form>
</article>
</div> <!-- card.// -->
<!--container end.//-->
	
</body>
</html>

