<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp"%>

<style type="text/css">
	.contents {
		margin-top: 150px;
	}
</style>

<script type="text/javascript">

</script>

<section>
	<div class="contents">
		<ul class="tebSearch">
			<li>
				<a href="<c:url value='/host/report/draft' />">정산 예정</a>
			</li>
			<li>
				<a href="<c:url value='/host/report/account' />">정산 완료</a>
			</li>
		</ul>
	</div>
</section>




<%@ include file="/WEB-INF/views/form/hostBottom.jsp" %>