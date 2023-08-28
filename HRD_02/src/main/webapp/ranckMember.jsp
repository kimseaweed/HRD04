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

<h2>후보자 등수</h2>
<table border="1">
<tr>
 <th>후보번호</th>
 <th>성명</th>
 <th>총투표건수</th>
</tr>
<%
List<RankMemberDTO> list = new DAO().getRank();
for(RankMemberDTO dto : list){
%>
<tr>
	<td><%=dto.getNo() %></td>
	<td><%=dto.getName() %></td>
	<td><%=dto.getTotal() %></td>
</tr>
<%} %>
</table>

</section>
<jsp:include page="footer.jsp"/>
</body>
</html>