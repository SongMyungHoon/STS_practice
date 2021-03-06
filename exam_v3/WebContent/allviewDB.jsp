<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page import="kopo.service.*, kopo.dto.*, java.util.*" %>
<!-- 사용할 java file import -->
<!DOCTYPE html>
<!-- allviewDB.jsp -->
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
</head>
<body>
	<h3>전체 데이터</h3>
	<hr>
	<%
	try {
		ExamService examService = new ExamServiceImpl();
		/* ExamRepo.getAllRecords를 호출
		 * ExamRIO 의 리스트 형태로 데이터를 받아온다. */
		List<ExamSIO> examSIOs = examService.selectAll();
	%>
	<table cellspacing=1 width=600 border=1>
	<tr>
		<td width=50><p align=center>이름</p></td>
		<td width=50><p align=center>학번</p></td>
		<td width=50><p align=center>국어</p></td>
		<td width=50><p align=center>영어</p></td>
		<td width=50><p align=center>수학</p></td>
	</tr>
	<%	// ExamRIO 의 리스트 형태 데이터의 처리
		for (int i = 0; i < examSIOs.size(); i++) {
			out.println("<tr>");
			
			out.println("<td width=50><p align=center>"
						+ "<a href='oneviewDB.jsp?studentId="
						// ExamRIO 의 리스트 형태 데이터 처리
						+ Integer.toString(examSIOs.get(i).getStudentId())
						+ "'>" + examSIOs.get(i).getName() + "</a></p></td>");
			
			out.println("<td width=50><p align=center>"
						+ "<a href='oneviewDB.jsp?studentId="
						+ Integer.toString(examSIOs.get(i).getStudentId()) + "'>"
						+ Integer.toString(examSIOs.get(i).getStudentId()) + "</a></p></td>");
			
			out.println("<td width=50><p align=center>"
						+ Integer.toString(examSIOs.get(i).getKor()) +"</p></td>");
			out.println("<td width=50><p align=center>"
					+ Integer.toString(examSIOs.get(i).getEng()) +"</p></td>");
			out.println("<td width=50><p align=center>"
					+ Integer.toString(examSIOs.get(i).getMat()) +"</p></td>");
			out.println("<tr>");
		}
	} catch (Exception e) {
		out.println("테이블 생성중 에러 발생." + e);
	}
	%>
	</table>
</body>
</html>