// JavaScript Document

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