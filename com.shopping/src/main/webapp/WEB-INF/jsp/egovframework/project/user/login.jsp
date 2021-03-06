<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" language="java"%>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>

<%
    String clientId = "d4BcRxztvP9WnHjtDwh5";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/naver_oauth.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>


<script type="text/javascript">
$(function(){
	$("#signBtn").click(function(){
		let userid = $("#userid").val();
		let password = $("#password").val();

		$.ajax({
			url :"/user/loginCheck.do",
			type: "post",
			data : {
				userid : userid,
				password : password,
			},
			dataType : 'json',
			success : function(result){
				if(result == 0){
					alert('아이디 혹은 비밀번호가 잘못되었습니다.')
				}
				else{
					$("#sign-form").attr('action', '/user/login.do');
					$("#sign-form").attr('method', 'post');
					$("#sign-form").submit();
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

	<div class="limiter">
		<div class="container-login100">
			
			<div class="greeting">
				<h1 style="margin-bottom: 20px;">
				안녕하세요 :)<br>
				RePut입니다!
				</h1>
				<p>네이버 카카오로도 로그인이 가능합니다.</p>
			</div>
		
			<div class="wrap-login100 p-l-110 p-r-110 p-t-62 p-b-33">
				<form id="sign-form" action="" class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-53">
						Sign In With
					</span>

					<a href="https://kauth.kakao.com/oauth/authorize?client_id=7db2d9e7eeee1cd77fb3bb5eed95e3a8&redirect_uri=http://localhost:8080/oauth_kakao.do&response_type=code" class="">
						<img src="images/egovframework/kakao_login.png" alt="kakao">
					</a>

					<a href="<%=apiURL%>" class="">
						<img src="images/egovframework/naver_login.png" alt="naver">
					</a>
					
					<div class="p-t-31 p-b-9">
						<span class="txt1">
							UserId
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Username is required">
						<input class="input100" type="text" name="userid" id="userid" required>
						<span class="focus-input100"></span>
					</div>
					
					<div class="p-t-13 p-b-9">
						<span class="txt1">
							Password
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="password" id="password" required>
						<span class="focus-input100"></span>
					</div>

					<div class="container-login100-form-btn m-t-17">
						<button type="submit" id="signBtn" class="login100-form-btn">
								Sign In
						</button>
					</div>

					<div class="w-full text-center p-t-55">
						<span class="txt2">
							Not a member?
						</span>

						<a href="/sign.do" class="txt2 bo1">
							Sign up now
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div id="dropDownSelect1"></div>
	
	</body>
</html>