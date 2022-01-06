<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RePut</title>
</head>

<script>
$(function(){
	IMP.init('imp67462374');
});
function request_to_check(userId, productId, total_price, email, name, phone, address) {
	IMP.request_pay({
	    pg : 'inicis',
	    pay_method : 'card',
	    merchant_uid : userId + '_' + new Date().getTime(),
	    name : '주문명:결제테스트',
	    amount : total_price,
	    buyer_email : email,
	    buyer_name : name,
	    buyer_tel : phone,
	    buyer_addr : address
	}, function(rsp) {
	    if ( rsp.success ) {
    	
    		$.ajax({
    			type: "get",
    			url: "/cart/deleteProduct.do?productId="+productId
    		})

	        var impTitle = '결제가 완료되었습니다.';
	        var impMsg = '고유ID : ' + rsp.imp_uid;
	        impMsg += '상점 거래ID : ' + rsp.merchant_uid;
	        impMsg += '결제 금액 : ' + rsp.paid_amount;
	        impMsg += '카드 승인번호 : ' + rsp.apply_num;

	        Swal.fire({
				title: impTitle,
				text: impMsg,
				icon: 'success',
				timer: 2000,
				timerProgressbar: true,
				willClose: () => {
					clearInterval(timerInterval)
				}
			}).then(() => {
				location.href='/home.do';
			})
	    } else {
	        var impTitle = '결제에 실패하였습니다.';
	        var impMsg = rsp.error_msg;
	        
	        Swal.fire({
				title: impTitle,
				text: impMsg,
				icon: 'error',
				timer: 2000,
				timerProgressbar: true,
				willClose: () => {
					clearInterval(timerInterval)
				}
			}).then(() => {
				history.back();
			})
	    }
	});
};

</script>

<link rel="stylesheet" href="css/checkout.css"/>
<body>
	
	<div class="container">
		<h2 class="title" style="margin-top: 80px;margin-bottom: 30px;">주문하기</h2>
		<div class="data col-md-12 info">
			<h3>주문상품 정보</h3>
			<div class="content">
				<div class="col-md-4">${product.companyName}</div>
				<div class="col-md-4">쿠폰 적용</div>
				<div class="col-md-4">금액</div>
			</div>
			<div>
				<div class="col-md-4" style="padding-top: 20px;">
					<img src="${product.imgUrl_1}" style="width:80px;" alt="product-img">
					<h5 style="display : inline;">${product.productName}</h5>
				</div>
				<div class="col-md-4" style="height:150px; line-height: 100px;">적용할 쿠폰이 없습니다.</div>
				<div class="col-md-4" style="color:red; height:150px; line-height: 100px;"><fmt:formatNumber value= "${payment_total}"/></div>
			</div>
		</div>
		<div class="data user-info col-md-12">
			<h3>주문자 정보</h3>
			<div class="col-md-12 content info">
				<div class="col-md-2">이름</div>
				<div class="col-md-10">${user.name}</div> 
			</div>
			<div class="col-md-12 content info">
				<div class="col-md-2">휴대폰</div>
				<div class="col-md-10">${user.phone}</div> 
			</div>
			<div class="col-md-12 content info">
				<div class="col-md-2">이메일</div>
				<div class="col-md-10">${user.email}</div> 
			</div>
		</div>
		<div class="data ship-info col-md-12">
			<h3>배송지 정보</h3>
			<div class="col-md-12 content info">
				<div class="col-md-2">수령인</div>
				<div class="col-md-10">${user.name}</div> 
			</div>
			<div class="col-md-12 content info">
				<div class="col-md-2">휴대폰</div>
				<div class="col-md-10">${user.phone}</div> 
			</div>
			<div class="col-md-12 content info">
				<div class="col-md-2">배송주소</div>
				<div class="col-md-10">${user.address}</div> 
			</div>
		</div>
		
		<div class="col-md-12 data order-details">
	
			<div class="order-summary">
				<div class="order-col">
					<div>Shiping</div>
					<div><strong>EVENT FREE</strong></div>
				</div>
				<div class="order-col">
					<div><strong>TOTAL</strong></div>
					<div><strong id="order-total" class="order-total"><fmt:formatNumber value= "${payment_total}"/></strong></div>
				</div>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<a href="#" onclick="request_to_check('${user.id}', '${product.productId}','${payment_total}', '${user.email}', '${user.name}','${user.phone}' ,'${user.address}')" class="primary-btn order-submit">결제하기</a>
			</div>
			
		</div>
	</div>
</body>
</html>