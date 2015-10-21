<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css" type="text/css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>	
<script type="text/javascript">
	$(function(){
		var boxtop = $('#quickWrap').offset().top;
		$(window).scroll(function(){ //윈도우에 스크롤값이 변경될때마다
			$('#quickWrap').stop();//현재 박스를 멈추고
			$('#quickWrap').animate({"top": document.body.scrollTop + boxtop}, 500); 
			//바디의 스크롤값에 처음 지정해놓은 박스값의 Top을 더한후 애니메이션 효과 주기
		});   
	});
</script>         
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/custom.js"></script>
</head>
<body class="homepage">
<div id="container">
	<div id="header">
    	<h1><a href="/"><img src="images/logo.png" /></a></h1>
        <div class="clear"></div>
        <div class="right_cont">
			<ul class="util">
			<a href="../member/login.jsp">로그인</a>
			<a href="../member/join.jsp">회원가입</a>
            <a href="/login">고객센터!</a>
			</ul>
			<p>공식메일 <span class="letter_zero">master@sdinsight.co.kr</span></p>
		</div>
    </div>
    
    <div id="nav">
    	<ul class="sf-menu dropdown">
           
            
            <li><a class="has_submenu" href="examples.html">주제별 강의</a>
            	<ul>
                	<li><a href="page.html">경제|금융</a></li>
                    <li><a href="noslides.html">자산관리</a></li>
                    <li><a href="#">생활솔루션</a></li>
                    <li><a href="#">경영|직무능력</a></li>
                    <li><a href="#">신기술/미래</a></li>
                    <li><a href="#">인문|교양|예술</a></li>
                </ul>
                
            </li>
            <li><a class="has_submenu" href="examples.html">유형별 강의</a>
            	<ul>
                	<li><a href="page.html">주말강좌</a></li>
                    <li><a href="noslides.html">워크샾</a></li>
                    <li><a href="#">집중특강</a></li>
                    <li><a href="#">캠프</a></li>
                    <li><a href="#">지식쿠폰</a></li>
                </ul>
            </li>
             <li><a class="has_submenu" href="examples.html">커뮤니티</a>
            	<ul>
                	<li><a href="page.html">수강생 네트워크</a></li>
                    <li><a href="noslides.html">우리끼리 상담</a></li>
                    <li><a href="#">이런 강의를 원해요</a></li>
                    <li><a href="#">강의후기</a></li>
                    <li><a href="#">강의갤러리</a></li>
                </ul>
            </li>
            <li><a class="has_submenu" href="examples.html">세미나</a></li>
        </ul>
    </div>
    
    <div id="slides-container" class="slides-container">
        <div id="slides">
            <div>
                <div class="slide-image"><img src="images/slide-1.jpg" alt="Slide #1 image" /></div>
                <div class="slide-text">
                    <h2>시작하세요</h2>
                    <p>여러 외국인과 대화를 시작하세요.</p>
                    <p class="frontpage-button">
                    	<a href="#">참여하기</a>
                    </p>
                </div>
            </div>
            
            <div>
            	<h2>다양한 국가의 사람들과 함께</h2>
                <p>These slides can contain anything a webpage can! HTML, Javascript, images, flash or whatever! They're completely easy to edit and add to as well, no need to bother editing or even going anywhere near some confusing Javascript files, simply add a &lt;div&gt;&lt;/div&gt; tag with your slider content to the "slides" contain - it takes just seconds to do!</p>
                <p>These slides work using the absolutely wonderful lightweight jQuery plugin <a href="http://plugins.jquery.com/project/jFlow">jFlow</a>, originally written by Kean Loong and modified by both Mauro Belgiovine and spyka Webmaster. The script has been licensed under the open source MIT license, so feel free to play around and modify it as much or as little as you wish!</p>
            </div>
            <div>
                <div class="slide-image slide-image-right"><img src="images/slide-2.jpg" alt="Slide #3 image" /></div>
                <div class="slide-text">
                    <h2>대화를 해보세요</h2>
                    <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Pellentesque venenatis sagittis enim. Maecenas ligula erat, egestas congue, varius nec, sagittis nec, purus. In neque. Curabitur at metus tincidunt dui tristique molestie. Donec porta molestie tortor. Fusce euismod consectetuer sapien. Fusce ac velit.</p>
                </div>
            </div>
		</div>
        <div class="controls"><span class="jFlowNext"><span>Next</span></span><span class="jFlowPrev"><span>Prev</span></span></div>        
        <div id="myController" class="hidden"><span class="jFlowControl">Slide 1</span><span class="jFlowControl">Slide 1</span><span class="jFlowControl">Slide 1</span></div>
    </div>
        
<div id="body" >
	<div id="findNavBar" >
	<span class="create-button">
	<a href="#">개설하기</a>
	
	</span>
	</div>
			
</div>
 
	
<div id="footer">
  <div class="footer-content"></div>
</div>

<div id="quickWrap">
	<div class="menu_list">
		<ul class="menu">
			<li>1</li>
			<li>2</li>
			<li>3</li>
			<li>4</li>
			<li>5</li>	
		</ul>
	</div>
</div>          
</div>

 
</body>
</html>
