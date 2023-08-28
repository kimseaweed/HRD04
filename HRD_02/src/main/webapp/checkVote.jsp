<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="dto.*" %>
<%@ page import="DBPKG.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<section>

<h2>투표검수조회</h2>
<table border="1">
<tr>
 <th>성명</th>
 <th>생년월일</th>
 <th>나이</th>
 <th>성별</th>
 <th>후보번호</th>
 <th>투표시간</th>
 <th>유권자확인</th>
</tr>
<%
List<CheckVoteDTO> list = new DAO().getVote();
for(CheckVoteDTO dto : list){
%>
<tr>
	<td><%=dto.getName() %></td>
	<td><%=dto.getBirth() %></td>
	<td><%=dto.getAge() %></td>
	<td><%=dto.getGender() %></td>
	<td><%=dto.getNo() %></td>
	<td><%=dto.getTime() %></td>
	<td><%=dto.getConfirm() %></td>
</tr>
<%} %>
</table>

</section>
<jsp:include page="footer.jsp"/>
</body>
</html>