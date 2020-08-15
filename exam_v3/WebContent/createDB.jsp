<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page import="kopo.service.*, kopo.dto.*" %>
<!-- 사용할 java file import -->
<!DOCTYPE html>
<!-- createDB.jsp -->
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<h3>테이블 생성</h3>
	<hr>
	<%
		ExamService examService = new ExamServiceImpl();
		examService.createDB();
	%>
</body>
</html>