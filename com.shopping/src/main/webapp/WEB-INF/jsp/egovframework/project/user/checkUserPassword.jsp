<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RePut</title>
</head>

<script type="text/javascript">
	$(function(){
		$("#checkBtn").click(function(){
			$.ajax({
				url :"/user/checkUserPassword.do",
				type: "post",
				data : {
					password : $("#password").val()
				},
				dataType : 'json',
				success : function(result){
					
					console.log(result);
					
					if(result === 0){
						alert('비밀번호가 잘못되었습니다.');
						history.back();
					}
					else{
						$("#checkPassword-form").attr('action', '/updateUserPage.do');
						$("#checkPassword-form").attr('method', 'post');
						$("#checkPassword-form").submit();
					}
				},
				error :function(){
					alert("서버 요청 실패!")
				}
			})
		});
	});
</script>

<body>
	<div style="
	display: grid;
  place-items: center;
  min-height: 50vh;">
		<form id="checkPassword-form" style="width:50%;">
		
			<h2 style="margin-bottom : 30px;">수정전 회원확인</h2>
			<div class="form-group input-group fg-x700">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
				<input id="password" name="password" class="form-control" placeholder="비밀번호 입력" type="password" required />
				<button type="submit" id="checkBtn" class="btn btn-primary btn-block">비밀번호 확인</button>
			</div>
		</form>
	</div>
</body>
</html>