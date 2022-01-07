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
<link rel="stylesheet" href="css/cart.css"/>
<script type="text/javascript">

$(function(){
	
	$('.qty-up').click(function(){
		
		var qty = parseInt($(this).siblings('.qtyNumber').val()) + 1;
		var total_id = "#cart-cost-total" + $(this).siblings(".productId").val();
		var total_credit = parseInt($("#order-total").text().split(',').join(""));
		var price = parseInt($(this).siblings(".curPrice").val());
		
		$(this).siblings('.qtyNumber').val(qty);
		
		$.ajax({
			url :"/cart/modifyOptionQty.do",
			type: "post",
		
			data : {
				productId : $(this).siblings(".productId").val(),
				qty	: 1
			},
			dataType : 'json',
			success : function(total){
				$(total_id).val(total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));

				$("#order-total").html((total_credit + price).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
			},
			error :function(){
				alert("서버 요청 실패!")
			}
		});
	});
	$('.qty-down').click(function(){
		
		var qty = parseInt($(this).siblings('.qtyNumber').val()) - 1;
		var total_id = "#cart-cost-total" + $(this).siblings(".productId").val();
		var total_credit = parseInt($("#order-total").text().split(',').join(""));
		var price = parseInt($(this).siblings(".curPrice").val());
		if(qty <= 0) return;
		$(this).siblings('.qtyNumber').val(qty);
		$.ajax({
			url :"/cart/modifyOptionQty.do",
			type: "post",
			data : {
				productId : $(this).siblings(".productId").val(),
				qty	: -1
			},
			dataType : 'json',
			success : function(total){
				$(total_id).val(total.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
				$("#order-total").html((total_credit - price).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
			},
			error :function(){
				alert("서버 요청 실패!")
			}
		});
	});
	
	$('.cart-delete').click(function(){

		$.ajax({
			url :"/cart/deleteProduct.do",
			type: "post",
			data : {
				productId : $(this).children(".productId").val(),
			},
			dataType : 'json',
			success : function(result){
				swal({
					  title: "정상적으로 카트에 삭제되었습니다!",
					  icon: "success",
					  button: "확인",
				});
			},
			error :function(){
				swal({
					  title: "정상적으로 카트에 삭제되었습니다!",
					  icon: "success",
					  button: "확인",
				});
				
				setTimeout(function(){
					location.reload();
				},500);
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
			
				<h2 style="margin-top: 50px;margin-bottom: 50px;">장바구니</h2>

				<div id="store" class="col-md-12">
					<div class="cart-info text-align-center">
						<div class="col-md-6">상품정보</div>
						<div class="col-md-3">옵션</div>
						<div class="col-md-3">상품금액</div>
					</div>
				
					<!-- store products -->
					<div class="row">
						<!-- product -->
						<c:forEach items="${userCartStoreList}" var="userCartStoreList">
						<div class="col-md-6">
							<div class="product col-md-7" style="margin-left:20%;">
								<div class="product-img">
									<img src="${userCartStoreList.imgUrl_1}" alt="product" >
									<div class="product-label">
										<c:if test="${userCartStoreList.sale ne 0}">
											<span class="sale">${userCartStoreList.sale}%</span>
										</c:if>
									</div>
								</div>
								<div class="product-body">
									<h3 class="product-name">${userCartStoreList.productName}</h3>
									<c:choose>
										<c:when test="${userCartStoreList.sale ne 0}">
									       	 <h4 class="product-price"><fmt:formatNumber value="${userCartStoreList.price * (100 - userCartStoreList.sale) / 100}" minFractionDigits="0"/>
											<del class="product-old-price"><fmt:formatNumber value= "${userCartStoreList.price}" /></del></h4>
									    </c:when>
										<c:otherwise>
											<h4 class="product-price"><fmt:formatNumber value= "${userCartStoreList.price}"/></h4>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="qty-label" style="padding-top:50%;">
								Qty
								<div class="input-number">
									<input class="qtyNumber" type="number" value="${userCartStoreList.qty}" readonly>
									<span class="qty-up">+</span>
									<span class="qty-down">-</span>
									<input type="hidden" class="productId" value="${userCartStoreList.productId}"/>
									<input type="hidden" class="curPrice" value="${userCartStoreList.price * (100 - userCartStoreList.sale) / 100}"/>
								</div>
								<div style="padding-top : 30px;">
									<a href="#" class="cart-delete" style="cursor: pointer;">
										<label for="cart-delete"><i class="fas fa-trash"></i></label>
										<input class="cart-delete" value="상품취소" readonly/>
										<input type="hidden" class="productId" value="${userCartStoreList.productId}"/>
									</a>
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div style="padding-top:60%; text-align: center;">
								<h2 id="product-total"><input id="cart-cost-total${userCartStoreList.productId}" style="color:red; width:50%; text-align:center" value="${userCartStoreList.total}" readonly/></h2>
								<a href="/checkoutPage.do?productId=${userCartStoreList.productId}&qty=${userCartStoreList.qty}" style=""class="primary-btn order-submit">주문하기</a>
							</div>
						</div>
						</c:forEach>
						<!-- /product -->
						<div class="col-md-7"></div>
						<div class="col-md-5 order-details">

						<div class="order-summary">
							<div class="order-col">
								<div>Shiping</div>
								<div><strong>EVENT FREE</strong></div>
							</div>
							<div class="order-col">
								<div><strong>TOTAL</strong></div>
								<div><strong id="order-total" class="order-total">${payment_total}</strong></div>
							</div>
						</div>
						<a href="/checkoutPage.do" class="primary-btn order-submit">결제하기</a>
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