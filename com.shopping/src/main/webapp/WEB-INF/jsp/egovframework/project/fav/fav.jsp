<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RePut</title>
</head>
<style type="text/css">
.fav-info>div{
	height : 50px;
	line-height: 50px;
	color :black;
	font-weight: bold;
	font-size: 24px;
	border-top: 2px solid #B1B1B1;
	border-bottom: 2px solid #B1B1B1;
}
</style>
<script>
	$(function(){
		$(".fav-add").click(function(){
			
			var productId = $(this).siblings('.fav-input').val();
			
			$.ajax({
				url :"/fav/add.do",
				type: "post",
				data : {productId : productId},
				dataType : 'json',
				success : function(result){
					if(result == 0){
						alert('로그인 후 이용 가능합니다!');
						location.href= "/mypage.do";
					}
					else{
						swal({
							  title: "^^ 상품이 찜 되었습니다!",
							  icon: "success",
							  button: "확인",
						});
					}
				},
				error :function(){
					alert("서버 요청 실패!")
				}
			});
			
			$(this).children('svg').css("display","none");
			$(this).siblings(".fav-remove").children('svg').css("display","inline");
		});
	
		$(".fav-remove").click(function(){
			
			var productId = $(this).siblings('.fav-input').val();

			$.ajax({
				url :"/fav/remove.do",
				type: "post",
				data : {productId : productId},
				dataType : 'json'
			});
			
			$(this).children('svg').css("display","none");
			$(this).siblings(".fav-add").children('svg').css("display","inline");
			
		});
	});
</script>

<body>
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
			
				<h2 style="margin-top: 50px;margin-bottom: 50px;">찜한 상품</h2>

				<div id="store" class="col-md-12">
					<div class="fav-info" style="text-align: center;">
						<div class="col-md-6">상품정보</div>
						<div class="col-md-2"></div>
						<div class="col-md-4">상품금액</div>
					</div>
				
					<!-- store products -->
					<div class="row" class="col-md-12" style="text-align: center;">
						<!-- product -->
						<c:forEach items="${userFavStoreList}" var="userFavStoreList">
						<div class="col-md-6" style="margin-top:30px;">
							<div>
								<div class="product-img">
									<a href="/productdetail.do?productId=${userFavStoreList.productId}">
										<img src="${userFavStoreList.imgUrl_1}" alt="product">
									</a>
									<h6 class="product-name">${userFavStoreList.productName}</h6>
								</div>
							</div>
						</div>
						<div class="col-md-2">
							<div style="margin-top:50%;">
								<a class="fav-remove" style="cursor: pointer;"><i class="fas fa-heart fa-5x"></i></a>
								<a class="fav-add" style="cursor: pointer;"><i class="far fa-heart fa-5x" style="display:none;"></i></a>
								<input type="hidden" class="fav-input" name="productId" value="${userFavStoreList.productId}">
							</div>
						</div>
						<div class="col-md-4">
							<div style="margin-top:30%;">
							<c:choose>
								<c:when test="${userFavStoreList.sale ne 0}">
							       	 <h4 class="product-price"><fmt:formatNumber value="${userFavStoreList.price * (100 - userFavStoreList.sale) / 100}" minFractionDigits="0"/>
									<del class="product-old-price"><fmt:formatNumber value= "${userFavStoreList.price}" /></del></h4>
							    </c:when>
								<c:otherwise>
									<h4 class="product-price"><fmt:formatNumber value= "${userFavStoreList.price}"/></h4>
								</c:otherwise>
							</c:choose>
							</div>
						</div>
						</c:forEach>
						<!-- /product -->
					</div>
					<!-- /Order Details -->
					</div>
					<!-- /store products -->
				</div>
				
				<!-- /STORE -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
</body>
</html>