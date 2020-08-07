<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="service.*, domain.*"%>
    <!-- 사용할 java file import -->
<!DOCTYPE html>
<!-- allsetDB.jsp -->
<html>
<head>
	<meta charset="UTF-8">
	<title></title>
	
</head>
<body>
	<h3>실습 데이터 입력</h3>
	<%
		StudentService studentService = new StudentService();
			// insert할 Student 객체 생성하여 Array에 담는다.
			ExamRIO[] studentArray = {new ExamRIO("나연",209901,95,100,95),
							new ExamRIO("정연",209902,95,95,95),
							new ExamRIO("모모",209903,100,100,100),
							new ExamRIO("사나",209904,100,95,90),
							new ExamRIO("지효",209905,80,100,70),
							new ExamRIO("미나",209906,100,100,70),
							new ExamRIO("다현",209907,70,70,70),
							new ExamRIO("채영",209908,80,75,72),
							new ExamRIO("쯔위",209909,79,79,82)};
			// studentArray의 모든 element에 대해 for문 수행
			for(ExamRIO student : studentArray) {
		String status = studentService.insert(student);
		out.println(status + "<br>");
			}
	%>		
</body>
</html>