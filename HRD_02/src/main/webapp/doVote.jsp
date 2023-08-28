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
<% 

if(request.getParameter("action")!=null && request.getParameter("action").equals("action")){

int result = new DAO().doVote(
	new DoVoteDTO(
			request.getParameter("v_jumin"),
			request.getParameter("v_name"),
			request.getParameter("v_no"),
			request.getParameter("v_time"),
			request.getParameter("v_area"),
			request.getParameter("v_confirm")
			) );
	if(result==1) out.print("<script>alert('정상적으로 등록 되었습니다!'); loaction.href='index.jsp'</script>");		
} %>
<h2>투표하기</h2>
<form action="doVote.jsp" name="voteForm">
<input type="hidden" name = "action" value="action">
<table border="1">
<tr>
	<th>주민번호</th>
	<td><input type="text" name="v_jumin"> </td>
</tr>
<tr>
	<th>성명</th>
	<td><input type="text" name="v_name"> </td>
</tr>
<tr>
	<th>투표번호</th>
	<td>
	<select name="v_no">
		<option ></option>
		<option value="1">[1]김후보</option>
		<option value="2">[2]이후보</option>
		<option value="3">[3]박후보</option>
		<option value="4">[4]조후보</option>
		<option value="5">[5]최후보</option>
	</select>
	 </td>
</tr>
<tr>
	<th>투표시간</th>
	<td><input type="text" name="v_time"> </td>
</tr>
<tr>
	<th>투표장소</th>
	<td><input type="text" name="v_area"> </td>
</tr>
<tr>
	<th>유권자확인</th>
	<td>
		<label> <input type="radio" name="v_confirm" value="Y"> 확인</label>
		<label> <input type="radio" name="v_confirm" value="N"> 미확인</label>
	</td>
</tr>
<tr>
	<td colspan="2"><input type="button" value="투표하기" onclick="voteSubmit()"> <input type="reset" value="다시하기" onclick="alert('정보를 지우고 다시 입력합니다!')"> </td>
</tr>
</table>
</form>

</section>
<jsp:include page="footer.jsp"/>
<script type="text/javascript">
	function voteSubmit(){
		if(document.voteForm.v_jumin.value==""){
			alert('주민번호가 입력되지 않았습니다!');
			document.voteForm.v_jumin.focus();
		}else if(document.voteForm.v_name.value==""){
			alert('성명이 입력되지 않았습니다!');
			document.voteForm.v_name.focus();
		}else if(document.voteForm.v_no.value==""){
			alert('투표번호가 선택되지 않았습니다!');
			document.voteForm.v_no.focus();
		}else if(document.voteForm.v_time.value==""){
			alert('투표시간이 입력되지 않았습니다!');
			document.voteForm.v_time.focus();
		}else if(document.voteForm.v_area.value==""){
			alert('투표장소가 입력되지 않았습니다!');
			document.voteForm.v_area.focus();
		}else if(document.voteForm.v_confirm.value==""){
			alert('유권자확인이 선택되지 않았습니다!');
			document.voteForm.v_confirm.focus();
		}else{
			document.voteForm.submit();
		}
	}

</script>
</body>
</html>