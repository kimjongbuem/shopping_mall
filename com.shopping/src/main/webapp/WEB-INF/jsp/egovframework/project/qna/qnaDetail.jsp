<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RePut</title>
</head>

<script type="text/javascript">
	function update(){
		$("#qna-form").attr("method","post");
		$("#qna-form").attr("action","/qnaUpdatePage.do");
		$("#qna-form").submit();
	}
	function remove(){
		if (!confirm("정말 삭제 하시겠습니까?")) {
            
        } else {
            alert("삭제되었습니다!");
            $("#qna-form").attr("method","post");
    		$("#qna-form").attr("action","/qna/remove.do");
    		$("#qna-form").submit();
        }
	}
</script>

<body>
	<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div>
				<form id="qna-form">
					<input type="hidden" id="userId" name="userId" value="${qna.userId}" required/>
					<input type="hidden" id="productId" name="productId" value="${qna.productId}" required/>
					<input type="hidden" id="qnad" name="qnaId" value="${qna.id}" required/>
					
					<div class="col-md-12">
						<div><strong>작성날짜 : ${qna.createDate}</strong></div>
						<input class="input" name="name" type="text" value="작성자 : ${userName}" readonly>
						<textarea id="detail" name="detail" class="form-control" rows="3" readonly>${qna.detail}</textarea>
					 </div>
						<c:if test="${userId eq qna.userId}">
							 <input type="button" onclick="update()" class="btn btn-primary" value="수정" style="float:right; margin-right: 15px;"/>
							 <input type="button" onclick="remove()" class="btn btn-primary" value="삭제" style="float:right; margin-right: 15px;"/>
						</c:if>
					</form>
				</div>
			</div>
	</div>
</body>
</html>