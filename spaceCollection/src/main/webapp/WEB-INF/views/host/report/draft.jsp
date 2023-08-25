<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	section {display: flex;
		justify-content: center;}

	.contents {
		margin-top: 150px;
	}
	
	.nav a {
		font-size: 22px;
		padding: 15px 250px 15px 250px;
		border-top: 2.5px solid #704de4;
		margin-bottom: 50px;
	}
	
	.draft {
		background: #704de4;
		color: white;
	}
	
	//
	.boxSearch {
		border: 3px solid #704de4;
	}
	
</style>

<script type="text/javascript">
	$(function() {
		
	});
</script>

<section>
	<div class="contents">
		<div class="nav">
			<a class="draft" href="<c:url value='/host/report/draft' />">정산 예정</a>
			<a class="account" href="<c:url value='/host/report/account' />">정산 완료</a>
		</div>
		<div class="boxSearch">
			<div class="boxInner">
				<div class="filter">
					<dl class="filterSelect">
						<dt>
							<label>결제기간</label>
						</dt>
						<dd>
							<input >
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</div>
</section>




<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>