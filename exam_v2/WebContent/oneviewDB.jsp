<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page import="kopo.domain.*, kopo.dao.*" %>
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
			/* ExamRepo.getAllRecordById 를 호출
			 * ExamRIO 형태로 데이터를 받아온다. */
			ExamRIO exam = ExamRepo.getRecordById(studentId);
	%>
	<table cellspacint=1 width=600 border=1>
	<tr>
		<td width=50><p align=center>이름</p></td>
		<td width=50><p align=center>학번</p></td>
		<td width=50><p align=center>국어</p></td>
		<td width=50><p align=center>영어</p></td>
		<td width=50><p align=center>수학</p></td>
	</tr>
	<%		// ExamRIO 형태 데이터의 처리
			out.println("<tr>");
			out.println("<td width=50><p align=center>" + exam.getName() + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(exam.getStudentId()) + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(exam.getKor()) + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(exam.getEng()) + "</p></td>");
			out.println("<td width=50><p align=center>" + Integer.toString(exam.getMat()) + "</p></td>");
			out.println("<tr>");
		} catch (Exception e) {
			out.println("oneview 중 에러 발생." + e);
		}
	%>
	</table>
</body>
</html>