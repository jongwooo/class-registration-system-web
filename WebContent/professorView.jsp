<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
  <%
    request.setCharacterEncoding("utf-8");
    String id  = request.getParameter("id");

    String campus = request.getParameter("campus");
    String campus_en = java.net.URLEncoder.encode(campus, "UTF-8");

    String college = request.getParameter("college");
    String college_en = java.net.URLEncoder.encode(college, "UTF-8");

    String department  = request.getParameter("department");
    String department_en = java.net.URLEncoder.encode(department, "UTF-8");

    String redirectUrl = "professor.jsp?id=" + id + "&campus=" + campus_en + "&college=" + college_en + "&department=" + department_en;
    response.sendRedirect(redirectUrl);
%>
