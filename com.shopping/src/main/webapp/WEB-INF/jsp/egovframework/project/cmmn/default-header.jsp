<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%
	request.setAttribute("id",session.getAttribute("id"));
	session.setAttribute("id", session.getAttribute("id"));
%>
<script>
	$(function(){
		$(".search-btn").click(function(){
			let searchSelectValue = $(".input-select").val();
			let searchValue = $("#search").val();
			$("#search-form").attr("action", "/search.do?searchSelectValue="+ searchSelectValue +"&searchValue="+searchValue);
		});
	});
</script>

<!-- header -->
<script src="js/header.js"></script>
<link rel="stylesheet" href="css/egovframework/header.css">
	<header>
		<!-- MAIN HEADER -->
			<div id="header">
				<!-- container -->
				<div class="container">
					<!-- row -->
					<div class="row">
						<!-- LOGO -->
						<div class="col-md-2">
							<div class="header-logo">
								<a href="/home.do" class="logo">
									<img src="images/egovframework/logo1.png" alt="logo">
								</a>
							</div>
						</div>
						<!-- /LOGO -->

						<!-- SEARCH BAR -->
						<div class="col-md-6" style="margin-top: 10px;">
							<div class="header-search">
								<form id="search-form" method="post">
									<select class="input-select">
										<option value="product" selected>Product Name</option>
										<option value="company">Company Name</option>
									</select>
									<input class="input" id="search" placeholder="Search here">
									<button class="search-btn" type="submit">Search</button>
								</form>
							</div>
						</div>
						<!-- /SEARCH BAR -->

						<!-- ACCOUNT -->
						<div class="col-md-4 clearfix" style="margin-top: 20px;">
							<div class="header-ctn">
								<!-- Wishlist -->
								<div>
									<a href="/fav/checkLogin.do">
										<i class="fa fa-heart"></i>
										<span>WishList</span>
										<!--  <div class="qty" style="">2</div>-->
									</a>
								</div>
								<!-- /Wishlist -->

								<!-- Cart -->
								<div>
									<a href="/cart/checkLogin.do">
										<i class="fa fa-shopping-cart"></i>
										<span>Cart</span>
									</a>
								</div>
								<!-- /Cart -->

								<div>
									<a href="/mypage.do">
										<i class="far fa-user"></i>
										<span>MyPage</span>
									</a>
								</div>
							</div>
						</div>
						<!-- /ACCOUNT -->
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
	</header>

	<nav id="navigation">
			<!-- container -->
			<div class="container">
					<div class="col-md-12" style="margin-top:20px;">
						<ul class="nav navbar text-center">
							<li class="active"><a href="/home.do">Home</a></li>
							<li><a href="/allProduct.do">모든 상품</a></li>
							<li></li>
							<li></li>
						</ul>
				</div>
				<!-- /row -->
			<!-- /container -->
		</div>
		<!-- /BREADCRUMB -->
		</nav>
		<!-- /NAVIGATION -->

	
	
	
