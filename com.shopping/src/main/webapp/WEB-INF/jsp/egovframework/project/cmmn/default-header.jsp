<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- header -->
<link rel="stylesheet" href="css/egovframework/header.css">
<div id="header">
	<header>
		<div class="inner">
			<div id="logo">
				<a href="/main.do"><img alt="logo" src=""/></a>
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
			
			<div id="nav">
				<nav>
					<a href="#">장바구니</a>
					<a href="#">찜</a>
					<a href="#">마이페이지</a>
				</nav>
			</div>
		</div>
	</header>
</div>
