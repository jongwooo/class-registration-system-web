<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.Scanner"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>명지대학교 수강신청 시스템</title>
<!-- favicon -->
<link rel="shortcut icon" href="image/favicon.ico">
<!-- CSS Files -->
<link rel="stylesheet" href="style.css" type="text/css">
<!-- Bootstrap CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Questrial|Sunflower:300"
	rel="stylesheet">
<!--Jquery CDN-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
	<!-- NavBar -->
	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand"
			href="/Class_Registration_System/class.jsp?id=<%=request.getParameter("id")%>&name=<%=request.getParameter("name")%>">
			<img src="image/mju_logo.gif" alt="명지대 로고" width="30px" height="30px">
			<small style="font-family: Sunflower;">명지대학교 수강신청 시스템</small>
		</a>
		<div class="text-right">
			<a
				href="/Class_Registration_System/myBag.jsp?id=<%=request.getParameter("id")%>&name=<%=request.getParameter("name")%>"
				class="btn btn-outline-primary btn-sm">책가방</a> <a
				href="/Class_Registration_System/logout.jsp"
				class="btn btn-outline-primary btn-sm">로그아웃</a>
		</div>
	</nav>

	<!-- Select Class -->
	<div class="container">
		<p class="text-right">
			<small style="font-family: Sunflower;"><%=request.getParameter("name")%>
				님, 반갑습니다!</small>
		</p>
		<div class="row pl-3">
			<form class=""
				action="classView.jsp?id=<%=request.getParameter("id")%>&name=<%=request.getParameter("name")%>&page=class"
				method="post">
				<select name="campus" id="campus" onchange="campusChange()">
					<option value="캠퍼스 선택">캠퍼스 선택</option>
					<option value="용인캠퍼스">용인캠퍼스</option>
					<option value="서울캠퍼스">서울캠퍼스</option>
				</select> <select name="college" id="college">
					<option>분류 선택</option>
				</select> <select name="department" id="department">
					<option>분류 선택</option>
				</select> <input type="submit" class="btn btn-primary btn-sm" value="선택">
			</form>
		</div>
		<hr>
	</div>
	<div class="container">
		<%
			if (request.getParameter("campus") == null || request.getParameter("college") == null
					|| request.getParameter("department") == null) {
		%>
		<h5 class="lecture-list">강좌 선택</h5>
		<%
			} else {
		%>
		<h5 class="lecture-list">
			<%=request.getParameter("campus")%>
			/
			<%=request.getParameter("college")%>
			/
			<%=request.getParameter("department")%>
		</h5>
		<%
			}
		%>
	</div>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>강좌 번호</th>
					<th>강좌명</th>
					<th>담당 교수</th>
					<th>학점</th>
					<th>강의 시간</th>
					<th>담기</th>
					<th>신청</th>
				</tr>
			</thead>
			<tbody>
				<!-- Show Lectures -->
				<%
					try {
						String lecturePath = application.getRealPath("/WEB-INF/data/" + request.getParameter("campus") + "/"
								+ request.getParameter("college") + "/" + request.getParameter("department"));
						Scanner scanner = new Scanner(new File(lecturePath));

						while (scanner.hasNext()) {
							String lectureNum = scanner.next();

							String lectureName = scanner.next();
							String lectureName_en = java.net.URLEncoder.encode(lectureName, "UTF-8");

							String professor = scanner.next();
							String professor_en = java.net.URLEncoder.encode(professor, "UTF-8");

							String credit = scanner.next();
							String credit_en = java.net.URLEncoder.encode(credit, "UTF-8");

							String time = scanner.next();
							String time_en = java.net.URLEncoder.encode(time, "UTF-8");
				%>
				<tr>
					<td><%= lectureNum%></td>
					<td><%= lectureName%></td>
					<td><%= professor%></td>
					<td><%= credit%></td>
					<td><%= time%></td>
					<td><a href="/Class_Registration_System/addBag.jsp?id=<%=request.getParameter("id")%>&name=<%=request.getParameter("name")%>&campus=<%=request.getParameter("campus")%>&college=<%=request.getParameter("college")%>&department=<%=request.getParameter("department")%>&lectureNum=<%= lectureNum%>&lectureName=<%= lectureName_en%>&professor=<%= professor_en%>&credit=<%= credit_en%>&time=<%= time_en%>">담기</a></td>
					<td><a href="/Class_Registration_System/addSincheong.jsp?id=<%=request.getParameter("id")%>&name=<%=request.getParameter("name")%>&page=class&lectureNum=<%= lectureNum%>&lectureName=<%= lectureName_en%>&professor=<%= professor_en%>&credit=<%= credit_en%>&time=<%= time_en%>">신청</a></td>
				</tr>
				<%
						}

					} catch (FileNotFoundException e) {

					}
				%>

			</tbody>
		</table>
	</div>
	<!-- JS Files -->
	<script type="text/javascript" src="class.js"></script>

</body>

</html>
