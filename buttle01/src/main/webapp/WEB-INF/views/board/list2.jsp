<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<div class="container-fluid">
	<div class="col-lg-12">
		<h1 class="h3 mb-2 text-gray-800">Tables</h1>
	</div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="card shadow mb-4">
			<div class="card-header py-3">Board List Page</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<thead>
							<tr>
								<th>#번호</th>
								<th>부서</th>
								<th>이름</th>
								<th>작성일</th>
								<th>수정일</th>
							</tr>
						</thead>
						<tfoot>
							<th>#번호</th>
							<th>부서</th>
							<th>이름</th>
							<th>작성일</th>
							<th>수정일</th>
							</tr>
						</tfoot>
						<tbody>
							<c:forEach items="${getlist }" var="ziquMing">
								<tr>
									<td><c:out value="${ziquMing.bno }" /></td>
									<td><c:out value="${ziquMing.title }" /></td>
									<td><c:out value="${ziquMing.writer }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${ziquMing.regdate }" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${ziquMing.updateDate }" /></td>
								</tr>
							</c:forEach>
						<tbody>
					</table>
				</div>
			</div>
		</div>
	</div>

<%@include file="../includes/footer.jsp"%>