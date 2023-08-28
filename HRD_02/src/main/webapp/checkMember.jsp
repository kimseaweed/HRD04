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

<h2>후보조회</h2>
<table border="1">
<tr>
	<th>후보번호</th>
	<th>성명</th>
	<th>소속정당</th>
	<th>학력</th>
	<th>주민번호</th>
	<th>지역구</th>
	<th>대표전화</th>
</tr>
<% 
List<MemberDTO> list = new DAO().getMember();
for(MemberDTO dto : list){%>
<tr>
	<td><%=dto.getM_no() %></td>
	<td><%=dto.getM_name() %></td>
	<td><%=dto.getP_name() %></td>
	<td><%=dto.getP_school() %></td>
	<td><%=dto.getM_jumin()%></td>
	<td><%=dto.getM_city()%></td>
	<td><%=dto.getP_tel()%></td>
</tr>
<%} %>
</table>


</section>
<jsp:include page="footer.jsp"/>
</body>
</html>