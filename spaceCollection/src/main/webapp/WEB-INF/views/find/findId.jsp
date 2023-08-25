<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스페이스 컬렉션ID찾기 &lt; 스페이스컬렉션</title>
	<link rel="stylesheet" type="text/css" href="https://ssl.nexon.com/s3/membership/global.css" />
	<link rel="stylesheet" type="text/css" href="https://ssl.nexon.com/s3/membership/find2.css" />

<script type="text/javascript">
	try {
    (function (w, d, s, l, i) { w[l] = w[l] || []; w[l].push({ 'gtm.start': new Date().getTime(), event: 'gtm.js' }); var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f); })(window, document, 'script', 'dataLayer', 'GTM-PSZ9ZLQ');
  }
  catch (ex) { }
</script>

	<script type="text/javascript" src="https://ssl.nexon.com/s1/jquery/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_head.js" charset="euc-kr"></script>
	<script type="text/javascript" src="../js/MemberUtil.js?v=638278049305424567"></script>
	<script type="text/javascript" src="../js/jquery.alphanumeric.js"></script>
	<script type="text/javascript" src="../js/jquery.center.js"></script>
	<script type="text/javascript" src="../js/jquery.popupWindow.js"></script>
	<script type="text/javascript" src="../js/jquery.autotab.js"></script>	
</head>
<body>
	<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_bodystart.js" charset="euc-kr"></script>
<!-- 	<script type="text/javascript">	
		$(function () {

						// 팝업 사이즈 재조정
			if (window.innerWidth < 600) {
				window.resizeTo(630, 701);
			}
		

			$("html").css("overflow", "hidden");			// 스크롤바 hidden 처리
			$("[finda2sopt]").click(function (event) {		// a2s log
				MemberA2S.Click("MEMBERS_FIND_ID", $(this).attr("finda2sopt"));
			});
		});
	</script>
    <form method="post" action="./findid.aspx" onsubmit="javascript:return WebForm_OnSubmit();" id="m_form">
<div class="aspNetHidden">
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="ItEwsBUJoCYs9H6JTwHuyTs6cSwqPYt8hMQrErpWZCWlFiZxTl3qfoCZk0F2kwasD9wofDqAl8GT8L5apa4W6Ey/NRRCbR9g8SsNY/DI/Ov+heQn4/1Nhsw0+zanHW4dIB2pJj+TBsu7ry7U7KquHTVaWMBZFIaNjDjxUpJKzUASzGXs5nSfqAoz3Y3WLJL8iSnkNxJdyZKRDI0a6KyBfMB2ZvwaznEi5ocitPR6FK/cUuQ2XOoCllA+WCbyS6NpV4MR1w==" />
</div> -->
<script type="text/javascript">
	$(function(){
		
		$("#ucSelectAuthMethod_btnConfirmOwnEmail").click(function(){
			window.open("${pageContext.request.contextPath}/email/emailCheck"
					,"이메일 인증 팝업","width=768,height=434,scrollbars=no, resizable=no");
		});
		
		
	});
//<![CDATA[
var theForm = document.forms['m_form'];
if (!theForm) {
    theForm = document.m_form;
}
function __doPostBack(eventTarget, eventArgument) {
    if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
        theForm.__EVENTTARGET.value = eventTarget;
        theForm.__EVENTARGUMENT.value = eventArgument;
        theForm.submit();
    }
}
//]]>
	
</script>


<!-- <script type="text/javascript">
//<![CDATA[
function WebForm_OnSubmit() {

                $(':hidden.pwdplain').each(function(){ $(this).val( $( $('#' + $(this).attr('id').replace( '_pass', '' ))[ 0 ] ).val() ); });
                $(':hidden.pwdhash').each(function(){ $(this).val( NgbSecurity.HashString( $( $('#' + $(this).attr('id').replace( '_pass', '' ))[ 0 ] ).val() ) ); });
				$(':password').each( function() { $(this).val( '' ); } );
			
return true;
}
//]]>
</script> -->

<div class="aspNetHidden">

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="5006EFBC" />
</div>
		<!-- width:610px;height:620px; -->
		<!-- 실제 컨텐츠 영역 -->
		

