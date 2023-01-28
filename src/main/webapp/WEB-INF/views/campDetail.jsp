<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*,com.campick.user.model.*"%>
   	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     
    <%  UserDto loginUser = (UserDto)session.getAttribute("loginUser");%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>CAMPICK</title>
    <link rel="stylesheet" href="/css/campDetail.css">
</head> 
<body>
    <div id="container">
    <header>
        <div id="logo">
            <a href="/">
                <h1>CAMPICK</h1>
            </a>
        </div>
        <div id="inform">
           <c:choose>
           	 <c:when test="${loginUser==null}">
           	 <ul>
              	<li><a href="/user/login">로그인</a></li>
           	 </ul>
            </c:when>
           <c:otherwise>
             <ul>
            	<li><a href="/user/logout">로그아웃</a></li>
         	    <li><a href="/mypage/zzimlist?id=${loginUser.id}">마이페이지</a></li>
           		<li style="color:white;"><%=loginUser.getName() %>님</li>
           	 </ul>
           </c:otherwise>
           </c:choose>
<!--             <ul>
                <li><a href="login.jsp">로그인</a></li>
            </ul> -->
        </div>
    </header>

    <nav>
        <ul id="topMenu">
            <li><a href="/">캠핑장찾기</a></li>
            <li><a href="/tag/search">태그로 찾기</a></li>
            <li><a href="/pick/list">캠핑 예측Pick</a></li>
            <li><a href="/board/list">커뮤니티</a></li>
            </ul>
    </nav>
    <div id="contents">
    <div class="headline">
    <h1>${scDto.camp_name }</h1>
    <h2>캠핑장 정보</h2>
    </div>
    <div class="tab">
        <div class="main" style="text-align:center">
 
            <input id="tab1" type="radio" name="tabs" checked> 
            <label for="tab1">시설정보</label>
         
            <input id="tab2" type="radio" name="tabs">
            <label for="tab2">위치정보</label>
            <input id="tab3" type="radio" name="tabs">
            <label for="tab3">날씨정보</label>

            <section id="content1" style="margin-bottom:20px;">
              <c:if test="${giDto != null }">
                <div class="carousel-wrapper">
                  <div class="carousel">
                    <img src="${giDto.imgUrl1 }">
	                <img src="${giDto.imgUrl2 }">
	                <img src="${giDto.imgUrl3 }">
                  </div>
          		
                  <button class="prev" type="button" id="prevButton">&lt;</button>
   			      <button class="next" type="button" id="nextButton">&gt;</button>
                </div>
              </c:if>
                <table>
                    <tr>
                    	<th width="100px">소개글</th>
                    	<td id="intro">${scDto.intro }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>주소</th>
                        <td>${scDto.addr }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>번호</th>
                        <td>${scDto.tel }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>캠핑장 유형</th>
                        <td>${scDto.facility }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>캠핑장 환경</th>
                        <td>${scDto.place }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>테마</th>
                        <td>${scDto.thema }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>놀거리</th>
                        <td>${scDto.playPlace }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>계절</th>
                        <td>${scDto.season }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>가능한 날</th>
                        <td>${scDto.operdate }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>대여장비</th>
                        <td>${scDto.eqpmnlendcl }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>체험,프로그램</th>
                        <td>${scDto.exprnprogrm }</td>
                    </tr>
                    <tr>
                        <th width="100px" height=50px>홈페이지</th>
                        <td><a href="${scDto.homepage }">${scDto.homepage }</a></td>
                    </tr>
                </table>
            </section>
            <section id="content2" style="margin-bottom:20px;">
                <iframe
 				  width="800"
 				  height="600"
                  style="border:0"
                  loading="lazy"
                  allowfullscreen
                  referrerpolicy="no-referrer-when-downgrade"
                  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyBQtz7kuCJWv0E91gGUnpX8bIsmvfj4TcM
                    &q=${scDto.camp_name },${scDto.addr }&region=KR&language=ko">
				</iframe>
            </section>
            <section id="content3" style="margin-bottom:20px;">
                06:00 발표 기준 5일간 날씨 예보
            <table id="weather">

            	<tr>
            		<th>구분</th>
            		<td><c:out value="${weatherList['monthValue']}"/>월 <c:out value="${weatherList['dayOfMonth']+1}"/>일</td>
            		<td><c:out value="${weatherList['monthValue']}"/>월 <c:out value="${weatherList['dayOfMonth']+2}"/>일</td>
            		<td><c:out value="${weatherList['monthValue']}"/>월 <c:out value="${weatherList['dayOfMonth']+3}"/>일</td>
            		<td><c:out value="${weatherList['monthValue']}"/>월 <c:out value="${weatherList['dayOfMonth']+4}"/>일</td>
            		<td><c:out value="${weatherList['monthValue']}"/>월 <c:out value="${weatherList['dayOfMonth']+5}"/>일</td>
            		</tr>
                <tr>
                   <th>예상최저기온(℃)</th>
                   <td><c:out value="${weatherList['taMin3']}"/></td>
                   <td><c:out value="${weatherList['taMin4']}"/></td>
                   <td><c:out value="${weatherList['taMin5']}"/></td>
                   <td><c:out value="${weatherList['taMin6']}"/></td>
                   <td><c:out value="${weatherList['taMin7']}"/></td>
                </tr>
                <tr>
                   <th>예상최고기온(℃)</th>
                   <td><c:out value="${weatherList['taMax3']}"/></td>
                   <td><c:out value="${weatherList['taMax4']}"/></td>
                   <td><c:out value="${weatherList['taMax5']}"/></td>
                   <td><c:out value="${weatherList['taMax6']}"/></td>
                   <td><c:out value="${weatherList['taMax7']}"/></td>
                </tr>
                <tr>
                   <th>최저기온 하한범위(℃)</th>
                   <td><c:out value="${weatherList['taMin3Low']}~${weatherList['taMin3High']}"/></td>
                   <td><c:out value="${weatherList['taMin4Low']}~${weatherList['taMin4High']}"/></td>
                   <td><c:out value="${weatherList['taMin5Low']}~${weatherList['taMin5High']}"/></td>
                   <td><c:out value="${weatherList['taMin6Low']}~${weatherList['taMin6High']}"/></td>
                   <td><c:out value="${weatherList['taMin7Low']}~${weatherList['taMin7High']}"/></td>
                </tr>
                <tr>
                   <th>최고기온 하한범위(℃)</th>
                   <td><c:out value="${weatherList['taMax3Low']}~${weatherList['taMax3High']}"/></td>
                   <td><c:out value="${weatherList['taMax4Low']}~${weatherList['taMax4High']}"/></td>
                   <td><c:out value="${weatherList['taMax5Low']}~${weatherList['taMax5High']}"/></td>
                   <td><c:out value="${weatherList['taMax6Low']}~${weatherList['taMax6High']}"/></td>
                   <td><c:out value="${weatherList['taMax7Low']}~${weatherList['taMax7High']}"/></td>
                </tr>
            </table>
            </section>
    </div>
</div>
</div>

<footer>

</footer>
</div>
</body>
	<script>

		const prevButton = document.querySelector('.prev');
		const nextButton = document.querySelector('.next');
		const carousel = document.querySelector('.carousel');
		
		let index = 0;
		
		prevButton.addEventListener('click', function () {
			   if (index === 2){
				   carousel.style.transform = 'translate(-840px,0)';
				   index -= 1;
			   }else if (index === 1){
				   carousel.style.transform = 'translate(0,0)';
				   index -=1;
			   }else if (index === 0){
				   return;
			   }
		});
		nextButton.addEventListener('click', function () {
			   if (index === 0){
				   carousel.style.transform = 'translate(-840px,0)';
				   index += 1;
			   }else if (index === 1){
				   carousel.style.transform = 'translate(-1680px,0)';
				   index +=1;
			   }else if (index === 2){
				   return;
			   }
		});
	</script>

</html>