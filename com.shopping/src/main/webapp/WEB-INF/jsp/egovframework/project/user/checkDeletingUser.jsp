<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RePut</title>
</head>

<script>
	$(function(){
		$("#checkRequired").click(function(){
			console.log($("#deleteBtn").attr("disabled"))
			
			if($("#deleteBtn").attr("disabled") == "disabled") {
				$("#deleteBtn").removeAttr("disabled");
			}
			else {
				$("#deleteBtn").attr("disabled", "disabled");
			}
		});
	});
</script>

<body>
	<div style="margin-top : 20px; margin-left : 30%;">
		<div>
			<h2 style="margin-bottom : 10px;">마지막으로<br>꼭 확인해 주세요!</h2>
			<p>중요한 내용이니 탈퇴전 유심히 읽어주세요!</p>
			<ul style="margin-top : 30px;">
				<li>*보유하고 있던 포인트, 할인 쿠폰, 배송정보, 구매 이력등은 모두 소멸되고 복구가 불가능합니다.</li>
				<li>*연동된 SNS 계정이 있는 경우 함께 탈퇴됩니다.</li>
				<li>*탈퇴 후 브랜디에 입력하신 상품 문의 및 후기, 댓글은 삭제되지 않으며,<br>
					회원정보 삭제로 인해 작성자 본인을 확인할 수 없어 편집 및 삭제 처리가 원천적으로 불가능합니다.<br>
					문의, 후기, 댓글 삭제를 원하시는 경우에는 먼저 해당 게시물을 삭제하신 후 탈퇴를 신청해 주시길 바랍니다.</li>
			</ul>
		</div>		
		<div style="margin-top : 30px;">
			<input type="checkbox" id="checkRequired" style="">
			<label for="checkRequired"><span style="color:red">(필수)</span>위 내용을 확인하였습니다.</label>
			<a href="/user/delete.do"><input id="deleteBtn" class="primary-btn" style="margin-top : 30px;" type="button" value="서비스탈퇴" disabled></a>		
		</div>
	</div>
</body>
</html>