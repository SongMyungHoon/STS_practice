<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page import="kopo.service.*, kopo.dto.*" %>
<!--사용할 java file import-->
<!DOCTYPE html>
<!-- oneviewDB.jsp -->
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<h3>조회</h3>
	<hr>
	<%
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		try {
			ExamService examService = new ExamServiceImpl();
			ExamSIO examSIO = examService.selectOne(studentId);
	%>
	<table cellspacing=1 width=600 border=1>
	<tr>
		<td width=50><p align=center>이름</p></td>
		<td width=50><p align=center>학번</p></td>
		<td width=50><p align=center>국어</p></td>
		<td width=50><p align=center>영어</p></td>
		<td width=50><p align=center>수학</p></td>
	</tr>
	<%		// ExamRIO 형태 데이터의 처리
			out.println("<tr>");
			out.println("<td width=50><p align=center>" + examSIO.getName() + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(examSIO.getStudentId()) + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(examSIO.getKor()) + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(examSIO.getEng()) + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(examSIO.getMat()) + "</p></td>");
			out.println("<tr>");
		} catch (Exception e) {
			out.println("oneview 중 에러 발생." + e);
		}
	%>
	</table>
</body>
</html>