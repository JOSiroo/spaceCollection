<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
 <script>
    
    //룰렛
    const $c = document.querySelector("canvas");
	const ctx = $c.getContext(`2d`);
	
	
	const product = [
	  "1박 쿠폰", '패키지 쿠폰', "룸 업그레이드", "쿠폰4", "5", "6", '7', "8", "9",
	];
	
	const colors = ["#dc0936", "#e6471d", "#f7a416", "#efe61f ", "#60b236", "#209b6c", "#169ed8", "#3f297e", "#87207b", "#be107f", "#e7167b"];
	
	const newMake = () => {
	    const [cw, ch] = [$c.width / 2, $c.height / 2];
	    const arc = Math.PI / (product.length / 2);
	  
	    for (let i = 0; i < product.length; i++) {
	      ctx.beginPath();
	      ctx.fillStyle = colors[i % (colors.length -1)];
	      ctx.moveTo(cw, ch);
	      ctx.arc(cw, ch, cw, arc * (i - 1), arc * i);
	      ctx.fill();
	      ctx.closePath();
	    }
	
	    ctx.fillStyle = "#fff";
	    ctx.font = "18px Pretendard";
	    ctx.textAlign = "center";
	
	    for (let i = 0; i < product.length; i++) {
	      const angle = (arc * i) + (arc / 2);
	
	      ctx.save()  ;
	
	      ctx.translate(
	        cw + Math.cos(angle) * (cw - 50),
	        ch + Math.sin(angle) * (ch - 50),
	      );
	
	      ctx.rotate(angle + Math.PI / 2);
	
	      product[i].split(" ").forEach((text, j) => {
	        ctx.fillText(text, 0, 30 * j);
	      });
	
	      ctx.restore();
	    }
	}
	
	const rotate = () => {
	  $c.style.transform = `initial`;
	  $c.style.transition = `initial`;
	  
	  setTimeout(() => {
	    
	    const ran = Math.floor(Math.random() * product.length);
	
	    const arc = 360 / product.length;
	    const rotate = (ran * arc) + 3600 + (arc * 3) - (arc/4);
	    
	    $c.style.transform = `rotate(-${rotate}deg)`;
	    $c.style.transition = `2s`;
	    
	    setTimeout(() => alert(`쿠폰 뽑기?! ${product[ran]} 어떠신가요?`), 2000);
	  }, 1);
	};
	
	newMake();
    //
</script>


<body>

	<div>
	  <canvas width="380" height='380'></canvas>  
	  <button onclick="rotate()">룰렛 돌리기</button>
	</div>
	

</body>
</html>