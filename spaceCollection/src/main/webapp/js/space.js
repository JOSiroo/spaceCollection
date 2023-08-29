/*space.js*/

	var contextPath = "/spaceCollection";

	function validate_spaceName(spaceName) {
		var pattern = new RegExp(/^[a-zA-Zㄱ-ㅎ가-힣0-9()\[\]\-.,]*$/g);
		return pattern.test(spaceName); //정규식과 일치하면 true
		/* 정규식 /^[0-9]*$/g
		0 에서 9사이의 숫자로 시작하거나 끝나야 한다는 의미 (^는 시작, $는 끝을 의미)
		닫기 대괄호(]) 뒤의 * 기호는 0번 이상 반복		 */
	}

	
	
	