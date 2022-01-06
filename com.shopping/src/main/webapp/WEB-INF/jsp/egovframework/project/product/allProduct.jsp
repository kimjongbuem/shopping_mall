<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

<script>
	$(function(){
		
		$('.search').click(function(){

			var chk_arr = [];
			
			var string_url ='';
			
			$("input[name=brand]:checked").each(function(){
				
				string_url += ('companyId=' + $(this).val()+"&");

			});
			
			console.log(chk_arr);
			
			location.href="/checkboxSearch.do?" +string_url;
		
		});
		
		
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
		
		$("#more_btn").click(function(){
			var list_length = $("#more-list .product").length;
			var btn = "#more_btn";
			var call_length = list_length;
			console.log("more_btn check!");
			$.ajax({
				url :"/product/moreProduct.do",
				type: "post",
				data : {viewCount: $("#viewCount")},
				dataType : 'json',
				success : function(data){
					if(data.length < 20){
						$(btn).remove();
					}
					else if(data.length > 0){
						var content = "";
						for(i = 1; i <= data.length; i++){
							
						}
						$("#viewCount").val($("#viewCount").val() + 1);
						$("#more-list").append(content);
					}
				},
				error :function(){
					alert("서버 요청 실패!")
				}
			})
			
			
		});

	});
</script>

<meta charset="UTF-8">
<title>RePut</title>
</head>
<body>
	<input type="hidden" name="viewCount" id="viewCount" value=1>
	<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- ASIDE -->
					<div id="aside" class="col-md-3">
						<div class="aside">
							<h3 class="aside-title">Brand</h3>
							<div class="checkbox-filter">
								<div class="input-checkbox">
									<input name="brand" type="checkbox" id="brand-1" value=1>
									<label for="brand-1">
										<span></span>
										리리걸
									</label>
								</div>
								<div class="input-checkbox">
									<input name="brand" type="checkbox" id="brand-2" value=2>
									<label for="brand-2">
										<span></span>
										코코앤
									</label>
								</div>
								<div class="input-checkbox">
									<input name="brand" type="checkbox" id="brand-3" value=3>
									<label for="brand-3">
										<span></span>
										마이링
									</label>
								</div>
								<div class="input-checkbox">
									<input name="brand" type="checkbox" id="brand-4" value=4>
									<label for="brand-4">
										<span></span>
										그리니
									</label>
								</div>
							</div>
							<input type="button" class="input search" value="검색">
						</div>
					</div>
					<!-- STORE -->
					<div id="store" class="col-md-9">
						<!-- store products -->
						<div id="more-list">
						<div class="row">
							<!-- product -->
							<c:forEach items="${productList}" var="productList">
							<div class="col-md-4 col-xs-6 product">
								<div class="product">
								<a href="/productdetail.do?productId=${productList.productId}">
									<div class="product-img">
										<img src="${productList.imgUrl_1}" alt="product">
										<c:if test="${productList.sale ne 0}">
											<div class="product-label">
												<span class="sale"><fmt:formatNumber value="${productList.sale / 100}" type="percent" /></span>
											</div>
										</c:if>
									</div>
								</a>
							
								<div class="product-body">
									<p class="product-category">${productList20.companyName}</p>
									<h3 class="product-name"><a href="/product/detail.do?productId=${productList.productId}">${productList.productName}</a></h3>
									<h4 class="product-price"><fmt:formatNumber value="${productList.price * (100 - productList.sale) / 100}" minFractionDigits="0"/>
										<c:if test="${productList.sale ne 0}">
											<del class="product-old-price">
												${productList.price}
											</del>
										</c:if>
									</h4>
								</div>
								<div class="add-to-cart">
									<a href="#" data-value="${productList.productId}"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button></a>
								</div>
							</div>
							</div>
							</c:forEach>
							<!-- /product -->
						</div>
						
						<div id="more_btn_div" style="align:center; margin-top : 50px;">
							<input type="button" class="input" id="more_btn" value="더보기" style="">
						</div>
						
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