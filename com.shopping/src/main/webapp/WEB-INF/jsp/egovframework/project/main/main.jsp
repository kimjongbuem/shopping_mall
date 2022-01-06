<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>패션 몰 Reput</title>
</head>

<script>
	$(function(){
		$('.add-to-cart>a').click(function(){
			console.log($(this).data('value'));
			$.ajax({
				url :"/cart/add.do",
				type: "post",
				data : {productId : $(this).data('value')},
				dataType : 'json',
				success : function(result){
					if(result == 0){
						alert('로그인 후 이용 가능합니다!');
						location.href= "/mypage.do";
					}
					else{
						swal({
							  title: "정상적으로 카트에 저장되었습니다!",
							  icon: "success",
							  button: "확인",
						});
					}
				},
				error :function(){
					alert("서버 요청 실패!")
				}
			});
		});
	});
</script>

<body>
	<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<div class="col-md-12">
						<div class="section-title text-center">
							<h3 class="title">오늘 이 상품은 어때요?</h3>
						</div>
					</div>

					<!-- product -->
					<c:forEach items="${productList8}" var="productList8">
						<div class="col-md-3 col-xs-6">
							<div class="product">
								<a href="/productdetail.do?productId=${productList8.productId}">
									<div class="product-img">
										<img src="${productList8.imgUrl_1}" alt="product">
										<c:if test="${productList8.sale ne 0}">
											<div class="product-label">
												<span class="sale"><fmt:formatNumber value="${productList8.sale / 100}" type="percent" /></span>
											</div>
										</c:if>
									</div>
								</a>
							
								<div class="product-body">
									<p class="product-category">${productList8.companyName}</p>
									<h3 class="product-name"><a href="/product/detail.do?productId=${productList8.productId}">${productList8.productName}</a></h3>
									<h4 class="product-price"><fmt:formatNumber value="${productList8.price * (100 - productList8.sale) / 100}" minFractionDigits="0"/>
										<c:if test="${productList8.sale ne 0}">
											<del class="product-old-price">
												${productList8.price}
											</del>
										</c:if>
									</h4>
								</div>
								<div class="add-to-cart">
									<a href="#" data-value="${productList8.productId}"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button></a>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- /product -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /Section -->
</body>
</html>