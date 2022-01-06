<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RePut</title>
</head>
<body>
	<body>
	<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div>
				<form id="qna-form" action="/qna/update.do" method="post">
					<input type="hidden" id="userId" name="userId" value="${qna.userId}" required/>
					<input type="hidden" id="productId" name="productId" value="${qna.productId}" required/>
					<input type="hidden" id="qnad" name="qnaId" value="${qna.id}" required/>
					
					<div class="col-md-12">
						<input class="input" name="name" type="text" value="작성자 : ${userName}" readonly>
						<textarea id="detail" name="detail" required>${qna.detail}</textarea>
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
					<input type="submit" class="btn btn-primary" value="수정" style="float:right; margin-right: 15px;"/>
				</form>
			</div>
		</div>
	</div>
</body>
</html>