<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- header -->
<script src="js/header.js"></script>
<link rel="stylesheet" href="css/egovframework/header.css">
	<header>
		<div id="header-first">
			<div id="logo">
				<a href="/main.do"><img alt="logo" src="/images/logo.png"/></a>
			</div>
			
			<div id="searchForm">
				<form method="post" action="">
					<div class="input-group">
					  <div class="form-outline">
					    <input type="search" id="search_text" class="form-control" placeholder="search" />
					    <label class="form-label" for="search_text"></label>
					  </div>
					  <button type="submit" class="btn btn-primary">
					    <i class="fas fa-search"></i>
					  </button>
					</div>
				</form>		
			</div>
			
			<div class="my-list">
				<ul>
					<li><a href="#"><img alt="바구니" width="40px" height="40px" src="images/jang.png"/></a></li>
					<li><a href="#"><img alt="찜" width="40px" height="40px" src="images/heart.png"/></a></li>
					<li><a href="#"><img alt="마이" width="40px" height="40px" src="images/mypage.png"/></a></li>
				</ul>
			</div>
		</div>
		
		<div id="header-second">
				<div class="btn-group header-second-btn-box">
						<button type="button" id="header-sec-home"
							onclick=""
							class="btn btn-basic header-second-btn-group border-btm-red">
							홈</button>
				
						<button type="button" style=""
							class="btn btn-basic header-second-btn-group category" onclick="">카테고리</button>
						
						<button type="button" id="header-best" style=""
							class="btn btn-basic header-second-btn-group" onclick="">베스트</button>
			
						<button type="button" id="header-new" style=""
							class="btn btn-basic header-second-btn-group" onclick="">하루배송</button>
			
						<button type="button" id="header-new" style=""
							class="btn btn-basic header-second-btn-group" onclick="">신상</button>
							
				</div>
		</div>
		
	</header>
	
	<div id="category-box" class="category not_active">
			<ul class="menu category">
				<li>
					<a href="#">상의<br>
					</a>
					<ul class="sub-menu">
						<li><a href="#">티셔츠</a></li>
						<li><a href="#">후드</a></li>
						<li><a href="#">맨투맨</a></li>
						<li><a href="#">니트</a></li>
					</ul>
				</li>
				<li>
					<a href="#">바지</a>
					<ul class="sub-menu">
						<li><a href="#">청바지</a></li>
						<li><a href="#">슬랙스</a></li>
						<li><a href="#">면바지</a></li>
						<li><a href="#">트레이닝</a></li>
					</ul>
				</li>
				<li>
					<a href="#">주얼리</a>
					<ul class="sub-menu">
						<li><a href="#">귀걸이</a></li>
						<li><a href="#">목걸이</a></li>
						<li><a href="#">팔찌</a></li>
						<li><a href="#">반지</a></li>
					</ul>
				</li>
				<li>
					<a href="#">신발</a>
					<ul class="sub-menu">
						<li><a href="#">샌들</a></li>
						<li><a href="#">힐</a></li>
						<li><a href="#">스니커즈</a></li>
						<li><a href="#">부츠</a></li>
					</ul>
				</li>
				<li>
					<a href="#">아우터</a>
					<ul class="sub-menu">
						<li><a href="#">자켓</a></li>
						<li><a href="#">코트</a></li>
						<li><a href="#">패딩</a></li>
					</ul>
				</li>
			</ul>
		</div>

	
