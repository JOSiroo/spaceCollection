<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/form/hostTop.jsp" %>

<style type="text/css">
	.start {
		padding-top: 100px;
		position: relative;
		width: 800px;
		margin-left: auto;
		margin-right: auto;
	}
	
	.proposal {
		width: 200px;
		height: 65px;
		text-decoration: none;
		background: #ffd014;
		color: white;
		border: 0;
		border-radius: 10px;
	}
	
	.registration {
		width: 200px;
		height: 65px;
		text-decoration: none;
		background: #704de4;
		color: white;
		border: 0;
		border-radius: 10px;
	}
	
</style>

<script type="text/javascript">
	$(function() {
		$('.proposal').click(function() {
			window.open('https://kr.object.ncloudstorage.com/scloud-service/web/spacecloud_host_proposal_20220713.pdf');
		});
	});
</script>


<section>
	<div class="start">
		<div class="startMain">
			<div class="item">
				<h1>지금 MZ세대들을 위한</h1>
				<h1>공간 비즈니스를 시작해보세요 !</h1>
			</div>
			<div class="item">
				<button class="proposal" >입점 제안서</button>
			</div>
			<div class="item">
				<button class="registration" >공간 등록하기</button>
			</div>
			
		</div>
	</div>

</section>




</body>
 </html>