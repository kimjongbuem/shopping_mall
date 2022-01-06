<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RePut</title>
</head>
<script type="text/javascript">

	function checkUndisabledSignBtn(password){
		if(password == 1) $("#modifyBtn").removeAttr("disabled");
		else $("#modifyBtn").attr("disabled", true);
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
	<h2 style="text-align: center; margin-top: 20px;">사용자정보 수정하기</h2>
	
	<div class="frame join-frm">
	<article class="card-body" style="max-width: 700px; margin: auto;">
	    <!-- 회원가입 form태그 시작 -->
		<form method="post" action="/user/update.do">
		<div class="form-group input-group fg-x700">
			<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
			 </div>
	        <input name="name" class="form-control" type="text" value="${user.name}" readonly/>
	    </div>
	    <div class="form-group input-group fg-x700">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
			 </div>
	        <input name="email" class="form-control" placeholder="Email 입력" type="email" value="${user.email}"required />
	    </div> <!-- form-group// -->
	    <div class="form-group input-group fg-x700">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
			</div>
	    	<input name="phone" class="form-control" placeholder="휴대폰번호 입력('-' 포함)" value="${user.phone}"type="text" required />
	    </div> <!-- form-group// -->
	    <div class="form-group input-group fg-x700">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
			</div>
			<input name="address" id="Addr" class="form-control" placeholder="주소 입력" type="text" value="${user.address}" required onkeypress="return false;" style="caret-color: transparent !important;" />
			<input type="button" value="주소 검색" onclick="goPopup();" />
		</div> <!-- form-group end.// -->
	    <div class="form-group input-group fg-x700">
	    	<div class="input-group-prepend">
			    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
			</div>
			<input type="password" name="password" id="password" class="form-control" value="" type="text" required />
	   		<font id="checkPassword"></font>
	   		<input type="hidden" id="passwordOk" value=0>
	    </div> <!-- form-group// -->
	    <div class="fg-x700 form-group">
	        <button id="modifyBtn" disabled type="submit" class="btn btn-primary btn-block">회원정보수정하기</button>
	    </div> <!-- form-group// -->      
	</form>
	</article>
	</div> <!-- card.// -->
	<!--container end.//-->
</body>
</html>