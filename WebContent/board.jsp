<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "chat.app.ex.model.BoardDAO" %>
<%@ page import = "chat.app.ex.model.BoardBean" %>
<%@ page import = "java.util.List" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Board</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/index.css">
<style type="text/css">
	.wrapper-table{
	width: 85%;
	padding-left: 15%;
	padding-top:20px;
	padding-bottom: 26%;
	}
</style>
</head>
<body>
<!-- DAO를 통해 게시판에 있는 데이터베이스를 받아와서 객체에 list로써 받아왔다. -->
<%
BoardDAO dao = BoardDAO.getInstance();
List<BoardBean> list = dao.getList();
%>


<jsp:include page="index_nav.jsp" flush="false"/>
<div class="wrapper-table">
<table class="table table-hover">
<thead>
<tr>
	<th>번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>날짜</th>
	<th>조회수</th>
</tr>
</thead>
<tbody>

<c:set var = "list" value="<%=list%>"/>
<c:forEach var="list" items="${list}" varStatus="status">
<tr>
	<td>${status.count}</td>
	<td><a href="showWrite.jsp?index=${status.count}"><c:out value="${list.getTitle()}"/></a></td>
	<td><c:out value="${list.getNick()}"/></td>
	<td><c:out value="${list.getDate()}"/></td>
	<td><c:out value="${list.getClick()}"/></td>
</tr>
</c:forEach>

</tbody>
</table>
<button type="button" class="btn btn-default pull-right" onclick="location.href='write.jsp';">글쓰기</button>
<div class = "text-center">
	<ul class="pagination">
	 <li><a href="#">1</a></li>
	</ul>
</div>
</div>



<jsp:include page="index_foot.jsp" flush="false"/>
</body>
</html>