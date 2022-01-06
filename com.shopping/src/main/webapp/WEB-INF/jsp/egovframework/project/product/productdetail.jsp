<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" />
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
body {
    background-color: #f7f6f6
}

.card {
    border: none;
    box-shadow: 5px 6px 6px 2px #e9ecef;
    border-radius: 4px
}

.dots {
    height: 4px;
    width: 4px;
    margin-bottom: 2px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block
}

.badge {
    padding: 7px;
    padding-right: 9px;
    padding-left: 16px;
    box-shadow: 5px 6px 6px 2px #e9ecef
}

.user-img {
    margin-top: 4px
}

.check-icon {
    font-size: 17px;
    color: #c3bfbf;
    top: 1px;
    position: relative;
    margin-left: 3px
}

.form-check-input {
    margin-top: 6px;
    margin-left: -24px !important;
    cursor: pointer
}

.form-check-input:focus {
    box-shadow: none
}

.icons i {
    margin-left: 8px
}

.reply {
    margin-left: 12px
}

.reply small {
    color: #b7b4b4;
}

.reply small:hover {
    color: green;
    cursor: pointer
}
smail{
	font-size : 16px;
}
</style>
<title>RePut</title>
</head>
<script type="text/javascript">
	
	$(function(){
		
		$('.add-to-cart>a').click(function(){
			
			var productId = $("#productId").val();
			
			$.ajax({
				url :"/cart/add.do",
				type: "post",
				data : {productId : productId, qty : $('.qtyNumber').val()},
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
		
		$('.qty-up').click(function(){
			var qtyNumber = parseInt($('.qtyNumber').val()) + 1;
			$('.qtyNumber').val(qtyNumber);
			console.log(qtyNumber);
			console.log($('.qtyNumber').val());
		});
		
		$('.qty-down').click(function(){
			var qtyNumber = parseInt($('.qtyNumber').val()) + -1;
			
			if(qtyNumber <= 0) return;
			
			$('.qtyNumber').val(qtyNumber);
		});
		
		$("#fav-add").click(function(){
			
			var productId = $("#productId").val();
			
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
			$(this).siblings("#fav-remove").children('svg').css("display","inline");
		});
		
		$("#fav-remove").click(function(){
			
			var productId = $("#productId").val();
			
			$.ajax({
				url :"/fav/remove.do",
				type: "post",
				data : {productId : productId},
				dataType : 'json'
			});
			
			$(this).children('svg').css("display","none");
			$(this).siblings("#fav-add").children('svg').css("display","inline");
			
		});
		
		$(".reviews-pagination .numOfPage").click(function(){
			
			var reviewPageNumber = parseInt($(this).text());
			
			$.ajax({
				url :"/review/page.do",
				type: "post",
				data : {productId : productId, reviewPageNumber : reviewPageNumber},
				dataType : 'json'
			});
		});
		
	});	
</script>

<body>
<input type="hidden" id="reviewtotalPage" value=1/>
<input type="hidden" id="pageCnt" value=1/>
<input type="hidden" id="qnaPageValue" value=1/>
	<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<!-- Product main img -->
					<div class="col-md-6">
						<div id="product-main-img">
							<div class="product-preview">
								<img src="${product.imgUrl_1}" alt="product-preview">
							</div>
						</div>
					</div>
					<!-- /Product main img -->

					<!-- Product details -->
					
					
					<div class="col-md-6">
						<div class="product-details">
							<h2 class="product-name">${product.productName}</h2>
							<h3> 회사 : ${product.companyName}</h3>
							<div>
								<c:choose>
									<c:when test="${product.sale ne 0}">
								       	 <h3 class="product-price"><fmt:formatNumber value="${product.price * (100 - product.sale) / 100}" minFractionDigits="0"/>
										<del class="product-old-price"><fmt:formatNumber value= "${product.price}" /></del></h3>
								    </c:when>
									<c:otherwise>
										<h3 class="product-price"><fmt:formatNumber value= "${product.price}" /></h3>
									</c:otherwise>
								</c:choose>
								<span class="product-available">In Stock</span>
							</div>
							<p>${product.detail}</p>
							<div class="product-options">
								<label style="display: inline;">
									Size
									<select class="input-select">
										<option value="0">X</option>
									</select>
								</label>
								<label style="display: inline;">
									Color
									<select class="input-select">
										<option value="0">Red</option>
									</select>
								</label>
							</div>

							<div class="add-to-cart">
								<div class="qty-label">
									Qty
									<div class="input-number">
										<input class="qtyNumber" type="number" value=1 readonly>
										<span class="qty-up">+</span>
										<span class="qty-down">-</span>
									</div>
								</div>
								<input type="hidden" id="productId" value="${product.productId}"/>
								<a href="#"><button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button></a>
							</div>

							<a id="fav-add" style="cursor: pointer;">
								<i class="far fa-heart fa-5x"
								<c:if test="${not empty favorite}">
									style="display: none;"
								</c:if>
								>
								</i>
							</a>	
								
							<a id="fav-remove" style="cursor: pointer;">
								<i class="fas fa-heart fa-5x"
								<c:if test="${empty favorite}">
									style="display: none;"
								</c:if>
								>
								</i>
							</a>	
							

						</div>
					</div>
					<!-- /Product details -->

					<!-- Product tab -->
					<div class="col-md-12">
						<div id="product-tab">
							<!-- product tab nav -->
							<ul class="tab-nav">
								<li class="active"><a data-toggle="tab" href="#detail">Details</a></li>
								<li><a id="reviews-tab" data-toggle="tab" href="#reviews">Reviews</a></li>
								<li><a id="qna-tab" data-toggle="tab" href="#qna">Q & A</a></li>
							</ul>

							<!-- product tab content -->
							<div class="tab-content">
								<div id="detail" class="tab-pane fade active in">
									<div class="row">
										<div class="col-md-12">
											<p>${product.detail}</p>
										</div>
									</div>
								</div>
								<div id="reviews" class="tab-pane fade">
										<c:forEach items="${reviews}" var="reviews">
											<div class="card p-3 mt-2" style="height: 75px;">
								              <div class="d-flex justify-content-between align-items-center">
								                  <div class="user d-flex flex-row align-items-center"><span><small class="font-weight-bold text-primary" style="font-size : 20px;">${reviews.name} </small><small class="font-weight-bold" style="font-size : 16px;">${reviews.detail} </small></span> </div> <small>${reviews.createDate}</small>
								              </div>
								              <div class="action d-flex justify-content-between mt-2 align-items-center">
								                  <div class="reply px-4"> 
								                  <c:if test="${reviews.equalId eq true}">
									              <div class="action d-flex justify-content-between mt-2 align-items-center">
									                  <div class="reply px-4"> 
										                  <span class="dots"></span><a href="/review/remove.do?reviewId=${reviews.id}&productId=${product.productId}"><small>Remove</small></a>
										                  <span class="dots"></span><a href="/reviewUpdatePage.do?reviewId=${reviews.id}&userName=${user.name}" id="review-modify"><small>modify</small></a>
										                  <input type="hidden" id="reviewId" value="${reviews.id}" />	
									                  </div>
									              </div>
								              </c:if></div>
								              </div>
								          </div>
										</c:forEach>
										<c:if test="${not empty user}">
											<div class="col-md-12">
												<a href="/reviewWritePage.do?productId=${product.productId}"><input type="button" class="btn btn-primary" value="리뷰 입력" style="margin-top : 30px; float : right; width : 30%;"></a> 
										    </div>
									    </c:if>
									    <ul class="reviews-pagination" style="margin-top : 50px;">
									    	<li style="display:none;"><a class="arrow-left" href="#"><i class="fa fa-angle-left"></i></a></li>
											<li class="active"><a class="numOfPage" href="#">1</a></li>
											<li><a class="numOfPage" href="#">2</a></li>
											<li><a class="numOfPage" href="#">3</a></li>
											<li><a class="numOfPage" href="#">4</a></li>
											<li><a href="#" class="arrow-right"><i class="fa fa-angle-right"></i></a></li>
										</ul>
								</div>
								<!-- qna -->
									<div id="qna" class="tab-pane fade">
										 <div class="">
										<table class="table" style="font-size : 16px;">
											  <thead>
											    <tr>
											      <th scope="col" style="width : 15%;">분류</th>
											      <th scope="col" style="width : 55%;">내용</th>
											      <th scope="col" style="width : 15%;">작성자</th>
											      <th scope="col" style="width : 15%;">작성일</th>
											    </tr>
											  </thead>
											  <tbody>
											    
											<c:forEach items="${qnas}" var="qnas">
											    <c:choose>
												    <c:when test="${not empty qnas.password}">
												    	<tr onClick="location.href='/qnaPasswordPage.do?qnaId=${qnas.id}&userName=${qnas.name}'" style="cursor:pointer;">
													   <td> 
													    <c:choose>
													    	<c:when test="${qnas.optionNo eq 1}">배송문의</c:when>		
															<c:when test="${qnas.optionNo eq 2}">상품문의</c:when>	
															<c:otherwise>기타</c:otherwise>
													    </c:choose>
												       </td>
												      <td><i class="fas fa-lock"></i>비밀글입니다!</td>
							
												      <td>${qnas.name}</td>
												      <td>${qnas.createDate}</td>
												       </tr>
												    </c:when>
											    	<c:otherwise>
											    		<tr onclick="location.href='/qnaDetailPage.do?qnaId=${qnas.id}&userName=${qnas.name}'" style="cursor:pointer;">
														   <td> 
														    <c:choose>
														    	<c:when test="${qnas.optionNo eq 1}">배송문의</c:when>		
																<c:when test="${qnas.optionNo eq 2}">상품문의</c:when>	
																<c:otherwise>기타</c:otherwise>
														    </c:choose>
													       </td>
													       <td>${qnas.detail}</td>
													       <td>${qnas.name}</td>
													       <td>${qnas.createDate}</td>
													    </tr>
											    	</c:otherwise>
											    </c:choose>
											   </c:forEach> 
											  </tbody>
											</table>
									    	<c:if test="${not empty user}">
												<div class="col-md-12">
													<a href="/qnaWritePage.do?productId=${product.productId}"><input type="button" class="btn btn-primary" value="질문 등록" style="margin-top : 30px; float : right; width : 30%;"></a> 
											    </div>
							    			</c:if>
									    <ul class="reviews-pagination" style="margin-top : 50px;">
											<li class="active">1</li>
											<li><a href="#">2</a></li>
											<li><a href="#">3</a></li>
											<li><a href="#">4</a></li>
											<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
										</ul>
								</div>
								</div>
							</div>
						</div>
						</div>	
					</div>
					<!-- /product tab -->
				</div>
			</div>
				<!-- /row -->
		<!-- /SECTION -->
</body>
</html>