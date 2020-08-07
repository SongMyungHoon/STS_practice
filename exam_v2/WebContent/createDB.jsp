<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*, javax.sql.*, java.io.*"%>
<%@ page import="kopo.domain.*, kopo.dao.*" %>
<!-- 사용할 java file import -->
<!DOCTYPE html>
<!-- createTable.jsp -->
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<h3>테이블 생성</h3>
	<hr>
	<%
	try {
		ExamRepo.createDB();
	} catch (Exception e) {
		out.println("테이블 생성중 에러발생." + e);
	}
	%>
</body>
</html>