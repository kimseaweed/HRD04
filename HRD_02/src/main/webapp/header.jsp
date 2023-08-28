<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{padding:0;margin:0;}
h1,h2,h3{
	text-align: center;
	padding: 20px 30px
}
body{background-color: lightgray}
header,footer{background-color: gray}
nav{background-color: darkgray}
ul{display:flex;}
li{list-style: none; padding:5px 10px;}
a{text-decoration: none}
footer{
	position:absolute;
	bottom:0;
	width:100vw;
}
table{
	margin:30px auto;
	text-align: center;
}
td{
	padding:10px 20px;
}

</style>
</head>
<body>
<header> <h1>(과정평가형 정보처리산업기사) 지역구의원투표 프로그램 ver 2020-05</h1> </header>
<nav> <ul>

<li><a href="checkMember.jsp">후보조회</a></li>
<li><a href="doVote.jsp">투표하기</a></li>
<li><a href="checkVote.jsp">투표검수조회</a></li>
<li><a href="ranckMember.jsp">후보자등수</a></li>
<li><a href="index.jsp">홈으로</a></li> 
 
 </ul> </nav>
</body>
</html>