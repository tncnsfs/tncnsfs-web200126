<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-7">
		<div class="p-5">
			<div>
				<h3 class="page-header">디테일정보 수정</h3>
			</div>
			<div class="panel panel-default">
				<div class="panel-body">
					<form role="form" action="/board/modify" method="post">
						<div class="form-group">
							<%--   아래 ${board.bno } -> BoardController:public void get:model.addAttribute("board", service.get(bno)); 에서 가져옴  --%>
							<label>B_NO <input class="form-control" name='bno'
								value='<c:out value="${board.bno }"/>' readonly="readonly">
							</label>
						</div>
						</br>

						<div class="form-group">
							<label>사번 <input class="form-control" name='title'
								value='<c:out value="${board.title }"/>'>
						</div>
						<div class="form-group">
							<label>성명 <input class="form-control" name='content'
								value='<c:out value="${board.content }"/>'>
						</div>
						</br>
						<div class="form-group">
							<label>직위 <input class="form-control" name='zhiwei'
								value='<c:out value="${board.zhiwei }"/>'>
						</div>
						</br>
						<div class="form-group">
							<label>소속 <input class="form-control" name='suoshu'
								value='<c:out value="${board.suoshu }"/>'>
						</div>
						</br>
						<div class="form-group">
							<label>작성자 <input class="form-control" name='writer'
								value='<c:out value="${board.writer }"/>' readonly="readonly">
						</div>
						<div class="form-group">
							<label>updateDate <input class="form-control"
								name='updateDate'
								value='<fmt:formatDate 
								pattern="yyyy/MM/dd" 
								value="${board.updateDate }" />'
								readonly="readonly">
						</div>
				</div>
				<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
				<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
				<button type="submit" data-oper='list' class="btn btn-info">List</button>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");

		$('button').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");

			console.log(operation);

			if (operation == 'remove') {
				formObj.attr("action", "/board/remove");
			} else if (operation == 'list') {
				self.location = "/board/list";
				return;
			}

			formObj.submit();
		});
	});
</script>

<%@include file="../includes/footer.jsp"%>
