function clip(){
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}
		
		
	function resetQna(){
		document.getElementById('message-text').value="";
	}
			
			
			
	 function addComma(value){
		    value = value+"";
	        value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	        return value; 
	    }
	 
			
 	function deleteReview(reviewNum){
		if(confirm('리뷰를 삭제하시겠습니까?')){
			location.href = "<c:url value='/deleteReview?reviewNum="+reviewNum+"&spaceNum="+"${param.spaceNum}"+"'/>"
		}
   	}
	
	function deleteQna(qnaNum){
		if(confirm('QnA를 삭제하시겠습니까?')){
			location.href = "<c:url value='/deleteQnA?qnaNum="+qnaNum+"&spaceNum="+"${param.spaceNum}"+"'/>";
		}
    }
			