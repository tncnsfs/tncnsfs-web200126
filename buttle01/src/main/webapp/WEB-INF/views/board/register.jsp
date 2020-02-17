<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>


<div class="row">
	<div class="col-lg-7">
		<div class="p-5">
			<div>
				<h3 class="page-header">정보 입력하기</h3>
			</div>
			<div class="panel panel-default">
				<!-- <div class="panel-heading">Board register</div> -->
				<div class="panel-body">
					<form role="form" action="/board/register" method="post">
						<div class="form-group">
							<label>title_사번 <input class="form-control" name='title'>
							</label>
						</div>
						</br>

						<div class="form-group">
							<label>content_성명 <input class="form-control"
								name='content'>
							</label>
						</div>
						<div class="form-group">
							<label>writer_작성자 <input class="form-control"
								name='writer'>
							</label>
						</div>
						</br>
						<div class="form-group">
							<label>zhiwei_직위 <input class="form-control"
								name='zhiwei'>
							</label>
						</div>
						</br>
						<div class="form-group">
							<label>suoshu_소속 <input class="form-control"
								name='suoshu'>
							</label>
						</div></br>
				</div>
				<button type="submit" class="btn btn-primary">Submit</button>
				<button type="reset" class="btn btn-primary">Reset</button>
				</form>
			</div>
		</div>
	</div>
</div>

<%@include file="../includes/footer.jsp"%>
