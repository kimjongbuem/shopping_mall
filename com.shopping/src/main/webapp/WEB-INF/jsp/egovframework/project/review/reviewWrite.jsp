<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RePut</title>
</head>
<body>
	<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="">
					<form action="/review/write.do" method="post">
					<input type="hidden" id="userId" name="userId" value="${userId}" required/>
					<input type="hidden" id="productId" name="productId" value="${productId}" required/>
					
					<div class="col-md-12">
						<div>
							<strong>작성자</strong>
							<input class="input" name="name" type="text" value="${userName}" readonly>
						</div>
						<textarea id="detail" name="detail" required></textarea>
						    <script>
						      $('#detail').summernote({
						        placeholder: 'insert plz...',
						        tabsize: 2,
						        height: 300,
						        toolbar: [
						          ['style', ['style']],
						          ['font', ['bold', 'underline', 'clear']],
						          ['color', ['color']],
						          ['para', ['ul', 'ol', 'paragraph']],
						          ['table', ['table']],
						          ['view', ['fullscreen', 'codeview', 'help']]
						        ]
						      });
						    </script>
					 </div>
					 <input type="submit" class="btn btn-primary" style="float :right; margin-right: 15px; font-size: 20px;"value="리뷰 등록" />
					 </form>
				</div>
			</div>
	</div>
</body>
</html>