<!-- <script type="text/javascript">
	$(function () {
		$("#ucSelectAuthMethod_btnConfirmMobilePhone").addPostbackHandler({
			handler: function () {
				PopupWindow({ height: 550, width: 425, centerBrowser: 1, windowName: 'pop_mobilephone', windowURL: '/auth/owner_start.aspx?method=1&certifyReq=RvlIbnWIeYZyMnzaFFX2sfY_GYoUdfhtQhzxqWEMA6G2zyOa57LjdnQaP3ckxsK_z36DgXuE_XgwJiL9lxmJKXU~1DJz7_BcfDBFrrZaqKA~~T6TmnlYvPS23kTOV37wiop_KuPQM1MLcflwCigUffpw_JdssbEZNdoamVpkAjh2mmFbRC6KlT_8FYPktVJGUfy' });
			}
		});

		$("#ucSelectAuthMethod_btnConfirmCard").addPostbackHandler({
			handler: function () {
				PopupWindow({ height: 500, width: 500, centerBrowser: 1, windowName: 'pop_mobilephone', windowURL: '/auth/card_start.aspx?certifyReq=sf1re4pbXip6DQsDbWp5fd70L8KTVMCJTxIVBOGMy7IG1DaxWVexzIJGLPyJfr2TbYVRfJtkD7vEaKW3Ju8Q1Jb_EwRdeRAtEqhWYhUJIficjLxEtqrdPsGpDIZKYzx207mQp1nrWqDfnZyADnPhtbEDMjw~3PcPVAEFbj1gXTiH7uEA' });
			}
		});
	});

	var Confirm_MobilePhone = function (response, data) {
		$('#Certification_hResponse_data').val(data);
		$('#Certification_hResponse').val(response);
		__doPostBack("ucSelectAuthMethod$btnConfirmMobilePhone", "");
	};

	var Confirm_Card = function (response, data) {
		$('#Certification_hResponse_data').val(data);
		$('#Certification_hResponse').val(response);
		__doPostBack("ucSelectAuthMethod$btnConfirmCard", "");
	};
</script> -->
<div class="popupFind2">
	<ul class="find2Tab">
		<li class="id"><a class="on">스페이스 컬렉션ID찾기</a></li>
		<li class="password"><a href="<c:url value='/guest/findPwd'/>" finda2sopt="FindPwd">비밀번호찾기</a></li>		<!-- A090 -->
	</ul>
    <h2 class="hiddenTit">아이디 찾기</h2>
	<div class="contents">
		<p class="stit">스페이스 컬렉션ID 찾기를 위한 본인확인 방법을 선택해주세요.</p>
		<ul class="authNType">
			<li><a href="<c:url value='/email/emailCheck'/>" id="ucSelectAuthMethod_btnConfirmOwnEmail" name="ucSelectAuthMethod$btnConfirmOwnEmail" memberbutton="true" class="auth4" finda2sopt="UEmail">
					<span class="txt1">이메일 인증</span>
					<span class="txt2">등록된 이메일로 인증</span>
					<span class="txt3">인증하기</span>
				</a></li>
            <li><a href="#" id="ucSelectAuthMethod_btnConfirmMobilePhone" name="ucSelectAuthMethod$btnConfirmMobilePhone" memberbutton="true" class="auth1" title="휴대폰 인증" finda2sopt="Phone"><span class="txt1">휴대폰 인증</span><span class="txt2">고객님 명의의 휴대폰으로 인증</span><span class="txt3">인증하기</span></a></li>       <!-- A002 -->
            <li><a href="#" id="ucSelectAuthMethod_btnConfirmCard" name="ucSelectAuthMethod$btnConfirmCard" memberbutton="true" class="auth7" title="신용/체크카드 인증" finda2sopt="Card"><span class="txt1">신용/체크카드 인증</span><span class="txt2">고객님 명의의 신용카드 또는 체크카드로 인증</span><span class="txt3">인증하기</span></a></li>		<!-- A506 -->
		</ul>
	</div>
    <div class="noticeSec">
		<ul>
			<li>본인확인된 계정만 스페이스 컬렉션ID찾기가 가능합니다.</li>
		</ul>
	</div>
</div>

<input type="hidden" id="Certification_hResponse" name="Certification_hResponse" value="" />
<input type="hidden" id="Certification_hResponse_data" name="Certification_hResponse_data" value="" />

<script type="text/javascript">MemberA2S.Contents("MEMBERS_FIND_ID", "TryFindId");	//A001 </script>
				<script type='text/javascript'>
					$('[memberbutton=true]').click(
						function(event)
						{
							if( $(this).data('validatorCol') != null )
							{
								for( var i = 0; i < $(this).data('validatorCol').length; i++ )
								{
									var retMsg = $(this).data('validatorCol')[ i ].validator();
									if( retMsg != null )
									{
										alert( retMsg );
										if( $(this).data('validatorCol')[ i ].id != null )
											$('#' + $(this).data('validatorCol')[ i ].id).focus();
										return false;
									}
								}
							}
							
							if( $(this).data('postbackHandler') != null )
								$(this).data('postbackHandler').handler();
							else
							{
								if( $(this).attr('iscrosspostback') == 'true' )
									location.href = $('#' + $(this).attr('id') + '_crosspostback').attr('href');
								else
									__doPostBack( $(this).attr('name'), '' );
							}
						
							return false;
						}
					);
				</script>
			</form>
	<script type="text/javascript" src="https://ssl.nexon.com/s1/global/ngb_bodyend.js" charset="euc-kr"></script>
</body>
</html>