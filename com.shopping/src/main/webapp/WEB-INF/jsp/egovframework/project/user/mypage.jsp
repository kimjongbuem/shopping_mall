<%@page import="com.sun.xml.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
	<style type='text/css'>
	.primary-btn:hover{
		color : black;
	}
	</style>

<body>
		<!-- container -->
		<div class="container" style="margin-top : 30px;">
			<div style="margin-bottom: 40px;">
				<h3 class="title" style="display: inline-block;">마이페이지</h3>

			</div>	
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="hot-deal">

						<div class="col-md-4 col-xs-6">
							<img src="images/egovframework/delivery.png" alt="kakao">
							<h3>주문/배송조회</h3>
						</div>

						<div class="col-md-4 col-xs-6">
							<img src="images/egovframework/point.png" alt="kakao">
							<h3>포인트</h3>
						</div>

						<div class="col-md-4 col-xs-6">
							<img src="images/egovframework/coupon.png" alt="kakao">
							<h3>쿠폰</h3>
						</div>
						
					</div>
				</div>
			<!-- /row -->
			</div>
			<div style="margin-top: 150px;">
				<a href="/checkUserPassword.do"><input class="primary-btn" style="float: right;" type="button" value="정보수정"></a>
				<a href="/user/logout.do"><input class="primary-btn" style="float: right; margin-right : 20px;" type="button" value="로그아웃"></a>
				<a href="/checkDeletingUser.do"><input class="primary-btn" style="float: right; margin-right : 20px;" type="button" value="회원탈퇴"></a>
			</div>
		</div>
			
	<!-- /container -->
		
</body>
</html>