<%@include file="../includes/header.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
</head>
<body>

<div class="container-fluid">
	<div class="col-lg-12">
		<h1 class="h3 mb-2 text-gray-800">Tables</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="card shadow mb-4">
			<div class="panel-heading">
				<button id="regBtn" type="button" class="btn btn-xs pull-right">정보입력하기</button>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>No</th>
								<th>사번</th>
								<th>성명</th>
								<th>직위</th>
								<th>소속</th>
								<th>수정일</th>
							</tr>
						</thead>
						<tfoot>
							<tr>
								<th>No</th>
								<th>사번</th>
								<th>성명</th>
								<th>직위</th>
								<th>소속</th>
								<th>수정일</th>
							</tr>
						</tfoot>
						<tbody>
							<!--  아래 getlist 는 BoardController파일 중 list(Model model) 함수 에서 model.addAttribute("getlist", service.getList()); 참조함  -->
							<c:forEach items="${getlist }" var="board">
								<tr>
									<td><c:out value="${board.bno }" /></td>
									<td><a href='/board/get?bno=<c:out value="${board.bno }"/>'> <c:out value="${board.title }" />
									</a></td>
									<td><a href='/board/get?bno=<c:out value="${board.bno }"/>'> <c:out value="${board.content }" />
									</a></td>
									<td><c:out value="${board.zhiwei }" /></td>
									<td><c:out value="${board.suoshu }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${board.updateDate }" /></td>
								</tr>
							</c:forEach>
						<tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

	<!-- Modal 추가 -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">처리가 완료 되었습니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
	<%@include file="../includes/footer.jsp"%>

	<script type="text/javascript">
		$(document).ready(
				function() {
					var result = '<c:out value="${result}"/>';
					console.log('result001 ---->: ' + result);

					checkModal(result);
					
					history.replaceState({},null,null);

					function checkModal(result) {

						if (result == '' || history.state) {
							return;
						}

						if (parseInt(result) > 0) {
							$(".modal-body").html(
									"게시글 " + parseInt(result) + " 번이 등록 됨.");
						}

						$("#myModal").modal("show");

					}
					$("#regBtn").on("click", function() {
						self.location = "/board/register";
					});
				});
	</script>