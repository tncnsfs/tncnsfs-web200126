<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<html>
<body>


	<div class="row">
		<div class="col-lg-7">
			<div class="p-5">
				<div>
					<h3 class="page-header">디테일정보 조회</h3>
				</div>
				<div class="panel panel-default">
					<div class="panel-body">
						<!-- <form role="form" action="/board/register" method="post"> -->
						<div class="form-group">
							<%--   아래 ${board.bno } -> BoardController:public void get:model.addAttribute("board", service.get(bno)); 에서 가져옴  --%>
							<label>B_NO <input class="form-control" name='bno'
								value='<c:out value="${board.bno }"/>' readonly="readonly">
							</label>
						</div>
						</br>

						<div class="form-group">
							<label>성명 <input class="form-control" name='content'
								value='<c:out value="${board.content }"/>' readonly="readonly">
						</div>
						</br>
						<div class="form-group">
							<label>직위 <input class="form-control" name='zhiwei'
								value='<c:out value="${board.zhiwei }"/>' readonly="readonly">
						</div>
						</br>
						<div class="form-group">
							<label>소속 <input class="form-control" name='suoshu'
								value='<c:out value="${board.suoshu }"/>' readonly="readonly">
						</div>
						</br>
						<div class="form-group">
							<label>작성자 <input class="form-control" name='writer'
								value='<c:out value="${board.writer }"/>' readonly="readonly">
						</div>
					</div>
					<%-- 				<button data-oper='modify' class="btn btn-default">
					<a href="/board/modify?bno=<c:out value="${board.bno }"/>">Modify
					
				</button>
				<button data-oper='list' class="btn btn-info">
					<a href="/board/list">List</a>
				</button> --%>

					<button data-oper='modify' class="btn btn-default">Modify</button>
					<button data-oper='list' class="btn btn-info">List</button>

					<form id='operForm' action="/board/modify" method="get">
						<input type="hidden" id="bno" name="bno"
							value='<c:out value="${ board.bno}"/>'>
					</form>

					<!-- </form> -->
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action", "/board/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
		operForm.attr("action", "/board/list").submit();
		operForm.submit();
	});
	
});
</script>

</html>

<%@include file="../includes/footer.jsp"%>

