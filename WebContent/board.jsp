<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import = "chat.app.ex.model.BoardDAO" %>
<%@ page import = "chat.app.ex.model.BoardBean" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.HashMap" %>

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
HashMap<String, Integer> map = new HashMap<String, Integer>();

List<BoardBean> totalList = dao.getList();
int size = totalList.size();
int totalSize = size;
if(size%10!=0 && size>10)
	size = (size/10) + 1;
else if(size < 10)
	size = 1;
else
	size = (size/10);
int i = 10;
int pageNum = 1;
int row = 1;
int high = 10;
if(request.getParameter("pageNum") != null){
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
	int tempNum = totalSize + 10;
	high = tempNum - (10*pageNum);
	row = high - 9;
	if(row<0)
		row = 1;
	map.put("row",row);
	map.put("high",high);
	i = high;
}else{
	int tempNum = totalSize + 10;
	high = tempNum - (10);
	row = high - 9;
	if(row<0)
		row = 1;
	map.put("row",row);
	map.put("high",high);
	i = high;
}

List<BoardBean> list = dao.getList(map);

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
<%int index = 0; %>
<c:forEach var="list" items="${list}">
<tr>
	<td><%=i--%></td>
	<td><a href="showWrite.jsp?pageNum=<%=pageNum%>&index=<%=index++%>&high=<%=high%>&row=<%=row%>"><c:out value="${list.getTitle()}"/></a></td>
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
	<%for(int k=1; k <= size; k++){ %>
	 <li><a href="board.jsp?pageNum=<%=k%>" ><%=k %></a></li>
	 <%} %>
	
	</ul>
</div>
</div>



<jsp:include page="index_foot.jsp" flush="false"/>
</body>
</html>