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
	<title>show Write</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/index.css">
	<style>
	.wrapper-write{
	width: 85%;
	padding-left: 30%;
	padding-top:60px;
	padding-bottom: 10px;
	}
	#contents{
	width:73%;
	}
	#title{
	height: 25;
	}
	</style>
</head>
<body>
<%
//board로 부터 받은 index를 가지고 제목과 내용을 뽑아낸다.
String index2 = request.getParameter("index");
int index = Integer.parseInt(index2)-1;
BoardDAO dao = BoardDAO.getInstance();
List<BoardBean> list = dao.getList();
String title = list.get(index).getTitle();
String content = list.get(index).getContent();

// 조회수 증가를 위한 부분
String time = list.get(index).getDate();
String click = list.get(index).getClick();
int click2 = Integer.parseInt(click)+1;
dao.click(time, click2);
%>

<jsp:include page="index_nav.jsp" flush="false"/>

<div class="wrapper-write">
	<input type="text" name="title" size="80px" value="<%=title%>" readonly>
	<br /><br />
	<textarea id="contents" name="content" rows=20 readonly><%=content%></textarea>
	<br />
	<button type="button" class="btn btn-default" onclick="location.href='board.jsp';">뒤로</button>
</div>

<jsp:include page="index_foot.jsp" flush="false"/>
</body>
</html>